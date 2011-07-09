<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestForm.aspx.cs" Inherits="TestForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="<%=ResolveUrl("~")%>App_Themes/css/ui-lightness/jquery-ui-1.8.7.custom.css" rel="stylesheet" type="text/css" />
    <script src="<%=ResolveUrl("~")%>App_Themes/js/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script src="<%=ResolveUrl("~")%>App_Themes/js/jquery-ui-1.8.7.custom.min.js" type="text/javascript"></script>    
	<script type="text/javascript">
	$(function() {
		$( <%=txtDate.ClientID%> ).datepicker({
			changeMonth: true,
			changeYear: true,
			yearRange: '1900:2010'
		});
	});
	</script>
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
        .style5
        {
            width: 97px;
        }
        .style6
        {
            width: 72px;
        }
        .style7
        {
            width: 70px;
        }
        .style8
        {
            width: 59px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="style1">
                    User Name to get Account</td>
                <td colspan="2">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
                <td colspan="3">
                    <asp:Button ID="Button9" runat="server" onclick="Button9_Click" 
                        Text="Get Account Information" />
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Employee ID</td>
                <td colspan="5">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Role Name</td>
                <td colspan="5">
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="127px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    User Name</td>
                <td colspan="5">
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Password</td>
                <td colspan="5">
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Lock Account</td>
                <td colspan="5">
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Remove Account</td>
                <td colspan="5">
                    <asp:CheckBox ID="CheckBox2" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Date</td>
                <td colspan="5">
                    <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style6">
                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Create" />
                </td>
                <td class="style7">
                    <asp:Button ID="Button6" runat="server" onclick="Button6_Click" Text="Update" />
                </td>
                <td class="style8">
                    <asp:Button ID="Button7" runat="server" onclick="Button7_Click" 
                        style="height: 26px" Text="Delete" />
                </td>
                <td class="style8">
                    <asp:Button ID="Button8" runat="server" onclick="Button8_Click" Text="Remove" />
                </td>
                <td>
                    <asp:Button ID="Button10" runat="server" onclick="Button10_Click" 
                        Text="Restore" />
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td colspan="5">
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
