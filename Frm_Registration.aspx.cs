using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
public partial class Frm_Registration : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            load_question();
          //  load_emptype();
        }
    }
    private void clear()
    {
        txt_name.Text = "";
        
        txt_dob.Text = "";
        rdo_gender.SelectedIndex=-1;
        txt_empid.Text = "";
        txt_password.Text = "";
        txt_conpassword.Text = "";
        txt_email.Text = "";
        txt_ans.Text = "";
        txt_mobileno.Text = "";
       // drp_emptype.SelectedIndex = 0;
        drp_securityquestion.SelectedIndex = 0;
    }
    private void load_question()
    {
        con.Open();
        SqlDataAdapter da = new SqlDataAdapter("select Sec_queid,Sec_Que from SecQuestionMaster", con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        drp_securityquestion.DataSource = dt;
        drp_securityquestion.DataTextField = "Sec_Que";
        drp_securityquestion.DataValueField = "Sec_queid";
        drp_securityquestion.DataBind();
        drp_securityquestion.Items.Insert(0, "Select");
        con.Close();

       


    }
    //private void load_emptype()
    //{
    //    con.Open();
    //    SqlDataAdapter da = new SqlDataAdapter("select Emp_TypeId,Emp_Typename from EmployeeTypeMaster", con);
    //    DataTable dt = new DataTable();
    //    da.Fill(dt);
    //    drp_emptype.DataSource = dt;
    //    drp_emptype.DataTextField = "Emp_TypeId";
    //    drp_emptype.DataValueField = "Emp_Typename";
    //    drp_emptype.DataBind();
    //    drp_emptype.Items.Insert(0, "Select");
    //    con.Close();
    //}
    protected void btn_submit_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("insert_registation", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@name", txt_name.Text);
         
       
        cmd.Parameters.AddWithValue("@dob",txt_dob.Text);
        cmd.Parameters.AddWithValue("@gender",rdo_gender.SelectedValue);
      
        cmd.Parameters.AddWithValue("@empid", txt_empid.Text);
        
        cmd.Parameters.AddWithValue("@password",txt_password.Text);
        cmd.Parameters.AddWithValue("@confirmpwd",txt_conpassword.Text);
        cmd.Parameters.AddWithValue("@email",txt_email.Text);
           cmd.Parameters.AddWithValue("@sec_que",drp_securityquestion.SelectedValue);
        cmd.Parameters.AddWithValue("@sec_ans",txt_ans.Text);

        cmd.Parameters.AddWithValue("@mobno", txt_mobileno.Text);
      
         
        cmd.ExecuteNonQuery();
        con.Close();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", "alert('Registration Sucessfull');", true);
        clear();
    }

    protected void btn_clear_Click(object sender, EventArgs e)
    {
        clear();
    }
}

