using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using SinglePageApp;

namespace SinglePageApp
{
    public partial class SinglePageSample : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;
                BindEmployeeListGrid(DataAccess2.GetEmployeesList());
                DepartmentDropDownList.DataSource = DataAccess2.GetDepartments();
                DepartmentDropDownList.DataBind();

            }
        }


        protected void BindEmployeeListGrid(List<Employees> emp)
        {

            GridView1.DataSource = emp;
            GridView1.DataBind();
        }


        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Button btn = (Button)e.Row.FindControl("ToggleIt");
                if (e.Row.Cells[6].Text == "True")
                {
                    e.Row.Cells[6].Text = "Active Employee";
                    e.Row.Cells[6].ForeColor = Color.Green;
                    btn.Text = "Make Inactive";
                    btn.ToolTip= "Make Selected Employee InActive";
                    btn.BackColor = Color.Red;
                    btn.ForeColor = Color.White;
                }
                else
                {
                    e.Row.Cells[6].Text = "InActive Employee";
                    e.Row.Cells[6].ForeColor = Color.Red;
                    btn.Text = "Make Active";
                    btn.ToolTip = "Make Selected Employee Active";
                    btn.BackColor = Color.MediumSeaGreen;
                    btn.ForeColor = Color.White;
                }
            }
        }

        protected void DoEvents(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            string name = e.CommandName.ToString();

            switch (name)
            {
                case "EditIt":
                    {
                        lblTitle.Text = "Edit Selected Employee Record";
                        Employees emp = DataAccess2.FindEmployeeRecord(id);
                        txtFirstName.Text = emp.FirstName;
                        HiddenID.Value = emp.ID.ToString();
                        txtLastName.Text = emp.LastName;
                        txtEmail.Text = emp.Email;
                        DepartmentDropDownList.SelectedValue = emp.DeptID.ToString();
                        MultiView1.ActiveViewIndex = 1;
                        break;
                    }
                case "DeleteIt":
                    {
                        List<Employees> emp = DataAccess2.Toggle_Employee_Active_Status(id);
                        BindEmployeeListGrid(emp);

                        break;
                    }
            }
        }


        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            Employees emp = new Employees();
            emp.ID = Convert.ToInt32(HiddenID.Value);
            emp.FirstName = txtFirstName.Text;
            emp.LastName = txtLastName.Text;
            emp.Email = txtEmail.Text;
            emp.DeptID = Convert.ToInt32(DepartmentDropDownList.SelectedValue);

            BindEmployeeListGrid(DataAccess2.GetEmployeesList());
            MultiView1.ActiveViewIndex = 0;
        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            lblTitle.Text = "Add New Employee Record";
            ClearCurrentAddEditForm();
            MultiView1.ActiveViewIndex = 1;
        }

        protected void ClearCurrentAddEditForm()
        {
            HiddenID.Value = "0";
            lblActive.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEmail.Text = "";
            DepartmentDropDownList.SelectedValue = "0";
        }

        protected void txtFirstName_TextChanged(object sender, EventArgs e)
        {
            int num1;
            string lastChar = txtFirstName.Text.Substring((txtFirstName.Text.Length - 1), 1);
            if (int.TryParse(lastChar, out num1))
            {
                txtFirstName.Text = txtFirstName.Text.Substring(0, txtFirstName.Text.Length - 1);
            }
        }

        protected void btnHow_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }

        protected void btnEnd_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            string Firstname = row.Cells[1].Text;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }
    }
}