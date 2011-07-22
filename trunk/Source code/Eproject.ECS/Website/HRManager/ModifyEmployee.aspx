﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ModifyEmployee.aspx.cs" Inherits="HRManager_ModifyEmployee" Title="Excell-on Consulting Services" ValidateRequest="false" EnableEventValidation="false" %>
<%@ Register Src="~/Controls/PersonalInfoControl.ascx" TagName="PersonalInfoControl"
    TagPrefix="ucPersonalInfoControl" %>
    
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="Server">
    <div id="page-heading">
        <h1>
            MODIFY EMPLOYEE INFORMATION</h1>
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
                                                <a href="<%=ResolveUrl("~")%>ManageSystem/Employee/Create">Create details</a></div>
                                            <div class="step-light-right">
                                                &nbsp;</div>
                                            <div class="step-no-off">
                                                2</div>
                                            <div class="step-light-left">
                                                <a href="<%=ResolveUrl("~")%>ManageSystem/Employee/Manage">Manage employees</a></div>
                                            <div class="step-light-right">
                                                &nbsp;</div>
                                            <div class="step-no">
                                                3</div>
                                            <div class="step-dark-left">
                                                <a href="<%=ResolveUrl("~")%>ManageSystem/Employee/Modify">Modify details</a></div>
                                            <div class="step-dark-right">
                                                &nbsp;</div>
                                            <div class="step-no-off">
                                                4</div>
                                            <div class="step-light-left">
                                                <a href="<%=ResolveUrl("~")%>ManageSystem/Employee/Trash">Trash</a></div>
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
                                                            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>&nbsp;<asp:HyperLink
                                                                ID="hplnkYellow" runat="server" CssClass="close-yellow"></asp:HyperLink>
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
                                                                            <td colspan="2" class="title" align="left" style="padding: 10px 0px 10px 10px">
                                                                                Employee's information<br />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="2" align="center">
                                                                                <hr />
                                                                                <br />
                                                                                <asp:Image ID="imgAvatar" runat="server" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="center" class="content" colspan="2">
                                                                                <hr />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th align="right" class="content" style="text-align: right" valign="top" width="50%">
                                                                                First Name :
                                                                            </th>
                                                                            <td align="left">
                                                                                <asp:TextBox ID="txtFName" runat="server" CssClass="inp-form" ></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th align="right" class="content" style="text-align: right" valign="top" width="50%">
                                                                                Last Name :
                                                                            </th>
                                                                            <td align="left" valign="top">
                                                                                <asp:TextBox ID="txtLName" runat="server" CssClass="inp-form" ></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th align="right" class="content" style="text-align: right" valign="top" width="50%">
                                                                                Gender :
                                                                            </th>
                                                                            <td align="left" valign="top">
                                                                                <asp:RadioButtonList ID="radGender" runat="server" RepeatDirection="Horizontal">
                                                                                    <asp:ListItem>Male</asp:ListItem>
                                                                                    <asp:ListItem>Female</asp:ListItem>
                                                                                </asp:RadioButtonList>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th align="right" class="content" style="text-align: right" valign="top" width="50%">
                                                                                Date Of Birth :
                                                                            </th>
                                                                            <td>
                                                                                <asp:TextBox ID="txtDOB" runat="server" CssClass="inp-form datePicker"></asp:TextBox>
                                                                                <br />
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDOB"
                                                                                    Display="Dynamic" CssClass="content" Font-Size="12px" ErrorMessage="Date of birth is required."></asp:RequiredFieldValidator>
                                                                                <asp:CompareValidator ID="CompareValidator" runat="server" ControlToValidate="txtDOB"
                                                                                    Display="Dynamic" CssClass="content" Font-Size="12px" ErrorMessage="Your date of birth is invalid."
                                                                                    Operator="LessThanEqual" Type="Date"></asp:CompareValidator>
                                                                            </td>
                                                                            <td>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th align="right" class="content" style="text-align: right" valign="top" width="50%">
                                                                                Address :
                                                                            </th>
                                                                            <td valign="top">
                                                                                <asp:TextBox ID="txtAddress" runat="server"
                                                                                    TextMode="MultiLine" CssClass="form-textarea1"></asp:TextBox>
                                                                            </td>
                                                                            <td>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th align="right" class="content" style="text-align: right" valign="top" width="50%">
                                                                                Phone Number :
                                                                            </th>
                                                                            <td>
                                                                                <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="inp-form"></asp:TextBox>
                                                                                <br />
                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" CssClass="content"
                                                                                    Font-Size="12px" ControlToValidate="txtPhoneNumber" ErrorMessage="Phone number is invalid."
                                                                                    ValidationExpression="^[0-9]{6,15}"></asp:RegularExpressionValidator>
                                                                            </td>
                                                                            <td>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th align="right" class="content" style="text-align: right" valign="top" width="50%">
                                                                                Email :
                                                                            </th>
                                                                            <td>
                                                                                <asp:TextBox ID="txtEmail"  runat="server" CssClass="inp-form"></asp:TextBox>
                                                                                <br />
                                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail"
                                                                                    Display="Dynamic" CssClass="content" Font-Size="12px" ErrorMessage="Email is required."></asp:RequiredFieldValidator>
                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email is invalid."
                                                                                    ControlToValidate="txtEmail" Display="Dynamic" CssClass="content" Font-Size="12px"
                                                                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                                            </td>
                                                                            <td>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th align="right" class="content" style="text-align: right" valign="top" width="50%">
                                                                                Avatar :
                                                                            </th>
                                                                            <td>
                                                                                <asp:FileUpload ID="fuAvatar" CssClass="file_1" runat="server" />
                                                                                <br />
                                                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="fuAvatar"
                                                                                    Display="Dynamic" CssClass="content" Font-Size="12px" ErrorMessage="Your file is not invalid. It only supports image type."
                                                                                    ValidationExpression="^.+\.(([jJ][pP][eE]?[gG])|([gG][iI][fF])|([pP][nN][gG])|([bB][mM][pP])|([iI][cC][oO]))$"></asp:RegularExpressionValidator>
                                                                            </td>
                                                                            <td>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th align="right" class="content" style="text-align: right" valign="top" width="50%">
                                                                                Department:
                                                                            </th>
                                                                            <td>
                                                                                <div class="inp-form">
                                                                                    <asp:DropDownList ID="ddlDepartment" CssClass="styledselect_form" runat="server">
                                                                                    </asp:DropDownList>
                                                                                </div>
                                                                                <br />
                                                                                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="ddlDepartment"
                                                                                    Display="Dynamic" CssClass="content" Font-Size="12px" ErrorMessage="You must select department for new employee."
                                                                                    Operator="NotEqual" ValueToCompare="Select department"></asp:CompareValidator>
                                                                            </td>
                                                                            <td>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th width="50%" align="right" style="text-align: right" class="content" valign="top">
                                                                                &nbsp;
                                                                            </th>
                                                                            <td align="left" valign="top">
                                                                                <asp:LinkButton ID="lblRemove" CssClass="confirm" runat="server" CausesValidation="False"
                                                                                    OnClick="lblRemove_Click">Remove this employee</asp:LinkButton>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <th>
                                                                                &nbsp;
                                                                            </th>
                                                                            <td align="center" class="content">
                                                                                <asp:Button ID="UpdateButton" runat="server" CssClass="form-change-left" OnClick="UpdateButton_Click"
                                                                                    Text="" />
                                                                                <asp:Button ID="btnCancel" runat="server" CssClass="form-cancel" 
                                                                                    Text="" onclick="btnCancel_Click" />
                                                                            </td>
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
                                        <img src="/Website/App_Themes/images/shared/blank.gif" width="695" height="1" alt="blank" />
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