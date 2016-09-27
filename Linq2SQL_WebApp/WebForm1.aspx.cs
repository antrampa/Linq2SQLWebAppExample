using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Linq2SQL_WebApp
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGridView();
        }

        protected void BindGridView()
        {
            var db = new MemberCDAC_DataClassesDataContext();

            //Using Linq query
            GridView1.DataSource = (from a in db.tblMembers select a).ToList();
            GridView1.DataBind();
            
            // OR

            //Direct Using ToList 
            GridView1.DataSource = db.tblMembers.ToList();
            GridView1.DataBind();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            var db = new MemberCDAC_DataClassesDataContext();
           
            //Save for add new member record in table.
            if (btnSave.Text == "Save")
            {
                //create tblmember instance.
                tblMember NewMember = new tblMember();

                NewMember.Name = txtName.Text;
                NewMember.address = txtAddress.Text;
                NewMember.place = txtPlace.Text;
                NewMember.joindate = DateTime.ParseExact(txtJoinDate.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                
                //Insert new record in tblmembers
                db.tblMembers.InsertOnSubmit(NewMember);
                //Update table
                db.SubmitChanges();
                
                //empty text box value.
                ClearTextBoxValue();
            }


            //Update for update existing member record in table.
            if (btnSave.Text == "Update")
            {
                int SelectMemberID = Convert.ToInt16(lblMemberID.Text);
                var NewMember = (from a in db.tblMembers where a.MemberID == Convert.ToInt16(lblMemberID.Text) select a ).FirstOrDefault();

                NewMember.Name = txtName.Text;
                NewMember.address = txtAddress.Text;
                NewMember.place = txtPlace.Text;
                NewMember.joindate = DateTime.ParseExact(txtJoinDate.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture);
                //Update table
                db.SubmitChanges();
                btnSave.Text = "Save";
                ClearTextBoxValue();
            }

            //Refresh gridview after new or update member.
            BindGridView();
        }

        private void ClearTextBoxValue()
        {
            lblMemberID.Text = "[MemberID]";
            txtName.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtPlace.Text = string.Empty;
            txtJoinDate.Text = string.Empty;
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnSave.Text = "Update";

            var db = new MemberCDAC_DataClassesDataContext();

            //Get MemberID from gridview 
            int TMemberID = Convert.ToInt32(GridView1.SelectedRow.Cells[1].Text);

            //Fetch particular member record from table directly with MemberID.
            var MemberDetail = (from a in db.tblMembers where a.MemberID == TMemberID select a).FirstOrDefault();
            
            lblMemberID.Text = Convert.ToString(MemberDetail.MemberID);
            txtName.Text = MemberDetail.Name;
            txtAddress.Text = MemberDetail.address;
            txtPlace.Text = MemberDetail.place;
            txtJoinDate.Text = Convert.ToDateTime(MemberDetail.joindate).ToString("dd/MM/yyyy");
           
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            ClearTextBoxValue();

            if (e.CommandName == "NewMember")
            {
                btnSave.Text = "Save";
                ClearTextBoxValue();
                txtName.Focus();
            }

            if (e.CommandName == "DeleteMember")
            {

                int CurrentRowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow gvRow = GridView1.Rows[CurrentRowIndex];
                
                var db = new MemberCDAC_DataClassesDataContext();

                //Get MemberID from gridview 
                int TMemberID = Convert.ToInt32(gvRow.Cells[1].Text);

                //Fetch particular member record from table directly with MemberID.
                var MemberDetail = (from a in db.tblMembers where a.MemberID == TMemberID select a).FirstOrDefault();
                db.tblMembers.DeleteOnSubmit(MemberDetail);
                db.SubmitChanges();
                txtName.Focus();
                BindGridView();
            }



            
        }
    }
}