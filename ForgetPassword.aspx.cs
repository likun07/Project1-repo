using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
public partial class ForgetPassword : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        string regd_ans="";
        con.Open();
        SqlCommand cmd = new SqlCommand("select Sec_ans from Emp_Registration where Empid='" + txt_empcode.Text + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            regd_ans = dr["Sec_ans"].ToString().Trim();
        }
        dr.Close();
        if (regd_ans == txt_ans.Text.Trim())
        {
            string password = "";
            SqlCommand cmd1 = new SqlCommand("select Con_Pasword from Emp_Registration where Empid='" + txt_empcode.Text + "'", con);
            SqlDataReader dr1 = cmd1.ExecuteReader();
            if (dr1.Read())
            {
                password = dr1["Con_Pasword"].ToString().Trim();
            }
            dr1.Close();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('Your Password is :" + password + "')", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('Your answer does not match')", true);
        }
        con.Close();
       
    }
    protected void txt_empcode_TextChanged(object sender, EventArgs e)
    {
        string count = "";
        con.Open();
        SqlCommand cmd = new SqlCommand("select count(*) as cnt from Emp_Registration where Empid='" + txt_empcode.Text + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            count = dr["cnt"].ToString();
        }
        dr.Close();
      
        if (count == "0")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('Sorry this employee code does not found')", true);
        }
        else
        {
            SqlCommand cmd1 = new SqlCommand("select SecQuestionMaster.Sec_Que  from Emp_Registration inner join SecQuestionMaster on Emp_Registration.Sec_queid =SecQuestionMaster.Sec_queid where Emp_Registration.Empid='" + txt_empcode.Text + "'", con);
            SqlDataReader dr1 = cmd1.ExecuteReader();
            if (dr1.Read())
            {
                txt_secque.Text = dr1["Sec_Que"].ToString();
            }
            dr1.Close();
           
        }
        con.Close();
    }
}