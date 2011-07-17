<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="CreateCompany.aspx.cs" Inherits="ServiceEmployee_CreateCompany" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Excell-on Consulting Services</title>
    <link href="<%=ResolveUrl("~")%>App_Themes/css/ui-lightness/jquery-ui-1.8.7.custom.css"
        rel="stylesheet" type="text/css" />

    <script src="<%=ResolveUrl("~")%>App_Themes/js/jquery-1.4.4.min.js" type="text/javascript"></script>

    <script src="<%=ResolveUrl("~")%>App_Themes/js/jquery-ui-1.8.7.custom.min.js" type="text/javascript"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="Server">
    <div id="page-heading">
        <h1>
            CREATE COMPANY</h1>
    </div>
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
                                        <a href="<%=ResolveUrl("~")%>ManageService/Company/Create">Create details</a></div>
                                    <div class="step-dark-right">
                                        &nbsp;</div>
                                    <div class="step-no-off">
                                        2</div>
                                    <div class="step-light-left">
                                        <a href="<%=ResolveUrl("~")%>ManageService/Company/Manage">Manage companies</a></div>
                                    <div class="step-light-right">
                                        &nbsp;</div>
                                    <div class="step-no-off">
                                        3</div>
                                    <div class="step-light-left">
                                        <a href="<%=ResolveUrl("~")%>ManageService/Company/Modify">Modify details</a></div>
                                    <div class="step-light-right">
                                        &nbsp;</div>
                                    <div class="step-no-off">
                                        4</div>
                                    <div class="step-light-left">
                                        <a href="<%=ResolveUrl("~")%>ManageService/Company/Trash">Trash</a></div>
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
                                            Name :
                                        </th>
                                        <td>
                                            <asp:TextBox ID="txtName" runat="server" CssClass="inp-form" ValidationGroup="9"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtName"
                                                Display="Dynamic" ErrorMessage="Name is required." ValidationGroup="9"></asp:RequiredFieldValidator>
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
                                            Address :
                                        </th>
                                        <td valign="top">
                                            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" CssClass="form-textarea"></asp:TextBox>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th valign="top">
                                            Phone Number :
                                        </th>
                                        <td>
                                            <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="inp-form" ValidationGroup="9"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPhoneNumber"
                                                ErrorMessage="Phone number is invalid." ValidationExpression="^[0-9]{6,15}" ValidationGroup="9"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th valign="top">
                                            Email :
                                        </th>
                                        <td>
                                            <asp:TextBox ID="txtEmail" runat="server" CssClass="inp-form" ValidationGroup="9"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail"
                                                Display="Dynamic" ErrorMessage="Email is required." ValidationGroup="9"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email is invalid."
                                                ControlToValidate="txtEmail" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                ValidationGroup="9"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th valign="top">
                                            Logo :
                                        </th>
                                        <td>
                                            <asp:FileUpload ID="fuLogo" runat="server" />
                                        </td>
                                        <td>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="fuLogo"
                                                Display="Dynamic" ErrorMessage="Your file is not invalid. It only supports image type."
                                                ValidationExpression="^.+\.(([jJ][pP][eE]?[gG])|([gG][iI][fF])|([pP][nN][gG])|([bB][mM][pP])|([iI][cC][oO]))$"
                                                ValidationGroup="9"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            &nbsp;
                                        </th>
                                        <td valign="top">
                                            <asp:Button ID="btnSubmit" runat="server" Text="" CssClass="form-submit" OnClick="btnSubmit_Click"
                                                ValidationGroup="9" />
                                            <input id="btnReset" type="button" value="Reset" onclick='reset();' class="form-reset" />
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                                <!-- end id-form  -->
                            </td>
                            <td>
                                <!--  start related-activities -->
                             
                                <!-- end related-activities -->
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
