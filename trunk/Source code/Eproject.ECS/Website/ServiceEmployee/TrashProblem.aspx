<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="TrashProblem.aspx.cs" Inherits="ServiceEmployee_TrashProblem" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Excell-on Consulting Services</title>

    <script type="text/javascript" language="javascript">
        function confirmRemove() {
            return confirm("Are you sure to remove this problem ?");
        }
    </script>

    <style type="text/css">
        .style1
        {
            height: 19px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="Server">
    <div id="page-heading">
        <h1>
            TRASH INFORMATION</h1>
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
                                                <a href="<%=ResolveUrl("~")%>ManageService/Problem/Create">Create details</a></div>
                                            <div class="step-light-right">
                                                &nbsp;</div>
                                            <div class="step-no-off">
                                                2</div>
                                            <div class="step-light-left">
                                                <a href="<%=ResolveUrl("~")%>ManageService/Problem/Manage">Manage company</a></div>
                                            <div class="step-light-right">
                                                &nbsp;</div>
                                            <div class="step-no-off">
                                                3</div>
                                            <div class="step-light-left">
                                                <a href="<%=ResolveUrl("~")%>ManageService/Problem/Modify">Modify details</a></div>
                                            <div class="step-light-right">
                                                &nbsp;</div>
                                            <div class="step-no">
                                                4</div>
                                            <div class="step-dark-left">
                                                <a href="<%=ResolveUrl("~")%>ManageService/Problem/Trash">Trash</a></div>
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
                                                            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label><a href="#" class="close-yellow">
                                                                Close and continue.</a>
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
                                                                onclick="reset();">Continue.</a>
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
                                        <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <th valign="top" style="text-align: right; line-height: 28px; padding: 5px 15px 8px 0">
                                                    Search :
                                                </th>
                                                <td id="searchTD">
                                                    <asp:TextBox ID="txtSearch" CssClass="inp-form-search" runat="server" AutoPostBack="True"
                                                        OnTextChanged="txtSearch_TextChanged"></asp:TextBox>
                                                    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                                        <ProgressTemplate>
                                                            <asp:Label ID="lblLoading" runat="server" CssClass="form-loading" AssociatedControlID="txtSearch"></asp:Label>
                                                        </ProgressTemplate>
                                                    </asp:UpdateProgress>
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
                                                        Width="95%" OnSelectedIndexChanging="grvManage_SelectedIndexChanging" OnRowDeleting="grvManage_RowDeleting"
                                                        AllowPaging="True" OnPageIndexChanging="grvManage_PageIndexChanging">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;Problem Id&lt;/a&gt;" HeaderStyle-CssClass="table-header-check"
                                                                SortExpression="Department_Id" ItemStyle-Width="30%">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblId" runat="server" Text='<%# Eval("Problem_Id") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:Label ID="lblId" runat="server" Text='<%# Eval("Problem_Id") %>'></asp:Label>
                                                                </AlternatingItemTemplate>
                                                                <HeaderStyle CssClass="table-header-repeat line-left" />
                                                                <ItemStyle Width="20%"></ItemStyle>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;Title&lt;/a&gt;" SortExpression="Problem_Title">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblTitle" runat="server" Text='<%# Eval("Problem_Title") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:Label ID="lblTitle2" runat="server" Text='<%# Eval("Problem_Title") %>'></asp:Label>
                                                                </AlternatingItemTemplate>
                                                                <HeaderStyle CssClass="table-header-repeat line-left" />
                                                                <ItemStyle Width="16%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;Content&lt;/a&gt;" SortExpression="Problem_Content">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblContent" runat="server" Text='<%# Eval("Problem_Content") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:Label ID="lblContent2" runat="server" Text='<%# Eval("Problem_Content") %>'></asp:Label>
                                                                </AlternatingItemTemplate>
                                                                <HeaderStyle CssClass="table-header-repeat line-left" />
                                                                <ItemStyle Width="16%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;Date&lt;/a&gt;" SortExpression="ProblemOfCustomer_Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDate" runat="server" Text='<%# Eval("ProblemOfCustomer_Date") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:Label ID="lblDate2" runat="server" Text='<%# Eval("ProblemOfCustomer_Date") %>'></asp:Label>
                                                                </AlternatingItemTemplate>
                                                                <HeaderStyle CssClass="table-header-repeat line-left" />
                                                                <ItemStyle Width="16%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;Customer Name&lt;/a&gt;" SortExpression="Customer_FulName">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCustomer" runat="server" Text='<%# Eval("Customer_FulName") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:Label ID="lblCustomer2" runat="server" Text='<%# Eval("Customer_FulName") %>'></asp:Label>
                                                                </AlternatingItemTemplate>
                                                                <HeaderStyle CssClass="table-header-repeat line-left" />
                                                                <ItemStyle Width="16%" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="&lt;a href&gt;Company Name&lt;/a&gt;" SortExpression="Company_Name">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCompany" runat="server" Text='<%# Eval("Company_Name") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <AlternatingItemTemplate>
                                                                    <asp:Label ID="lblCompany2" runat="server" Text='<%# Eval("Company_Name") %>'></asp:Label>
                                                                </AlternatingItemTemplate>
                                                                <HeaderStyle CssClass="table-header-repeat line-left" />
                                                                <ItemStyle Width="16%" />
                                                            </asp:TemplateField>
                                                            <%--<asp:TemplateField ShowHeader="False">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select"
                                                                        Text="Select"></asp:LinkButton>
                                                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                                                                        Text="Delete"></asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>--%><asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                                                        </Columns>
                                                        <AlternatingRowStyle CssClass="alternate-row" />
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="padding: 10px">
                                                    &nbsp;
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
