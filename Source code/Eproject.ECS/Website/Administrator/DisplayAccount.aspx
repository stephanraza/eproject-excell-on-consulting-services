<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="DisplayAccount.aspx.cs" Inherits="Administrator_DisplayAccount" Title="Excell-on Consulting Services" %>

<%@ Register Src="~/Controls/PersonalInfoControl.ascx" TagName="PersonalInfoControl"
    TagPrefix="ucPersonalInfoControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="Server">
    <div id="page-heading">
        <h1>
            ACCOUNT INFORMATION</h1>
    </div>
    <table border="0" width="100%" cellpadding="0" cellspacing="0" id="content-table">
        <tr>
            <th rowspan="3" class="sized">
                <img src="<%=ResolveUrl("~")%>App_Themes/images/shared/side_shadowleft.jpg" width="20"
                    height="300" alt="" />
            </th>
            <th class="topleft">
            </th>
            <td id="tbl-border-top">
                &nbsp;
            </td>
            <th class="topright">
            </th>
            <th rowspan="3" class="sized">
                <img src="<%=ResolveUrl("~")%>App_Themes/images/shared/side_shadowright.jpg" width="20"
                    height="300" alt="" />
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
                                        <a href="<%=ResolveUrl("~")%>ManageSystem/Account/Create">Create details</a></div>
                                    <div class="step-light-right">
                                        &nbsp;</div>
                                    <div class="step-no-off">
                                        2</div>
                                    <div class="step-light-left">
                                        <a href="<%=ResolveUrl("~")%>ManageSystem/Employee/Manage">Manage accounts</a></div>
                                    <div class="step-light-right">
                                        &nbsp;</div>
                                    <div class="step-no-off">
                                        3</div>
                                    <div class="step-light-left">
                                        <a href="<%=ResolveUrl("~")%>ManageSystem/Account/Modify">Modify details</a></div>
                                    <div class="step-light-right">
                                        &nbsp;</div>
                                    <div class="step-no-off">
                                        4</div>
                                    <div class="step-light-left">
                                        <a href="<%=ResolveUrl("~")%>ManageSystem/Account/Trash">Trash</a></div>
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
                                                    <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                                                    &nbsp;<asp:HyperLink ID="hplnkYellow" runat="server" CssClass="close-yellow"></asp:HyperLink>
                                                </td>
                                                <td class="yellow-right">
                                                    <asp:HyperLink ID="hplnkYellowClose" runat="server" CssClass="close-yellow" ImageUrl="~/App_Themes/images/table/icon_close_yellow.gif"></asp:HyperLink>
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
                                                    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>&nbsp;<asp:HyperLink
                                                        ID="hplnkRed" runat="server" CssClass="close-red">Please try again.</asp:HyperLink>
                                                </td>
                                                <td class="red-right">
                                                    <asp:HyperLink ID="hplnkRedClose" runat="server" CssClass="close-red" ImageUrl="~/App_Themes/images/table/icon_close_red.gif"></asp:HyperLink>
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
                                                    <asp:Label ID="lblSuccess" runat="server" Text=""></asp:Label>&nbsp;<asp:HyperLink
                                                        ID="hplnkGreen" runat="server" CssClass="close-green"></asp:HyperLink>
                                                </td>
                                                <td class="green-right">
                                                    <asp:HyperLink ID="hplnkGreenClose" runat="server" CssClass="close-green" ImageUrl="~/App_Themes/images/table/icon_close_green.gif"></asp:HyperLink>
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
                                                                    <td colspan="3" class="title" align="left" style="padding: 10px 0px 10px 10px">
                                                                        Account's Information<br />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center" class="content" colspan="3">
                                                                        <hr />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th width="50%" align="right" style="text-align: right" class="content" valign="top">
                                                                        User Name :
                                                                    </th>
                                                                    <td align="left" valign="top" colspan="2">
                                                                        <asp:Label ID="lblDisplayName" runat="server" CssClass="th-label" Text=""></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th width="50%" align="right" style="text-align: right" class="content" valign="top">
                                                                        Employee Name :
                                                                    </th>
                                                                    <td align="left" valign="top">
                                                                        <asp:Label ID="lblDisplayEmployeeName" runat="server" CssClass="th-label" Text=""></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:LinkButton ID="lnkViewDetail" CausesValidation="false" runat="server" OnClick="lnkViewDetail_Click">View employee's detail</asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th width="50%" align="right" style="text-align: right" class="content" valign="top">
                                                                        Employee Email :
                                                                    </th>
                                                                    <td align="left" valign="top" colspan="2">
                                                                        <asp:Label ID="lblDisplayEmployeeEmail" runat="server" CssClass="th-label" Text=""></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th width="50%" align="right" style="text-align: right" class="content" valign="top">
                                                                        Status :
                                                                    </th>
                                                                    <td align="left" valign="top" colspan="2">
                                                                        <asp:Label ID="lblDisplayStatus" runat="server" CssClass="th-label" Text=""></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th width="50%" align="right" style="text-align: right" class="content" valign="top">
                                                                        Role :
                                                                    </th>
                                                                    <td align="left" valign="top" colspan="2">
                                                                        <asp:Label ID="lblDisplayRole" runat="server" CssClass="th-label" Text=""></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <asp:Panel ID="pnlLink" runat="server" Visible="false">
                                                                    <th width="50%" align="right" style="text-align: right" class="content" valign="top">
                                                                        &nbsp;
                                                                    </th>
                                                                    <td colspan="3">
                                                                        <div style="float: left">
                                                                            <ul class="greyarrow">
                                                                                <li>
                                                                                    <asp:HyperLink ID="hplnkDisplayModifyAccount" runat="server" Text="Click here modify account"></asp:HyperLink></li>
                                                                            </ul>
                                                                        </div>
                                                                    </td>
                                                                    </asp:Panel>
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
                                <asp:Panel ID="pnlPersonalInfo" runat="server">
                                    <ucPersonalInfoControl:PersonalInfoControl ID="PersonalInfoControl" runat="server" />
                                </asp:Panel>
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
