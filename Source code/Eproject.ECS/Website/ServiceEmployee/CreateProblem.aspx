﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="CreateProblem.aspx.cs" Inherits="ServiceEmployee_CreateProblem" Title="Excell-on Consulting Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="Server">
    <div id="page-heading">
        <h1>
            CREATE PROBLEM</h1>
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
			                                <div class="step-no">1</div>
			                                <div class="step-dark-left"><a href="<%=ResolveUrl("~")%>ManageService/Problem/Create">
                                                Create details</a></div>
			                                <div class="step-dark-right">&nbsp;</div>
			                                <div class="step-no-off">2</div>
			                                <div class="step-light-left"><a href="<%=ResolveUrl("~")%>ManageService/Problem/Manage">
                                                Manage problems</a></div>
			                                <div class="step-light-right">&nbsp;</div>
			                                <div class="step-no-off">3</div>
			                                <div class="step-light-left"><a href="<%=ResolveUrl("~")%>ManageService/Problem/Modify">
                                                Modify details</a></div>
			                                <div class="step-light-right">&nbsp;</div>
			                                <div class="step-no-off">4</div>
			                                <div class="step-light-left"><a href="<%=ResolveUrl("~")%>ManageService/Problem/Trash">
                                                Trash</a></div>
			                                <div class="step-light-round">&nbsp;</div>
			                                <div class="clear"></div>
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
                                                    Customer name :
                                                </th>
                                                <td>
                                                <div class="inp-form">
                                                    <asp:DropDownList ID="ddlCustomer" runat="server" CssClass="styledselect_form"
                                                        AutoPostBack="True">
                                                    </asp:DropDownList>
                                                </div>
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
                                                <div class="inp-form">
                                                    <asp:DropDownList ID="ddlCompany" runat="server" CssClass="styledselect_form" 
                                                        AutoPostBack="True">
                                                    </asp:DropDownList>
                                                    </div>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <th valign="top">
                                                    Date :
                                                </th>
                                                <td>
                                                    <asp:TextBox ID="txtDate" runat="server" CssClass="inp-form datePicker"></asp:TextBox>
                                                </td>
                                                <td>
                                                    &nbsp;
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDate"
                                                        Display="Dynamic" ErrorMessage="Date of birth is required."></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th valign="top">
                                                    Title :
                                                </th>
                                                <td valign="top">
                                                    <asp:TextBox ID="txtTitle" runat="server" TextMode="MultiLine" CssClass="form-textarea"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtTitle"
                                                        Display="Dynamic" ErrorMessage="Title is required." ValidationGroup="9"></asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th valign="top">
                                                    Content :
                                                </th>
                                                <td>
                                                    <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" CssClass="form-textarea"></asp:TextBox>
                                                </td>
                                                <td>
                                                    &nbsp;
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
                        <asp:AsyncPostBackTrigger ControlID="ddlCustomer" EventName="SelectedIndexChanged" />
                        <asp:AsyncPostBackTrigger ControlID="ddlCompany" 
                            EventName="SelectedIndexChanged" />
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
