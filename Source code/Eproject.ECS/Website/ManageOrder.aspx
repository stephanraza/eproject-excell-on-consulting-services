<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageOrder.aspx.cs" Inherits="ServiceEmployee_ManageOrder" Title="Excell-on Consulting Services"
    ValidateRequest="false" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="Server">
    <div id="page-heading">
        <h1>
            MANAGE ORDER INFORMATION</h1>
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
                                                <a href="<%=ResolveUrl("~")%>ManageService/Order/Create">Create details</a></div>
                                            <div class="step-light-right">
                                                &nbsp;</div>
                                            <div class="step-no">
                                                2</div>
                                            <div class="step-dark-left">
                                                <a href="<%=ResolveUrl("~")%>ManageService/Order/Manage">Manage orders</a></div>
                                            <div class="step-dark-right">
                                                &nbsp;</div>
                                            <div class="step-no-off">
                                                3</div>
                                            <div class="step-light-left">
                                                <a href="<%=ResolveUrl("~")%>ManageService/Order/Modify">Modify details</a></div>
                                            <div class="step-light-right">
                                                &nbsp;</div>
                                            <div class="step-no-off">
                                                4</div>
                                            <div class="step-light-left">
                                                <a href="<%=ResolveUrl("~")%>ManageService/Order/Trash">Trash</a></div>
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
                                        <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <th valign="top" style="text-align: right; line-height: 28px; padding: 5px 15px 8px 0">
                                                    Search :
                                                </th>
                                                <td id="searchTD">
                                                    <asp:TextBox ID="txtSearch" CssClass="inp-form-search" runat="server" AutoPostBack="True"
                                                        OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" style="padding: 10px">
                                                    <asp:Panel ID="pnlSearchByService" runat="server">
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
                                                                                                Service :
                                                                                            </th>
                                                                                            <td align="left" class="th-label" valign="top" colspan="2">
                                                                                                <div class="inp-form">
                                                                                                    <asp:DropDownList ID="ddlService" CssClass="styledselect_form" runat="server" 
                                                                                                        AutoPostBack="True" 
                                                                                                        onselectedindexchanged="ddlService_SelectedIndexChanged">
                                                                                                    </asp:DropDownList>
                                                                                                </div>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <th width="50%" align="right" style="text-align: right" class="content" valign="top"
                                                                                                rowspan="2">
                                                                                                Total Charges :
                                                                                            </th>
                                                                                            <td align="center" class="th-label" valign="top">
                                                                                                From :
                                                                                            </td>
                                                                                            <td align="left" valign="top">
                                                                                                <div class="charge-form">
                                                                                                    <asp:DropDownList ID="ddlFrom" CssClass="styledselect_form_charge" runat="server" 
                                                                                                        AutoPostBack="True" onselectedindexchanged="ddlFrom_SelectedIndexChanged"
                                                                                                        >
                                                                                                        <asp:ListItem Selected="True" Value="0">Not selected</asp:ListItem>
                                                                                                        <asp:ListItem Value="50000">50.000</asp:ListItem>
                                                                                                        <asp:ListItem Value="100000">100.000</asp:ListItem>
                                                                                                        <asp:ListItem Value="200000">200.000</asp:ListItem>
                                                                                                        <asp:ListItem Value="500000">500.000</asp:ListItem>
                                                                                                        <asp:ListItem Value="1000000">1.000.000</asp:ListItem>
                                                                                                        <asp:ListItem Value="1500000">1.500.000</asp:ListItem>
                                                                                                        <asp:ListItem Value="2000000">2.000.000</asp:ListItem>
                                                                                                        <asp:ListItem Value="5000000">5.000.000</asp:ListItem>
                                                                                                    </asp:DropDownList>
                                                                                                </div>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="center" class="th-label" valign="top">
                                                                                                To :
                                                                                            </td>
                                                                                            <td align="left" valign="top">
                                                                                                <div class="charge-form">
                                                                                                    <asp:DropDownList ID="ddlTo" CssClass="styledselect_form_charge" runat="server" 
                                                                                                        AutoPostBack="True" onselectedindexchanged="ddlTo_SelectedIndexChanged"
                                                                                                        >
                                                                                                        <asp:ListItem Selected="True" Value="max">Not selected</asp:ListItem>
                                                                                                        <asp:ListItem Value="50000">50.000</asp:ListItem>
                                                                                                        <asp:ListItem Value="100000">100.000</asp:ListItem>
                                                                                                        <asp:ListItem Value="200000">200.000</asp:ListItem>
                                                                                                        <asp:ListItem Value="500000">500.000</asp:ListItem>
                                                                                                        <asp:ListItem Value="1000000">1.000.000</asp:ListItem>
                                                                                                        <asp:ListItem Value="1500000">1.500.000</asp:ListItem>
                                                                                                        <asp:ListItem Value="2000000">2.000.000</asp:ListItem>
                                                                                                        <asp:ListItem Value="5000000">5.000.000</asp:ListItem>
                                                                                                    </asp:DropDownList>
                                                                                                </div>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <th width="50%" align="right" style="text-align: right" class="content" valign="top"
                                                                                                rowspan="2">
                                                                                                Bill Date :
                                                                                            </th>
                                                                                            <td align="center" class="th-label" valign="top">
                                                                                                From Date :
                                                                                            </td>
                                                                                            <td align="left" valign="top">
                                                                                                <asp:TextBox ID="txtBillFromDate" CssClass="inp-form datePickerService" 
                                                                                                    runat="server" AutoPostBack="True" ontextchanged="txtBillFromDate_TextChanged"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="center" class="th-label" valign="top">
                                                                                                To Date :
                                                                                            </td>
                                                                                            <td align="left" valign="top">
                                                                                                <asp:TextBox ID="txtBillToDate" CssClass="inp-form datePickerService" 
                                                                                                    runat="server" AutoPostBack="True" ontextchanged="txtBillToDate_TextChanged"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <th width="50%" align="right" style="text-align: right" class="content" valign="top"
                                                                                                rowspan="2">
                                                                                                Payment Date :
                                                                                            </th>
                                                                                            <td align="center" class="th-label" valign="top">
                                                                                                From Date :
                                                                                            </td>
                                                                                            <td align="left" valign="top">
                                                                                                <asp:TextBox ID="txtPaymentFromDate" CssClass="inp-form datePickerService" 
                                                                                                    runat="server" AutoPostBack="True" 
                                                                                                    ontextchanged="txtPaymentFromDate_TextChanged"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td align="center" class="th-label" valign="top">
                                                                                                To Date :
                                                                                            </td>
                                                                                            <td align="left" valign="top">
                                                                                                <asp:TextBox ID="txtPaymentToDate" CssClass="inp-form datePickerService" 
                                                                                                    runat="server" AutoPostBack="True" ontextchanged="txtPaymentToDate_TextChanged"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <th width="50%" align="right" style="text-align: right" class="content" valign="top">
                                                                                                Status :
                                                                                            </th>
                                                                                            <td align="left" class="th-label" valign="top" colspan="2">
                                                                                                <div class="inp-form">
                                                                                                    <asp:DropDownList ID="ddlStatus" CssClass="styledselect_form" runat="server" 
                                                                                                        AutoPostBack="True" 
                                                                                                        onselectedindexchanged="ddlStatus_SelectedIndexChanged">
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
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="padding: 10px">
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" align="center">
                                                    <asp:GridView ID="grvManage" runat="server" AutoGenerateColumns="False" CssClass="product-table"
                                                        Width="90%" AllowSorting="True" OnSorting="grvManage_Sorting">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;Company&lt;/a&gt;" SortExpression="Company_Name">
                                                                <ItemTemplate>
                                                                    <asp:HyperLink ID="hplnkCompanyName" CssClass="close-green" runat="server" NavigateUrl='<%# GetCompanyURL(Eval("Company_Id")) %>'
                                                                        Text='<%# Eval("Company_Name") %>'></asp:HyperLink>
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:HyperLink ID="hplnkCompanyName" CssClass="close-green" runat="server" NavigateUrl='<%# GetCompanyURL(Eval("Company_Id")) %>'
                                                                        Text='<%# Eval("Company_Name") %>'></asp:HyperLink>
                                                                </AlternatingItemTemplate>
                                                                <HeaderStyle CssClass="table-header-repeat line-left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;Employee's Account&lt;/a&gt;" SortExpression="Account_UserName">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblUserName" runat="server" Text='<%# Eval("Account_UserName") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:Label ID="lblUserName" runat="server" Text='<%# Eval("Account_UserName") %>'></asp:Label>
                                                                </AlternatingItemTemplate>
                                                                <HeaderStyle CssClass="table-header-repeat line-left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;Bill Date&lt;/a&gt;" SortExpression="OrderOfService_BillDate">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblBillDate" runat="server" Text='<%# Eval("OrderOfService_BillDate") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:Label ID="lblBillDate" runat="server" Text='<%# Eval("OrderOfService_BillDate") %>'></asp:Label>
                                                                </AlternatingItemTemplate>
                                                                <HeaderStyle CssClass="table-header-repeat line-left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;Payment Date&lt;/a&gt;" SortExpression="OrderOfService_PaymentDate">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblPaymentDate" runat="server" Text='<%# Eval("OrderOfService_PaymentDate") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:Label ID="lblPaymentDate" runat="server" Text='<%# Eval("OrderOfService_PaymentDate") %>'></asp:Label>
                                                                </AlternatingItemTemplate>
                                                                <HeaderStyle CssClass="table-header-repeat line-left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;Payment Method&lt;/a&gt;" SortExpression="OrderOfService_PaymentMethod">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblPaymentMethod" runat="server" Text='<%# Eval("OrderOfService_PaymentMethod") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:Label ID="lblPaymentMethod" runat="server" Text='<%# Eval("OrderOfService_PaymentMethod") %>'></asp:Label>
                                                                </AlternatingItemTemplate>
                                                                <HeaderStyle CssClass="table-header-repeat line-left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;Total Services&lt;/a&gt;" SortExpression="Total_Service">
                                                                <ItemTemplate>
                                                                    <asp:HyperLink ID="hplnkTotalService" CssClass="close-green" runat="server" NavigateUrl='<%# GetTotalServiceURL(Eval("OrderOfService_Id")) %>'
                                                                        Text='<%# Eval("Total_Service") %>'></asp:HyperLink>
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:HyperLink ID="hplnkTotalService" CssClass="close-green" runat="server" NavigateUrl='<%# GetTotalServiceURL(Eval("OrderOfService_Id")) %>'
                                                                        Text='<%# Eval("Total_Service") %>'></asp:HyperLink>
                                                                </AlternatingItemTemplate>
                                                                <HeaderStyle CssClass="table-header-repeat line-left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;Total Charges ($)&lt;/a&gt;" SortExpression="Total_Charge">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblTotalCharge" runat="server" Text='<%# Eval("Total_Charge") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:Label ID="lblTotalCharge" runat="server" Text='<%# Eval("Total_Charge") %>'></asp:Label>
                                                                </AlternatingItemTemplate>
                                                                <HeaderStyle CssClass="table-header-repeat line-left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;Description&lt;/a&gt;" SortExpression="OrderOfService_Description">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("OrderOfService_Description") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("OrderOfService_Description") %>'></asp:Label>
                                                                </AlternatingItemTemplate>
                                                                <HeaderStyle CssClass="table-header-repeat line-left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;Status&lt;/a&gt;" SortExpression="OrderOfService_Status">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("OrderOfService_Status") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("OrderOfService_Status") %>'></asp:Label>
                                                                </AlternatingItemTemplate>
                                                                <HeaderStyle CssClass="table-header-repeat line-left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;Option&lt;/a&gt;">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="imgbtnRemove" runat="server" CssClass="confirm" ImageUrl="~/App_Themes/images/table/table_icon_remove.gif"
                                                                        CausesValidation="False" ToolTip="Remove order" OnClick="imgbtnRemove_Click" />
                                                                    <asp:HiddenField ID="hfOrderOfServiceId" runat="server" Value='<%# Eval("OrderOfService_Id") %>' />
                                                                    <asp:ImageButton ID="imgbtnEdit" runat="server" PostBackUrl='<%# GetOrderModifyURL(Eval("OrderOfService_Id")) %>'
                                                                        ImageUrl="~/App_Themes/images/table/table_icon_edit.gif" CausesValidation="False"
                                                                        ToolTip="Edit order"/>
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:ImageButton ID="imgbtnRemove" runat="server" CssClass="confirm" ImageUrl="~/App_Themes/images/table/table_icon_remove.gif"
                                                                        CausesValidation="False" ToolTip="Remove order" OnClick="imgbtnRemove_Click" />
                                                                    <asp:HiddenField ID="hfOrderOfServiceId" runat="server" Value='<%# Eval("OrderOfService_Id") %>' />
                                                                    <asp:ImageButton ID="imgbtnEdit" runat="server" PostBackUrl='<%# GetOrderModifyURL(Eval("OrderOfService_Id")) %>'
                                                                        ImageUrl="~/App_Themes/images/table/table_icon_edit.gif" CausesValidation="False"
                                                                        ToolTip="Edit order"/>
                                                                </AlternatingItemTemplate>
                                                                <HeaderStyle CssClass="table-header-repeat line-left" />
                                                            </asp:TemplateField>
                                                        </Columns>
                                                        <AlternatingRowStyle CssClass="alternate-row" />
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="padding-right: 10px;">
                                                    <!--  start paging..................................................... -->
                                                    <%--<table border="0" cellpadding="0" cellspacing="0" id="paging-table">
                                                        <tr>
                                                            <td style="border: none">
                                                                <asp:ImageButton ID="imgbtnFirst" runat="server" CssClass="page-far-left" OnClick="imgbtnFirst_Click"
                                                                    CausesValidation="False" ImageUrl="~/App_Themes/images/table/paging_far_left.gif">
                                                                </asp:ImageButton>
                                                                <asp:ImageButton ID="imgbtnBack" runat="server" CssClass="page-left" OnClick="imgbtnBack_Click"
                                                                    CausesValidation="False" ImageUrl="~/App_Themes/images/table/paging_left.gif">
                                                                </asp:ImageButton>
                                                                <div id="page-info">
                                                                    Page <strong>
                                                                        <asp:Label ID="lblCurrentPage" runat="server" Text=""></asp:Label></strong>
                                                                    /
                                                                    <asp:Label ID="lblTotalPage" runat="server" Text=""></asp:Label></div>
                                                                <asp:ImageButton ID="imgbtnNext" runat="server" CssClass="page-right" OnClick="imgbtnNext_Click"
                                                                    CausesValidation="False" ImageUrl="~/App_Themes/images/table/paging_right.gif">
                                                                </asp:ImageButton>
                                                                <asp:ImageButton ID="imgbtnLast" runat="server" CssClass="page-far-right" OnClick="imgbtnLast_Click"
                                                                    CausesValidation="False" ImageUrl="~/App_Themes/images/table/paging_far_right.gif">
                                                                </asp:ImageButton>
                                                            </td>
                                                            <td style="border: none">
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
                                                    </table>--%>
                                                    <!--  end paging................ -->
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

