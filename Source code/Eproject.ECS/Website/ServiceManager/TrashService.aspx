<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="TrashService.aspx.cs" Inherits="ServiceManager_TrashService" Title="Excell-on Consulting Services"
    ValidateRequest="false" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="Server">
    <div id="page-heading">
        <h1>
            TRASH</h1>
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
                                                <a href="<%=ResolveUrl("~")%>ManageService/Service/Create">Create details</a></div>
                                            <div class="step-light-right">
                                                &nbsp;</div>
                                            <div class="step-no-off">
                                                2</div>
                                            <div class="step-light-left">
                                                <a href="<%=ResolveUrl("~")%>ManageService/Service/Manage">Manage services</a></div>
                                            <div class="step-light-right">
                                                &nbsp;</div>
                                            <div class="step-no-off">
                                                3</div>
                                            <div class="step-light-left">
                                                <a href="<%=ResolveUrl("~")%>ManageService/Service/Modify">Modify details</a></div>
                                            <div class="step-light-right">
                                                &nbsp;</div>
                                            <div class="step-no">
                                                4</div>
                                            <div class="step-dark-left">
                                                <a href="<%=ResolveUrl("~")%>ManageService/Service/Trash">Trash</a></div>
                                            <div class="step-dark-round">
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
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;Image&lt;/a&gt;" HeaderStyle-CssClass="table-header-check"
                                                                SortExpression="">
                                                                <ItemTemplate>
                                                                    <asp:Image ID="imgService" runat="server" ImageUrl='<%# GetURL(Eval("Service_Image")) %>' />
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:Image ID="imgService" runat="server" ImageUrl='<%# GetURL(Eval("Service_Image")) %>' />
                                                                </AlternatingItemTemplate>
                                                                <HeaderStyle CssClass="table-header-repeat line-left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;Name&lt;/a&gt;" SortExpression="Service_Name">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblServiceName" runat="server" Text='<%# Eval("Service_Name") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:Label ID="lblServiceName" runat="server" Text='<%# Eval("Service_Name") %>'></asp:Label>
                                                                </AlternatingItemTemplate>
                                                                <HeaderStyle CssClass="table-header-repeat line-left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;Charge ($)&lt;/a&gt;" SortExpression="Service_Charge">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCharge" runat="server" Text='<%# Eval("Service_Charge") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:Label ID="lblCharge" runat="server" Text='<%# Eval("Service_Charge") %>'></asp:Label>
                                                                </AlternatingItemTemplate>
                                                                <HeaderStyle CssClass="table-header-repeat line-left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;Description&lt;/a&gt;" SortExpression="Service_Description">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Service_Description") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:Label ID="lblDescription" runat="server" Text='<%# Eval("Service_Description") %>'></asp:Label>
                                                                </AlternatingItemTemplate>
                                                                <HeaderStyle CssClass="table-header-repeat line-left" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;Option&lt;/a&gt;">
                                                                <ItemTemplate>
                                                                    <asp:ImageButton ID="imgbtnDelete" runat="server" CssClass="confirmDelete" ImageUrl="~/App_Themes/images/table/table_icon_delete.gif"
                                                                        CausesValidation="False" ToolTip="Delete service permanently" OnClick="imgbtnDelete_Click" />
                                                                    <asp:HiddenField ID="hfServiceId" runat="server" Value='<%# Eval("Service_Id") %>' />
                                                                    <asp:ImageButton ID="imgbtnRestore" runat="server" CssClass="confirmRestore" ImageUrl="~/App_Themes/images/table/table_icon_restore.gif"
                                                                        CausesValidation="False" ToolTip="Restore service" OnClick="imgbtnRestore_Click" />
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:ImageButton ID="imgbtnDelete" runat="server" CssClass="confirmDelete" ImageUrl="~/App_Themes/images/table/table_icon_delete.gif"
                                                                        CausesValidation="False" ToolTip="Delete service permanently" OnClick="imgbtnDelete_Click" />
                                                                    <asp:HiddenField ID="hfServiceId" runat="server" Value='<%# Eval("Service_Id") %>' />
                                                                    <asp:ImageButton ID="imgbtnRestore" runat="server" CssClass="confirmRestore" ImageUrl="~/App_Themes/images/table/table_icon_restore.gif"
                                                                        CausesValidation="False" ToolTip="Restore service" OnClick="imgbtnRestore_Click" />
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
