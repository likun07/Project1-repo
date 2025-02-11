using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
public partial class Login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {

    }
    protected void btn_Login_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("checkUnthentication", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@usertype", drp_usertype.SelectedValue);
        cmd.Parameters.AddWithValue("@userid", txt_userid.Text);
        cmd.Parameters.AddWithValue("@password", txt_password.Text);
        int returncode =(int)cmd.ExecuteScalar();
        con.Close();
        if (returncode == 1)
        {
            if (drp_usertype.SelectedValue == "Employee")
            {
                Session["Employee"] = txt_userid.Text;
                Response.Redirect("~/Employee/EmployeeHome.aspx");
            }
            else if (drp_usertype.SelectedValue == "Admin")
            {
                Session["Admin"] = txt_userid.Text;
                Response.Redirect("~/Admin/AdminHome.aspx");
            }
            else if (drp_usertype.SelectedValue == "Manager")
            {
                Session["Manager"] = txt_userid.Text;
                Response.Redirect("~/Manager/ManagerHome.aspx");
            }
            else if (drp_usertype.SelectedValue == "Director")
            {
                Session["Director"] = txt_userid.Text;
                Response.Redirect("~/Director/DirectorHome.aspx");
            }
            else if (drp_usertype.SelectedValue == "Accountant")
            {
                Session["Accountant"] = txt_userid.Text;
                Response.Redirect("~/Accountant/AccountantHome.aspx");
            }

        }
        else if (returncode == -1)
        {
            if (drp_usertype.SelectedValue == "Employee")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('Invalid User Id or Password or Rejected By Admin');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('Invalid User Id or Password');", true);
            }
        }
    }
}