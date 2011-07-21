<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ManageEmployee.aspx.cs" Inherits="HRManager_ManageEmployee" Title="Excell-on Consulting Services"
    ValidateRequest="false" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="Server">
    <div id="page-heading">
        <h1>
            MANAGE EMPLOYEE INFORMATION</h1>
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
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
                                            <div class="step-no">
                                                2</div>
                                            <div class="step-dark-left">
                                                <a href="<%=ResolveUrl("~")%>ManageSystem/Employee/Manage">Manage employees</a></div>
                                            <div class="step-dark-right">
                                                &nbsp;</div>
                                            <div class="step-no-off">
                                                3</div>
                                            <div class="step-light-left">
                                                <a href="<%=ResolveUrl("~")%>ManageSystem/Employee/Modify">Modify details</a></div>
                                            <div class="step-light-right">
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
                                                                ID="hplnkRed" runat="server" CssClass="close-red">Please 
                                    try again.</asp:HyperLink>
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
                                        <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <th valign="top" style="text-align: right; line-height: 28px; padding: 5px 15px 8px 0">
                                                    Search :
                                                </th>
                                                <td id="searchTD">
                                                    <asp:TextBox ID="txtSearch" CssClass="inp-form-search" runat="server" AutoPostBack="True"
                                                        OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <div class="inp-form">
                                                        <asp:DropDownList ID="ddlSearchBy" CssClass="styledselect_form" runat="server" AutoPostBack="True"
                                                            OnSelectedIndexChanged="ddlSearchBy_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" style="padding: 10px">
                                                    <asp:Panel ID="pnlSearchByAccount" runat="server" Visible="False">
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
                                                                                                <h3>
                                                                                                    Advanced search</h3>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="center" class="content" colspan="3">
                                                                                                <hr />
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <th width="50%" align="right" style="text-align: right" class="content" valign="top">
                                                                                                Status :
                                                                                            </th>
                                                                                            <td align="left" valign="top" colspan="2">
                                                                                                <div class="inp-form">
                                                                                                    <asp:DropDownList ID="ddlAdvanvedStatus" runat="server" CssClass="styledselect_form"
                                                                                                        AutoPostBack="True" OnSelectedIndexChanged="ddlAdvanvedStatus_SelectedIndexChanged">
                                                                                                        <asp:ListItem Selected="True">All</asp:ListItem>
                                                                                                        <asp:ListItem>Unlocked</asp:ListItem>
                                                                                                        <asp:ListItem>Locked</asp:ListItem>
                                                                                                    </asp:DropDownList>
                                                                                                </div>
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
                                                    </asp:Panel>
                                                    <asp:Panel ID="pnlSearchByEmployee" runat="server" Visible="False">
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
                                                                                                <h3>
                                                                                                    Advanced search</h3>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="center" class="content" colspan="3">
                                                                                                <hr />
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <th width="50%" align="right" style="text-align: right" class="content" valign="top">
                                                                                                Gender :
                                                                                            </th>
                                                                                            <td align="left" valign="top" colspan="2">
                                                                                                <div class="inp-form">
                                                                                                    <asp:DropDownList ID="ddlAdvancedGender" CssClass="styledselect_form" runat="server"
                                                                                                        AutoPostBack="True" OnSelectedIndexChanged="ddlAdvancedGender_SelectedIndexChanged">
                                                                                                        <asp:ListItem Selected="True">All</asp:ListItem>
                                                                                                        <asp:ListItem>Male</asp:ListItem>
                                                                                                        <asp:ListItem>Female</asp:ListItem>
                                                                                                    </asp:DropDownList>
                                                                                                </div>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <th width="50%" align="right" style="text-align: right" class="content" valign="top"
                                                                                                rowspan="2">
                                                                                                Date Of Birth :
                                                                                            </th>
                                                                                            <td align="center" class="th-label" valign="top">
                                                                                                From Date :
                                                                                            </td>
                                                                                            <td align="left" valign="top">
                                                                                                <asp:TextBox ID="txtAdvancedFromDate" CssClass="inp-form datePicker" runat="server"
                                                                                                    AutoPostBack="True" OnTextChanged="txtAdvancedFromDate_TextChanged"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="center" class="th-label" valign="top">
                                                                                                To Date :
                                                                                            </td>
                                                                                            <td align="left" valign="top">
                                                                                                <asp:TextBox ID="txtAdvancedToDate" CssClass="inp-form datePicker" runat="server"
                                                                                                    AutoPostBack="True" OnTextChanged="txtAdvancedToDate_TextChanged"></asp:TextBox>
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
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" style="padding: 10px">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" align="center">
                                                    <asp:GridView ID="grvManage" runat="server" AutoGenerateColumns="False" CssClass="product-table"
                                                        Width="90%" AllowSorting="True" OnSorting="grvManage_Sorting">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;Avatar&lt;/a&gt;" HeaderStyle-CssClass="table-header-check"
                                                                SortExpression="">
                                                                <ItemTemplate>
                                                                    <asp:Image ID="imgAvatar" runat="server" ImageUrl='<%# GetURL(Eval("Employee_Avatar")) %>' />
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:Image ID="imgAvatar" runat="server" ImageUrl='<%# GetURL(Eval("Employee_Avatar")) %>' />
                                                                </AlternatingItemTemplate>
                                                                <HeaderStyle CssClass="table-header-repeat line-left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;Account&lt;/a&gt;" HeaderStyle-CssClass="table-header-repeat line-left"
                                                                SortExpression="Account_UserName">
                                                                <ItemTemplate>
                                                                    <asp:HyperLink ID="hplnkUserName" CssClass="close-green" runat="server" NavigateUrl='<%# GetAccountURL(Eval("Account_Id")) %>'
                                                                        Text='<%# Eval("Account_UserName") %>'></asp:HyperLink>
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:HyperLink ID="hplnkUserName" CssClass="close-green" runat="server" NavigateUrl='<%# GetAccountURL(Eval("Account_Id")) %>'
                                                                        Text='<%# Eval("Account_UserName") %>'></asp:HyperLink>
                                                                </AlternatingItemTemplate>
                                                                <HeaderStyle CssClass="table-header-repeat line-left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;Role&lt;/a&gt;" HeaderStyle-CssClass="table-header-repeat line-left"
                                                                SortExpression="Role_Name">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblRoleName" runat="server" Text='<%# Eval("Role_Name") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:Label ID="lblRoleName" runat="server" Text='<%# Eval("Role_Name") %>'></asp:Label>
                                                                </AlternatingItemTemplate>
                                                                <HeaderStyle CssClass="table-header-repeat line-left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;Full Name&lt;/a&gt;" HeaderStyle-CssClass="table-header-repeat line-left"
                                                                SortExpression="Employee_LastName">
                                                                <ItemTemplate>
                                                                    <asp:HyperLink ID="hplnkFName" CssClass="close-green" runat="server" NavigateUrl='<%# GetEmployeeURL(Eval("Employee_Id")) %>'
                                                                        Text='<%# Eval("Employee_FullName") %>'></asp:HyperLink>
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:HyperLink ID="hplnkFName" CssClass="close-green" runat="server" NavigateUrl='<%# GetEmployeeURL(Eval("Employee_Id")) %>'
                                                                        Text='<%# Eval("Employee_FullName") %>'></asp:HyperLink>
                                                                </AlternatingItemTemplate>
                                                                <HeaderStyle CssClass="table-header-repeat line-left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;Gender&lt;/a&gt;" SortExpression="Employee_Gender">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblGender" runat="server" Text='<%# Eval("Employee_Gender") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:Label ID="lblGender" runat="server" Text='<%# Eval("Employee_Gender") %>'></asp:Label>
                                                                </AlternatingItemTemplate>
                                                                <HeaderStyle CssClass="table-header-repeat line-left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;DOB&lt;/a&gt;" SortExpression="Employee_DateOfBirth">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("Employee_DateOfBirth") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("Employee_DateOfBirth") %>'></asp:Label>
                                                                </AlternatingItemTemplate>
                                                                <HeaderStyle CssClass="table-header-repeat line-left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;Address&lt;/a&gt;" SortExpression="Employee_Address">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Employee_Address") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Employee_Address") %>'></asp:Label>
                                                                </AlternatingItemTemplate>
                                                                <HeaderStyle CssClass="table-header-repeat line-left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;Phone Number&lt;/a&gt;" SortExpression="Employee_PhoneNumber">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblPhone" runat="server" Text='<%# Eval("Employee_PhoneNumber") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:Label ID="lblPhone" runat="server" Text='<%# Eval("Employee_PhoneNumber") %>'></asp:Label>
                                                                </AlternatingItemTemplate>
                                                                <HeaderStyle CssClass="table-header-repeat line-left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;Email&lt;/a&gt;" SortExpression="Employee_Email">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Employee_Email") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Employee_Email") %>'></asp:Label>
                                                                </AlternatingItemTemplate>
                                                                <HeaderStyle CssClass="table-header-repeat line-left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;Department&lt;/a&gt;" SortExpression="Department_Name">
                                                                <ItemTemplate>
                                                                    <asp:HyperLink ID="hplnkDepartment" CssClass="close-green" runat="server" NavigateUrl='<%# GetDepartmentURL(Eval("Department_Id")) %>'
                                                                        Text='<%# Eval("Department_Name") %>'></asp:HyperLink>
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:HyperLink ID="hplnkDepartment" CssClass="close-green" runat="server" NavigateUrl='<%# GetDepartmentURL(Eval("Department_Id")) %>'
                                                                        Text='<%# Eval("Department_Name") %>'></asp:HyperLink>
                                                                </AlternatingItemTemplate>
                                                                <HeaderStyle CssClass="table-header-repeat line-left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;Option&lt;/a&gt;">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="imgbtnRemove" runat="server" CssClass="confirm" ImageUrl="~/App_Themes/images/table/table_icon_remove.gif"
                                                                        CausesValidation="False" ToolTip="Remove employee & account" OnClick="imgbtnRemove_Click" />
                                                                    <asp:HiddenField ID="hfEmployeeId" runat="server" Value='<%# Eval("Employee_Id") %>' />
                                                                    <% if (IsAdmin())
                                                                       {%>
                                                                    <asp:ImageButton ID="imgbtnEditAccount" runat="server" ToolTip="Edit account" CausesValidation="False"
                                                                        ImageUrl="~/App_Themes/images/table/table_icon_account.gif" OnClick="imgbtnEditAccount_Click" />
                                                                    <%}%>
                                                                    <asp:ImageButton ID="imgbtnEditEmployee" runat="server" PostBackUrl='<%# GetEmployeeURL(Eval("Employee_Id")) %>'
                                                                        ImageUrl="~/App_Themes/images/table/table_icon_edit.gif" CausesValidation="False"
                                                                        ToolTip="Edit employee" />
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:ImageButton ID="imgbtnRemove" runat="server" CssClass="confirm" ImageUrl="~/App_Themes/images/table/table_icon_remove.gif"
                                                                        CausesValidation="False" ToolTip="Remove employee & account" OnClick="imgbtnRemove_Click" />
                                                                    <asp:HiddenField ID="hfEmployeeId" runat="server" Value='<%# Eval("Employee_Id") %>' />
                                                                    <% if (IsAdmin())
                                                                       {%>
                                                                    <asp:ImageButton ID="imgbtnEditAccount" runat="server" ToolTip="Edit account" CausesValidation="False"
                                                                        ImageUrl="~/App_Themes/images/table/table_icon_account.gif" OnClick="imgbtnEditAccount_Click" />
                                                                    <%}%>
                                                                    <asp:ImageButton ID="imgbtnEditEmployee" runat="server" PostBackUrl='<%# GetEmployeeModifyURL(Eval("Employee_Id")) %>'
                                                                        ImageUrl="~/App_Themes/images/table/table_icon_edit.gif" CausesValidation="False"
                                                                        ToolTip="Edit employee" />
                                                                </AlternatingItemTemplate>
                                                                <HeaderStyle CssClass="table-header-repeat line-left" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <AlternatingRowStyle CssClass="alternate-row" />
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" style="padding-right: 10px;">
                                                    <%--<!--  start paging..................................................... -->
			                    <table border="0" cellpadding="0" cellspacing="0" id="paging-table">
			                                <tr>
			                                    <td style="border:none">
                                                    <asp:ImageButton ID="imgbtnFirst" runat="server" CssClass="page-far-left" 
                                                        onclick="imgbtnFirst_Click" CausesValidation="False" 
                                                        ImageUrl="~/App_Themes/images/table/paging_far_left.gif"></asp:ImageButton>
                                                    <asp:ImageButton ID="imgbtnBack" runat="server" CssClass="page-left" 
                                                        onclick="imgbtnBack_Click" CausesValidation="False" 
                                                        ImageUrl="~/App_Themes/images/table/paging_left.gif"></asp:ImageButton>
				                                    <div id="page-info">Page <strong>
                                                    <asp:Label ID="lblCurrentPage" runat="server" Text=""></asp:Label></strong> / 
                                                    <asp:Label ID="lblTotalPage" runat="server" Text=""></asp:Label></div>
                                                    <asp:ImageButton ID="imgbtnNext" runat="server" CssClass="page-right" 
                                                        onclick="imgbtnNext_Click" CausesValidation="False" 
                                                        ImageUrl="~/App_Themes/images/table/paging_right.gif"></asp:ImageButton>
                                                    <asp:ImageButton ID="imgbtnLast" runat="server" CssClass="page-far-right" 
                                                        onclick="imgbtnLast_Click" CausesValidation="False" 
                                                        ImageUrl="~/App_Themes/images/table/paging_far_right.gif"></asp:ImageButton>
			                                    </td>
			                                    <td style="border:none">
			                                    <div class="select_page">
                                                <asp:DropDownList ID="ddlPagesize" CssClass="styledselect_page" runat="server" AutoPostBack="False">
                                                    <asp:ListItem Value="10">Number of rows</asp:ListItem>
                                                    <asp:ListItem>10</asp:ListItem>
                                                    <asp:ListItem>20</asp:ListItem>
                                                    <asp:ListItem>30</asp:ListItem>
                                                    <asp:ListItem>40</asp:ListItem>
                                                    <asp:ListItem>50</asp:ListItem>
                                                </asp:DropDownList>
                                                </div>
			                                    </td>
			                                </tr>
			                            </table>
			                <!--  end paging................ -->--%>
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
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="txtSearch" EventName="TextChanged" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
