<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Frm_Registration.aspx.cs" Inherits="Frm_Registration" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <script language="javascript" type="text/javascript">
       function validateform() {
           var message = "";
           if (document.getElementById("ctl00_ContentPlaceHolder1_txt_name").value == "") {
               message += "Please Enter First Name\n";
           }

//           else {
//               var exp = /^[a-zA-Z]+$/;
//               if (exp.test(document.getElementById("ctl00_ContentPlaceHolder1_txt_name").value) == false) {
//                   message += "Please Enter Only Characters for First Name\n";
//               }
//           }
          
           if (document.getElementById("ctl00_ContentPlaceHolder1_txt_dob").value == "") {
               message += "Please Enter dob\n";
           }
           if (document.getElementById("ctl00_ContentPlaceHolder1_rdo_gender_0").checked == false && document.getElementById("ctl00_ContentPlaceHolder1_rdo_gender_1").checked == false) {
               message += "Please Select gender\n";
           }
           if (document.getElementById("ctl00_ContentPlaceHolder1_txt_empid").value == "") {
               message += "Please enter Employee Code\n";
           }
           if (document.getElementById("ctl00_ContentPlaceHolder1_txt_password").value == "") {
               message += "Please Enter Password\n";
           }
           if (document.getElementById("ctl00_ContentPlaceHolder1_txt_conpassword").value == "") {
               message += "Please Enter Confirm Password\n";
           }
           else {
               if (document.getElementById("ctl00_ContentPlaceHolder1_txt_password").value == document.getElementById("ctl00_ContentPlaceHolder1_txt_conpassword").value) {
               }
               else {
                   message += "Password does not match\n";
               }
           }
           if (document.getElementById("ctl00_ContentPlaceHolder1_txt_email").value == "") {
               message += "Please Enter Email\n";
           }
           else {
               var exp = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
               if (exp.test(document.getElementById("ctl00_ContentPlaceHolder1_txt_email").value) == false) {
                   message += "Please Enter valid email id\n";
               }
           }
           
               if(document.getElementById("ctl00_ContentPlaceHolder1_drp_securityquestion").value=="Select")
               {
               message+="please select security question\n";
               }
                          if(document.getElementById("ctl00_ContentPlaceHolder1_txt_ans").value=="")
               {
               message+="please enter security answer\n";
              }
//                if(document.getElementById("ctl00_ContentPlaceHolder1_drp_emptype").value=="Select")
//               {
//               message+="please select employee type\n";
//               }


               if (document.getElementById("ctl00_ContentPlaceHolder1_txt_mobileno").value == "") {
                   message += "Please Enter Mobileno No\n";
               }
               else {
                   var exp = /^[0-9]{10}$/;
                   if (exp.test(document.getElementById("ctl00_ContentPlaceHolder1_txt_mobileno").value) == false) {
                       message += "Please Enter Only 10 Nos for Mobile No\n";
                   }
               }
           
          
               
           
           if (message == "") {
               return true;
           }
           else {
               alert(message);
               return false;
           }

       }
      
   </script>
    <style type="text/css">
        .style1
        {
            height: 16px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" bgcolor="#4DA4A3" width="100%">
        <tr>
            <td class="style1" align="center" colspan="2">
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Label ID="Label1" runat="server" Font-Size="Large" ForeColor="#FF3300" 
                    Text="Employee Registration Form" Height="25px"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right">
                Name :</td>
            <td class="style7">
                <asp:TextBox ID="txt_name" runat="server"  Width="172px"></asp:TextBox>
            </td>
        </tr>
        <tr> <td class="style8" align="right">
                D.O.B :</td>
            <td class="style7"> 
                <asp:TextBox ID="txt_dob" runat="server"></asp:TextBox>
                
                <cc1:CalendarExtender ID="txt_dob_CalendarExtender" runat="server" 
                    Enabled="True" Format="dd/MMM/yyyy" TargetControlID="txt_dob">
                </cc1:CalendarExtender>
                
            </td></tr>
            <tr> <td class="style8" align="right">
            Gender :</td>
            <td class="style7" align="left">
                
                <asp:RadioButtonList ID="rdo_gender" runat="server" 
                    RepeatDirection="Horizontal">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:RadioButtonList>
            </td></tr>
        <tr>
            <td class="style8" align="right">
                Empid :</td>
            <td class="style7">
                <asp:TextBox ID="txt_empid" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style8" align="right">
                Password :</td>
            <td class="style7">
                <asp:TextBox ID="txt_password" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style8" align="right">
                Confirm Pasword :</td>
            <td class="style7">
                <asp:TextBox ID="txt_conpassword" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style8" align="right">
                Email_Id :</td>
            <td class="style7">
                <asp:TextBox ID="txt_email" runat="server" Height="16px" Width="176px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style8" align="right">
                Security Question :</td>
            <td class="style7">
                <asp:DropDownList ID="drp_securityquestion" runat="server" Height="16px" 
                    Width="233px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style8" align="right">
                Security Answer :</td>
            <td class="style7">
                <asp:TextBox ID="txt_ans" runat="server" Height="16px" Width="179px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style8" align="right">
                Mobile No. :</td>
            <td class="style7">
                <asp:TextBox ID="txt_mobileno" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="btn_submit" runat="server" Text="Register" 
                    onclick="btn_submit_Click" OnClientClick="return validateform();" />
                &nbsp;<asp:Button ID="btn_clear" runat="server" Text="Clear" 
                    onclick="btn_clear_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

