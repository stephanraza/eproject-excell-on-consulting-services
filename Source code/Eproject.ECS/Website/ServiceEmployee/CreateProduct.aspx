<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="CreateProduct.aspx.cs" Inherits="ServiceEmployee_CreateProduct" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="<%=ResolveUrl("~")%>App_Themes/css/ui-lightness/jquery-ui-1.8.7.custom.css"
        rel="stylesheet" type="text/css" />

    <script src="<%=ResolveUrl("~")%>App_Themes/js/jquery-1.4.4.min.js" type="text/javascript"></script>

    <script src="<%=ResolveUrl("~")%>App_Themes/js/jquery-ui-1.8.7.custom.min.js" type="text/javascript"></script>

    <script type="text/javascript">
	$(function() {
		$( "#<%=txtManufactureDate.ClientID%>" ).datepicker({
			changeMonth: true,
			changeYear: true,
			yearRange: '1900:2011'
		});
		
		$( "#<%=txtExpiryDate.ClientID%>" ).datepicker({
			changeMonth: true,
			changeYear: true,
			yearRange: '1900:2011'
		});
	});
function btnReset_onclick() {

}

function btnReset_onclick() {

}

    </script>

    <style type="text/css">
        #btnReset
        {
            height: 26px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="Server">
    <div id="page-heading">
        <h1>
            CREATE PRODUCT</h1>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table border="0" width="100%" cellpadding="0" cellspacing="0" id="content-table">
        <tr>
            <th rowspan="3" class="sized">
                <img src="/Website/App_Themes/images/shared/side_shadowleft.jpg" width="20" height="300"
                    alt="" />
            </th>
            <th class="topleft">
            </th>
            <td id="tbl-border-top">
                &nbsp;
            </td>
            <th class="topright">
            </th>
            <th rowspan="3" class="sized">
                <img src="/Website/App_Themes/images/shared/side_shadowright.jpg" width="20" height="300"
                    alt="" />
            </th>
        </tr>
        <tr>
            <td id="tbl-border-left">
            </td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <!--  start content-table-inner -->
                        <div id="content-table-inner">
                            <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                <tr valign="top">
                                    <td>
                                        <!--  start step-holder -->
                                        <div id="step-holder">
                                            <div class="step-no">
                                                1</div>
                                            <div class="step-dark-left">
                                                <a href="<%=ResolveUrl("~")%>ManageService/Product/Create">Create details</a></div>
                                            <div class="step-dark-right">
                                                &nbsp;</div>
                                            <div class="step-no-off">
                                                2</div>
                                            <div class="step-light-left">
                                                <a href="<%=ResolveUrl("~")%>ManageService/Product/Manage">Manage product</a></div>
                                            <div class="step-light-right">
                                                &nbsp;</div>
                                            <div class="step-no-off">
                                                3</div>
                                            <div class="step-light-left">
                                                <a href="<%=ResolveUrl("~")%>ManageService/Product/Modify">Modify details</a></div>
                                            <div class="step-light-right">
                                                &nbsp;</div>
                                            <div class="step-no-off">
                                                4</div>
                                            <div class="step-light-left">
                                                <a href="<%=ResolveUrl("~")%>ManageService/Product/Trash">Trash</a></div>
                                            <div class="step-light-round">
                                                &nbsp;</div>
                                            <div class="clear">
                                            </div>
                                        </div>
                                        <!--  end step-holder -->
                                        <!--  start message-yellow -->
                                        <asp:Panel ID="pnlYellow" runat="server" Visible="false">
                                            <div id="message-yellow">
                                                <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td class="yellow-left">
                                                            You have a new message. <a href="">Go to Inbox.</a>
                                                        </td>
                                                        <td class="yellow-right">
                                                            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="close-yellow" ImageUrl="~/App_Themes/images/table/icon_close_yellow.gif"></asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </asp:Panel>
                                        <!--  end message-yellow -->
                                        <!--  start message-red -->
                                        <asp:Panel ID="pnlRed" runat="server" Visible="false">
                                            <div id="message-red">
                                                <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td class="red-left">
                                                            <asp:Label ID="lblError" runat="server" Text=""></asp:Label>&nbsp;<a href="#" class="close-red">Close
                                                                and try again.</a>
                                                        </td>
                                                        <td class="red-right">
                                                            <asp:HyperLink ID="HyperLink2" runat="server" CssClass="close-red" ImageUrl="~/App_Themes/images/table/icon_close_red.gif"></asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </asp:Panel>
                                        <!--  end message-red -->
                                        <!--  start message-blue -->
                                        <asp:Panel ID="pnlBlue" runat="server" Visible="false">
                                            <div id="message-blue">
                                                <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td class="blue-left">
                                                            Welcome back. <a href="">View my account.</a>
                                                        </td>
                                                        <td class="blue-right">
                                                            <asp:HyperLink ID="HyperLink3" runat="server" CssClass="close-blue" ImageUrl="~/App_Themes/images/table/icon_close_blue.gif"></asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </asp:Panel>
                                        <!--  end message-blue -->
                                        <!--  start message-green -->
                                        <asp:Panel ID="pnlGreen" runat="server" Visible="false">
                                            <div id="message-green">
                                                <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td class="green-left">
                                                            <asp:Label ID="lblSuccess" runat="server" Text=""></asp:Label>&nbsp;<a href="#" class="close-green"
                                                                onclick="reset();">Add new one.</a>
                                                        </td>
                                                        <td class="green-right">
                                                            <asp:HyperLink ID="HyperLink5" runat="server" CssClass="close-green" ImageUrl="~/App_Themes/images/table/icon_close_green.gif"></asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </asp:Panel>
                                        <!--  end message-green -->
                                        <!-- start id-form -->
                                        <table border="0" cellpadding="0" cellspacing="0" id="id-form">
                                            <tr>
                                                <th valign="top">
                                                    Category name :
                                                </th>
                                                <td>
                                                    <asp:DropDownList ID="ddlCategory" runat="server" CssClass="inp-form" AutoPostBack="True"
                                                        OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    <asp:TextBox ID="txtCategory" runat="server" Visible="false" CssClass="inp-form"></asp:TextBox>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <th valign="top">
                                                    Company name :
                                                </th>
                                                <td>
                                                    <asp:DropDownList ID="ddlCompany" runat="server" CssClass="inp-form" AutoPostBack="True">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <th valign="top">
                                                    Product Name:
                                                </th>
                                                <td>
                                                    <asp:TextBox ID="txtProductName" runat="server" ValidationGroup="9" CssClass="inp-form"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtProductName"
                                                        Display="Dynamic" ValidationGroup="9" ErrorMessage="Product name is required."></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th valign="top">
                                                    Product Type :
                                                </th>
                                                <td>
                                                    <asp:DropDownList ID="ddlProductType" runat="server" CssClass="inp-form">
                                                        <asp:ListItem Text="Service" Value="Service"></asp:ListItem>
                                                        <asp:ListItem Text="Product" Value="Product"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th valign="top">
                                                    Product Price:
                                                </th>
                                                <td>
                                                    <asp:TextBox ID="txtProductPrice" runat="server" ValidationGroup="9" CssClass="inp-form"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtProductPrice"
                                                        Display="Dynamic" ValidationGroup="9" ErrorMessage="Product name is required."></asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtProductPrice"
                                                        ErrorMessage="Do not format" ValidationExpression="^[0-9]{0,16}" ValidationGroup="9"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th valign="top">
                                                    Manufacture Date :
                                                </th>
                                                <td>
                                                    <asp:TextBox ID="txtManufactureDate" ValidationGroup="9" runat="server" CssClass="inp-form"></asp:TextBox>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtManufactureDate"
                                                        ErrorMessage="Incorrect format" ValidationExpression="^((0?[13578]|10|12)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[01]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1}))|(0?[2469]|11)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[0]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1})))$"
                                                        ValidationGroup="9"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th valign="top">
                                                    Expiry Date :
                                                </th>
                                                <td>
                                                    <asp:TextBox ID="txtExpiryDate" ValidationGroup="9" runat="server" CssClass="inp-form"></asp:TextBox>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Incorrect format"
                                                        ControlToValidate="txtExpiryDate" ValidationExpression="^((0?[13578]|10|12)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[01]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1}))|(0?[2469]|11)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[0]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1})))$"
                                                        ValidationGroup="9"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th valign="top">
                                                    Description :
                                                </th>
                                                <td>
                                                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="form-textarea"></asp:TextBox>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <th valign="top">
                                                    Image :
                                                </th>
                                                <td>
                                                    <asp:FileUpload ID="fuImage" runat="server" />
                                                </td>
                                                <td>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="fuImage"
                                                        Display="Dynamic" ErrorMessage="Your file is not invalid. It only supports image type."
                                                        ValidationExpression="^.+\.(([jJ][pP][eE]?[gG])|([gG][iI][fF])|([pP][nN][gG])|([bB][mM][pP])|([iI][cC][oO]))$"></asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>
                                                    &nbsp;
                                                </th>
                                                <td valign="top">
                                                    <asp:Button ID="btnSubmit" runat="server" Text="" CssClass="form-submit" ValidationGroup="9"
                                                        OnClick="btnSubmit_Click" />
                                                    <input id="btnReset" type="button" value="Reset" onclick='reset();' class="form-reset" />
                                                </td>
                                                <td>
                                                </td>
                                            </tr>
                                        </table>
                                        <!-- end id-form  -->
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <img src="<%=ResolveUrl("~")%>App_Themes/images/shared/blank.gif" width="695" height="1"
                                            alt="blank" />
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                            <div class="clear">
                            </div>
                        </div>
                        <!--  end content-table-inner  -->
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ddlCategory" EventName="SelectedIndexChanged" />
                        <asp:AsyncPostBackTrigger ControlID="ddlCompany" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
            <td id="tbl-border-right">
            </td>
        </tr>
        <tr>
            <th class="sized bottomleft">
            </th>
            <td id="tbl-border-bottom">
                &nbsp;
            </td>
            <th class="sized bottomright">
            </th>
        </tr>
    </table>
</asp:Content>
