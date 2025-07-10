namespace Gamev1
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            txtgameid = new TextBox();
            txtreleaseyear = new TextBox();
            txtgametitle = new TextBox();
            txtvendorname = new TextBox();
            txtvendorid = new TextBox();
            txtclientid = new TextBox();
            txtrentalid = new TextBox();
            txtrentaldate = new DateTimePicker();
            dataGridView1 = new DataGridView();
            btninsert = new Button();
            btnupdate = new Button();
            btndelete = new Button();
            btnview = new Button();
            ((System.ComponentModel.ISupportInitialize)dataGridView1).BeginInit();
            SuspendLayout();
            // 
            // txtgameid
            // 
            txtgameid.Location = new Point(67, 124);
            txtgameid.Name = "txtgameid";
            txtgameid.Size = new Size(100, 23);
            txtgameid.TabIndex = 0;
            // 
            // txtreleaseyear
            // 
            txtreleaseyear.Location = new Point(437, 124);
            txtreleaseyear.Name = "txtreleaseyear";
            txtreleaseyear.Size = new Size(100, 23);
            txtreleaseyear.TabIndex = 3;
            // 
            // txtgametitle
            // 
            txtgametitle.Location = new Point(243, 124);
            txtgametitle.Name = "txtgametitle";
            txtgametitle.Size = new Size(100, 23);
            txtgametitle.TabIndex = 4;
            // 
            // txtvendorname
            // 
            txtvendorname.Location = new Point(243, 205);
            txtvendorname.Name = "txtvendorname";
            txtvendorname.Size = new Size(100, 23);
            txtvendorname.TabIndex = 6;
            // 
            // txtvendorid
            // 
            txtvendorid.Location = new Point(67, 205);
            txtvendorid.Name = "txtvendorid";
            txtvendorid.Size = new Size(100, 23);
            txtvendorid.TabIndex = 5;
            // 
            // txtclientid
            // 
            txtclientid.Location = new Point(67, 43);
            txtclientid.Name = "txtclientid";
            txtclientid.Size = new Size(100, 23);
            txtclientid.TabIndex = 8;
            // 
            // txtrentalid
            // 
            txtrentalid.Location = new Point(67, 293);
            txtrentalid.Name = "txtrentalid";
            txtrentalid.Size = new Size(100, 23);
            txtrentalid.TabIndex = 7;
            // 
            // txtrentaldate
            // 
            txtrentaldate.Location = new Point(234, 290);
            txtrentaldate.Name = "txtrentaldate";
            txtrentaldate.Size = new Size(194, 23);
            txtrentaldate.TabIndex = 9;
            // 
            // dataGridView1
            // 
            dataGridView1.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            dataGridView1.Location = new Point(464, 244);
            dataGridView1.Name = "dataGridView1";
            dataGridView1.Size = new Size(530, 261);
            dataGridView1.TabIndex = 10;
            // 
            // btninsert
            // 
            btninsert.Font = new Font("Segoe UI", 12F, FontStyle.Bold);
            btninsert.Location = new Point(507, 193);
            btninsert.Name = "btninsert";
            btninsert.Size = new Size(91, 35);
            btninsert.TabIndex = 11;
            btninsert.Text = "Insert";
            btninsert.UseVisualStyleBackColor = true;
            btninsert.Click += btninsert_Click;
            // 
            // btnupdate
            // 
            btnupdate.Font = new Font("Segoe UI", 12F, FontStyle.Bold);
            btnupdate.Location = new Point(622, 193);
            btnupdate.Name = "btnupdate";
            btnupdate.Size = new Size(91, 35);
            btnupdate.TabIndex = 12;
            btnupdate.Text = "Update";
            btnupdate.UseVisualStyleBackColor = true;
            btnupdate.Click += btnupdate_Click;
            // 
            // btndelete
            // 
            btndelete.Font = new Font("Segoe UI", 12F, FontStyle.Bold);
            btndelete.Location = new Point(735, 193);
            btndelete.Name = "btndelete";
            btndelete.Size = new Size(91, 35);
            btndelete.TabIndex = 13;
            btndelete.Text = "Delete";
            btndelete.UseVisualStyleBackColor = true;
            btndelete.Click += btndelete_Click;
            // 
            // btnview
            // 
            btnview.Font = new Font("Segoe UI", 12F, FontStyle.Bold);
            btnview.Location = new Point(848, 193);
            btnview.Name = "btnview";
            btnview.Size = new Size(91, 35);
            btnview.TabIndex = 14;
            btnview.Text = "View";
            btnview.UseVisualStyleBackColor = true;
            btnview.Click += btnview_Click;
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            AutoSizeMode = AutoSizeMode.GrowAndShrink;
            BackgroundImage = (Image)resources.GetObject("$this.BackgroundImage");
            ClientSize = new Size(1006, 517);
            Controls.Add(btnview);
            Controls.Add(btndelete);
            Controls.Add(btnupdate);
            Controls.Add(btninsert);
            Controls.Add(dataGridView1);
            Controls.Add(txtrentaldate);
            Controls.Add(txtclientid);
            Controls.Add(txtrentalid);
            Controls.Add(txtvendorname);
            Controls.Add(txtvendorid);
            Controls.Add(txtgametitle);
            Controls.Add(txtreleaseyear);
            Controls.Add(txtgameid);
            FormBorderStyle = FormBorderStyle.FixedToolWindow;
            Name = "Form1";
            Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)dataGridView1).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private TextBox txtgameid;
        private TextBox txtreleaseyear;
        private TextBox txtgametitle;
        private TextBox txtvendorname;
        private TextBox txtvendorid;
        private TextBox txtclientid;
        private TextBox txtrentalid;
        private DateTimePicker txtrentaldate;
        private DataGridView dataGridView1;
        private Button btninsert;
        private Button btnupdate;
        private Button btndelete;
        private Button btnview;
    }
}
