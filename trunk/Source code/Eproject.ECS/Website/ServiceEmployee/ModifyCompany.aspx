﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ModifyCompany.aspx.cs" Inherits="ServiceEmployee_ModifyCompany" Title="Untitled Page" %>

<%--<%@ Register Src="~/Controls/PersonalInfoControl.ascx" TagName="PersonalInfoControl"
    TagPrefix="ucPersonalInfoControl" %>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Excell-on Consulting Services</title>
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
                                    <div class="step-no-off">
                                        1</div>
                                    <div class="step-light-left">
                                        <a href="<%=ResolveUrl("~")%>ManageService/Company/Create">Create details</a></div>
                                    <div class="step-light-right">
                                        &nbsp;</div>
                                    <div class="step-no-off">
                                        2</div>
                                    <div class="step-light-left">
                                        <a href="<%=ResolveUrl("~")%>ManageService/Company/Manage">Manage companies</a></div>
                                    <div class="step-light-right">
                                        &nbsp;</div>
                                    <div class="step-no">
                                        3</div>
                                    <div class="step-dark-left">
                                        <a href="<%=ResolveUrl("~")%>ManageService/Company/Modify">Modify details</a></div>
                                    <div class="step-dark-right">
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
                                <table border="0" cellpadding="0" cellspacing="0" id="id-form" width="100%">
                                    <tr>
                                        <td>
                                            <div>
                                                <div style="margin: 0px 100px 0px 100px">
                                                    <div style="padding: 5px; border: solid 1px #CCC;">
                                                        <div style="background: #ECECEC">
                                                            <table width="100%" border="0" align="center" cellpadding="2" cellspacing="2">
                                                                <tr>
                                                                    <td colspan="2" class="title" align="left" style="padding: 10px 0px 10px 10px">
                                                                        Company information<br />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2" align="center">
                                                                        <hr />
                                                                        <br />
                                                                        <asp:ImageButton ID="imgLogo" runat="server" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center" class="content" colspan="2">
                                                                        <hr />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th align="right" class="style1" style="text-align: right" valign="top" width="50%">
                                                                        Company Name :
                                                                    </th>
                                                                    <td align="left" class="style1">
                                                                        <asp:TextBox ID="txtCompanyNameEdit" runat="server" CssClass="inp-form"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCompanyNameEdit"
                                                                            ErrorMessage="Company Name is required"></asp:RequiredFieldValidator>
                                                                    </td>
                                                                    <tr>
                                                                        <th align="right" class="content" style="text-align: right" valign="top" width="50%">
                                                                            Company Phone :
                                                                        </th>
                                                                        <td align="left" valign="top">
                                                                            <asp:TextBox ID="txtCompanyPhoneEdit" runat="server" ValidationGroup="9" CssClass="inp-form"></asp:TextBox>
                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtCompanyPhoneEdit"
                                                                                ErrorMessage="Phone number is invalid." ValidationExpression="^[0-9]{6,15}" ValidationGroup="9"></asp:RegularExpressionValidator>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th align="right" class="content" style="text-align: right" valign="top" width="50%">
                                                                            Company Email :
                                                                        </th>
                                                                        <td align="left" valign="top">
                                                                            <asp:TextBox ID="txtCompanyEmail" runat="server" ValidationGroup="9" CssClass="inp-form"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCompanyEmail"
                                                                                Display="Dynamic" ErrorMessage="Email is required." ValidationGroup="9"></asp:RequiredFieldValidator>
                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email is invalid."
                                                                                ControlToValidate="txtCompanyEmail" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                                                ValidationGroup="9"></asp:RegularExpressionValidator>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th align="right" class="content" style="text-align: right" valign="top" width="50%">
                                                                            Company Address :
                                                                        </th>
                                                                        <td align="left" valign="top">
                                                                            <asp:TextBox ID="txtCompanyAddress" runat="server" CssClass="form-textarea1" TextMode="MultiLine"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th align="right" class="content" style="text-align: right" valign="top" width="50%">
                                                                            Company Logo :
                                                                        </th>
                                                                        <td align="left" valign="top">
                                                                            <asp:FileUpload ID="fuLogoEdit" runat="server" ValidationGroup="9" />
                                                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="fuLogoEdit"
                                                                                Display="Dynamic" ErrorMessage="Your file is not invalid. It only supports image type."
                                                                                ValidationExpression="^.+\.(([jJ][pP][eE]?[gG])|([gG][iI][fF])|([pP][nN][gG])|([bB][mM][pP])|([iI][cC][oO]))$"
                                                                                ValidationGroup="9"></asp:RegularExpressionValidator>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <th align="right" class="content" style="text-align: right" valign="top" width="50%">
                                                                            Company Description :
                                                                        </th>
                                                                        <td align="left" valign="top">
                                                                            <asp:TextBox ID="txtCompanyDescription" runat="server" CssClass="form-textarea1"
                                                                                TextMode="MultiLine"></asp:TextBox>
                                                                        </td>
                                                                        <tr>
                                                                            <th>
                                                                                &nbsp;
                                                                            </th>
                                                                            <td align="center" class="content">
                                                                                <asp:Button ID="UpdateButton" runat="server" CssClass="form-change-left" Text=""
                                                                                    OnClick="UpdateButton_Click" />
                                                                                <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CssClass="form-cancel"
                                                                                    Text="" OnClick="UpdateCancelButton_Click" />
                                                                            </td>
                                                                        </tr>
                                                                    </tr>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                                <!-- end id-form  -->
                            </td>
                            <td>
                                <!--  start related-activities -->
                                <%--<asp:Panel ID="pnlPersonalInfo" runat="server">
                                    <ucPersonalInfoControl:PersonalInfoControl ID="PersonalInfoControl" runat="server" />
                                </asp:Panel>--%>
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
