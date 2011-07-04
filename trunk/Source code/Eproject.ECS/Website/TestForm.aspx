<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestForm.aspx.cs" Inherits="TestForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 297px;
        }
        .style2
        {
        }
        .style3
        {
        }
        .style4
        {
            width: 122px;
        }
        .style5
        {
            width: 97px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="style1">
                    Account ID</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Employee ID</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Role Name</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="127px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    User Name</td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Password</td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Create" />
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td>
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    
    </div>
    <p>
        &nbsp;</p>
    
        <table style="width:100%;">
            <tr>
                <td class="style1">
                    Input String</td>
                <td class="style2" colspan="3">
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Encripted String</td>
                <td class="style2" colspan="3">
                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style5">
                    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                        Text="MD5 Encription" />
                </td>
                <td class="style2" colspan="2">
                    <asp:Button ID="Button3" runat="server" Text="Check Verify" 
                        onclick="Button3_Click" />
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Decripted String</td>
                <td class="style2" colspan="3">
                    <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style3" colspan="2">
                    <asp:Button ID="Button5" runat="server" onclick="Button5_Click" 
                        Text="Encription" />
                </td>
                <td>
                    <asp:Button ID="Button4" runat="server" onclick="Button4_Click" 
                        Text="Decription" />
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style2" colspan="3">
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    
    </form>
</body>
</html>
