<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ForgetPassword.aspx.cs" Inherits="ForgetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script language="javascript">
    function validateform()
     {
        var message = "";
        if (document.getElementById("ctl00_ContentPlaceHolder1_txt_ans").value == "") 
        {
            message += "Please Enter answer\n";
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
                    Text="Forget Password" Height="25px"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right">
                Enter Employee Code :</td>
            <td class="style7">
                <asp:TextBox ID="txt_empcode" runat="server" Width="179px" AutoPostBack="True" 
                    ontextchanged="txt_empcode_TextChanged"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style8" align="right">
                Your
                Security Question :</td>
            <td class="style7">
                <asp:TextBox ID="txt_secque" runat="server" Width="256px" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style8" align="right">
                Enter your Answer :</td>
            <td class="style7">
                <asp:TextBox ID="txt_ans" runat="server" Width="179px"></asp:TextBox>
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
                <asp:Button ID="btn_submit" runat="server" Text="Verify" 
                    onclick="btn_submit_Click" OnClientClick="return validateform();" />
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

