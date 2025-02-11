<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" language="javascript">
    function validateform()
     {
        var message = "";
        if (document.getElementById("ctl00_ContentPlaceHolder1_drp_usertype").value == "Select") 
        {
            message += "Select User Type\n";
        }
        if (document.getElementById("ctl00_ContentPlaceHolder1_txt_userid").value == "")
         {
            message += "Enter User Id\n";
        }
        if (document.getElementById("ctl00_ContentPlaceHolder1_txt_password").value == "")
         {
            message += "Enter Password\n";
        }
        if (message == "")
         {
            return true;
        }
        else {

            alert(message);
            return false;
                 }
       
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table align="center" bgcolor="#4DA4A3" width="100%">
   
   <tr>
   <td align="center" colspan="2">
   <asp:Label ID="Label1" runat="server" Font-Size="Large" ForeColor="#FF3300" 
                    Text="Login Form" Height="20px"></asp:Label>
       </td>
   </tr>
   
   <tr>
   <td align="right">
       <asp:Label ID="lb_usertype" runat="server" Text="UserType"></asp:Label>
       </td>
     <td>
         <asp:DropDownList ID="drp_usertype" runat="server" Height="16px" Width="126px">
             <asp:ListItem>Select</asp:ListItem>
             <asp:ListItem>Admin</asp:ListItem>
             <asp:ListItem>Manager</asp:ListItem>
             <asp:ListItem>Director</asp:ListItem>
             <asp:ListItem>Accountant</asp:ListItem>
             <asp:ListItem>Employee</asp:ListItem>
         </asp:DropDownList>
       </td>
   </tr>
   
   <tr>
   <td align="right">
       <asp:Label ID="Label3" runat="server" Text="UserId"></asp:Label>
       </td>
     <td>
         <asp:TextBox ID="txt_userid" runat="server"></asp:TextBox>
       </td>
   </tr>
   
   <tr>
   <td align="right">
       <asp:Label ID="Label4" runat="server" Text="Password"></asp:Label>
       </td>
     <td>
         <asp:TextBox ID="txt_password" runat="server" TextMode="Password"></asp:TextBox>
       </td>
   </tr>
   
   <tr>
   <td align="right">
       &nbsp;</td>
     <td>
         &nbsp;</td>
   </tr>
   
   <tr>
   <td align="right">
       &nbsp;</td>
     <td>
       <asp:Button ID="btn_Login" runat="server" Text="Login" 
           onclick="btn_Login_Click" OnClientClick="return validateform();" />
       </td>
   </tr>
   
   <tr>
   <td colspan="2" align="center">
       <asp:LinkButton ID="LinkButton1" runat="server" Font-Underline="False" 
           ForeColor="Yellow" PostBackUrl="~/Frm_Registration.aspx">Click Here To Register</asp:LinkButton>
&nbsp;&nbsp;
       <asp:LinkButton ID="LinkButton2" runat="server" Font-Size="Small" 
           Font-Underline="False" ForeColor="#CC3300" 
           PostBackUrl="~/ForgetPassword.aspx">Forget Password Only For Employee</asp:LinkButton>
       </td>
   </tr>
   </table>

</asp:Content>

