using System;
using Microsoft.Data.SqlClient;
using System.Windows.Forms;
using System.Data;
using static System.Runtime.InteropServices.JavaScript.JSType;
using System.Drawing;
using System.Transactions;
namespace Gamev1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        //view button
        private void btnview_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source = DESKTOP-2V92UF2\\SQLEXPRESS; Initial Catalog = gamev4; Integrated Security = True; Encrypt = True; Trust Server Certificate = True";

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    // Joining Game, Rental, Vendor, Users, and Client
                    string query = @"
            SELECT 
                G.GameID,
                G.Title AS GameTitle,
                G.ReleaseYear,
                R.RentalDate,
                R.RentID,
                V.vendorID,
                V.name AS VendorName,
                U.userID as ClientID
            FROM Game G
            LEFT JOIN Rental R ON R.GameID = G.GameID
            LEFT JOIN Supplies S ON G.GameID = S.GameID
            LEFT JOIN Vendor V ON G.vendorID = V.vendorID
            LEFT JOIN Users U ON R.ClientID = U.userID
            LEFT JOIN Client C ON U.userID = C.userID
        ";

                    SqlCommand insertcmd = new SqlCommand(query, connection);
                    SqlDataAdapter adapter = new SqlDataAdapter(insertcmd);
                    DataTable dataTable = new DataTable();
                    adapter.Fill(dataTable);
                    dataGridView1.DataSource = dataTable;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message, "Database Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }



        }
        //insert button
        private void btninsert_Click(object sender, EventArgs e)
        {   // 'using' will close the connection automatically
            using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-2V92UF2\\SQLEXPRESS;Initial Catalog=gamev4;Integrated Security=True;Trust Server Certificate=True"))
            {
                try
                {
                    con.Open();
                    SqlTransaction transaction = con.BeginTransaction();
                    // Insert into user
                    SqlCommand userCmd = new SqlCommand("INSERT INTO Users(userID) VALUES (@userID)", con, transaction);
                    userCmd.Parameters.AddWithValue("@userID", txtclientid.Text);
                    userCmd.ExecuteNonQuery();
                    // Insert into Client
                    SqlCommand clientCmd = new SqlCommand("INSERT INTO Client (userID) VALUES (@userID)", con, transaction);
                    clientCmd.Parameters.AddWithValue("@userID", txtclientid.Text);
                    clientCmd.ExecuteNonQuery();
                    // Insert into Vendor
                    SqlCommand vendorCmd = new SqlCommand("INSERT INTO Vendor (vendorID, name) VALUES (@vendorID, @name)", con, transaction);
                    vendorCmd.Parameters.AddWithValue("@vendorID", txtvendorid.Text);
                    vendorCmd.Parameters.AddWithValue("@name", txtvendorname.Text);
                    vendorCmd.ExecuteNonQuery();
                    // Insert into Game
                    SqlCommand gameCmd = new SqlCommand("INSERT INTO Game (GameID, Title, vendorID, ReleaseYear) VALUES (@GameID, @Title, @vendorID, @ReleaseYear)", con, transaction);
                    gameCmd.Parameters.AddWithValue("@gameID", txtgameid.Text);
                    gameCmd.Parameters.AddWithValue("@Title", txtgametitle.Text);
                    gameCmd.Parameters.AddWithValue("@vendorID", txtvendorid.Text);
                    gameCmd.Parameters.AddWithValue("@ReleaseYear", txtreleaseyear.Text);
                    gameCmd.ExecuteNonQuery();
                    // Insert into Supplies: vendor-game relationship
                    SqlCommand suppliesCmd = new SqlCommand("INSERT INTO Supplies (vendorID, GameID) VALUES (@vendorID, @GameID)",con, transaction);
                    suppliesCmd.Parameters.AddWithValue("@vendorID", txtvendorid.Text);
                    suppliesCmd.Parameters.AddWithValue("@GameID", txtgameid.Text);
                    suppliesCmd.ExecuteNonQuery();
                    // Insert into Rental
                    SqlCommand rentalCmd = new SqlCommand("INSERT INTO Rental (RentID, RentalDate, GameID, ClientID) VALUES (@RentID, @RentalDate, @gameID, @ClientID)", con, transaction);
                    rentalCmd.Parameters.AddWithValue("@RentID", txtrentalid.Text);
                    rentalCmd.Parameters.AddWithValue("@RentalDate", txtrentaldate.Value);
                    rentalCmd.Parameters.AddWithValue("@GameID", txtgameid.Text);
                    rentalCmd.Parameters.AddWithValue("@ClientID", txtclientid.Text);
                    rentalCmd.ExecuteNonQuery();
                    MessageBox.Show("Data inserted successfully!");
                    // 7. Insert into Retail: rental-client relationship
                    SqlCommand retailCmd = new SqlCommand("INSERT INTO Retail (RentID, ClientID) VALUES (@RentID, @ClientID)",con, transaction);
                    retailCmd.Parameters.AddWithValue("@RentID", txtrentalid.Text);
                    retailCmd.Parameters.AddWithValue("@ClientID", txtclientid.Text);
                    retailCmd.ExecuteNonQuery();
                    transaction.Commit();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Error: " + ex.Message);
                }
            }
        }
        //update button
        private void btnupdate_Click(object sender, EventArgs e)
        {
            try
            {
                string connectionString = "Data Source=DESKTOP-2V92UF2\\SQLEXPRESS;Initial Catalog=gamev4;Integrated Security=True;Trust Server Certificate=True";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    bool gameUpdated = false;
                    bool vendorUpdated = false;

                    // Update Game only if GameID is provided and at least one game field is filled
                    if (!string.IsNullOrWhiteSpace(txtgameid.Text) &&
                        (!string.IsNullOrWhiteSpace(txtgametitle.Text) ||
                         !string.IsNullOrWhiteSpace(txtreleaseyear.Text) ||
                         !string.IsNullOrWhiteSpace(txtvendorid.Text)))
                    {
                        string query = @"UPDATE Game 
                                 SET Title = ISNULL(NULLIF(@Title, ''), Title), 
                                     ReleaseYear = ISNULL(NULLIF(@ReleaseYear, ''), ReleaseYear), 
                                     VendorID = ISNULL(NULLIF(@vendorID, ''), VendorID)
                                 WHERE GameID = @GameID";

                        SqlCommand updatecmd = new SqlCommand(query, con);
                        updatecmd.Parameters.AddWithValue("@Title", txtgametitle.Text);
                        updatecmd.Parameters.AddWithValue("@ReleaseYear", txtreleaseyear.Text);
                        updatecmd.Parameters.AddWithValue("@vendorID", txtvendorid.Text);
                        updatecmd.Parameters.AddWithValue("@GameID", txtgameid.Text);

                        int rowsAffectedGame = updatecmd.ExecuteNonQuery();
                        gameUpdated = rowsAffectedGame > 0;

                        if (gameUpdated)
                            MessageBox.Show("Game updated successfully!");
                        else
                            MessageBox.Show("Game not found.");
                    }
                    else if (!string.IsNullOrWhiteSpace(txtgameid.Text))
                    {
                        MessageBox.Show("No update fields provided for Game.");
                    }

                    // Update Vendor only if VendorID and new VendorName are provided
                    if (!string.IsNullOrWhiteSpace(txtvendorid.Text) &&
                        !string.IsNullOrWhiteSpace(txtvendorname.Text))
                    {
                        string updateVendorQuery = @"UPDATE Vendor 
                                             SET name = @name 
                                             WHERE vendorID = @vendorID";

                        SqlCommand updateVendorCmd = new SqlCommand(updateVendorQuery, con);
                        updateVendorCmd.Parameters.AddWithValue("@name", txtvendorname.Text);
                        updateVendorCmd.Parameters.AddWithValue("@vendorID", txtvendorid.Text);

                        int rowsAffectedVendor = updateVendorCmd.ExecuteNonQuery();
                        vendorUpdated = rowsAffectedVendor > 0;

                        if (vendorUpdated)
                            MessageBox.Show("Vendor updated successfully!");
                        else
                            MessageBox.Show("Vendor not found.");
                    }
                    else if (!string.IsNullOrWhiteSpace(txtvendorid.Text))
                    {
                        MessageBox.Show("No update fields provided for Vendor.");
                    }
                    if (!gameUpdated && !vendorUpdated)
                    {
                        MessageBox.Show("No data was updated!");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
            }



        }

        private void btndelete_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show(
                "Are you sure you want to delete this game?",
                "Confirm Delete",
                MessageBoxButtons.YesNo,
                MessageBoxIcon.Warning);
            if (result == DialogResult.No)
            {
                return; // Stop the deletion if user says No
            }
            try
            {
                string connectionString = "Data Source=DESKTOP-2V92UF2\\SQLEXPRESS;Initial Catalog=gamev4;Integrated Security=True;Trust Server Certificate=True";
                using SqlConnection con = new SqlConnection(connectionString);
                con.Open();
                // 1) delete from Retail
                SqlCommand deleteRetailCmd = new SqlCommand("DELETE FROM Retail WHERE RentID IN (SELECT RentID FROM Rental WHERE GameID = @GameID)",con);
                deleteRetailCmd.Parameters.AddWithValue("@GameID", txtgameid.Text);
                deleteRetailCmd.ExecuteNonQuery();
                // 2) delete from Rental table
                SqlCommand deleteRentalCmd = new SqlCommand("DELETE FROM Rental WHERE GameID = @GameID", con);
                deleteRentalCmd.Parameters.AddWithValue("@GameID", txtgameid.Text);
                deleteRentalCmd.ExecuteNonQuery();
                // 3) delete from Supplies 
                SqlCommand deleteSuppliesCmd = new SqlCommand("DELETE FROM Supplies WHERE GameID = @GameID",con);
                deleteSuppliesCmd.Parameters.AddWithValue("@GameID", txtgameid.Text);
                deleteSuppliesCmd.ExecuteNonQuery();
                // 3) Then delete from Game table
                SqlCommand cmd = new SqlCommand("DELETE FROM Game WHERE GameID = @GameID", con);
                cmd.Parameters.AddWithValue("@GameID", txtgameid.Text);
                int rowsAffected = cmd.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    MessageBox.Show("Game deleted successfully!");
                }
                else
                {
                    MessageBox.Show("Game not found.");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
            }
        }
    }

}













            
        
    

