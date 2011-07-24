<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="DisplayOrder.aspx.cs" Inherits="ServiceEmployee_DisplayOrder" Title="Excell-on Consulting Services" %>

<%@ Register Src="~/Controls/PersonalInfoControl.ascx" TagName="PersonalInfoControl"
    TagPrefix="ucPersonalInfoControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="Server">
    <div id="page-heading">
        <h1>
            ORDER INFORMATION</h1>
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
                                        <a href="<%=ResolveUrl("~")%>ManageService/Order/Create">Create details</a></div>
                                    <div class="step-light-right">
                                        &nbsp;</div>
                                    <div class="step-no-off">
                                        2</div>
                                    <div class="step-light-left">
                                        <a href="<%=ResolveUrl("~")%>ManageService/Order/Manage">Manage orders</a></div>
                                    <div class="step-light-right">
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
                                                                        Order's Information<br />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center" class="content" colspan="2">
                                                                        <hr />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th align="right" style="text-align: right; width: 50%" class="content" valign="top">
                                                                        Company Name :
                                                                    </th>
                                                                    <td align="left" valign="top">
                                                                        <asp:LinkButton ID="lnkCompany" runat="server" CssClass="th-label-a" OnClick="lnkCompany_Click"></asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th align="right" style="text-align: right" class="content" valign="top">
                                                                        Employee's Account :
                                                                    </th>
                                                                    <td align="left" valign="top">
                                                                        <asp:Label ID="lblDisplayAccount" runat="server" CssClass="th-label" Text=""></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th align="right" style="text-align: right" class="content" valign="top">
                                                                        Bill Date :
                                                                    </th>
                                                                    <td align="left" valign="top">
                                                                        <asp:Label ID="lblDisplayBillDate" runat="server" CssClass="th-label" Text=""></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th align="right" style="text-align: right" class="content" valign="top">
                                                                        Payment Date :
                                                                    </th>
                                                                    <td align="left" valign="top">
                                                                        <asp:Label ID="lblDisplayPaymentDate" runat="server" CssClass="th-label" Text=""></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th align="right" style="text-align: right" class="content" valign="top">
                                                                        Payment Method :
                                                                    </th>
                                                                    <td align="left" valign="top">
                                                                        <asp:Label ID="lblDisplayMethod" runat="server" CssClass="th-label" Text=""></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th align="right" style="text-align: right" class="content" valign="top">
                                                                        Total Services :
                                                                    </th>
                                                                    <td align="left" valign="top">
                                                                        <asp:Label ID="lblDisplayTotalServices" runat="server" CssClass="th-label" Text=""></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th align="right" style="text-align: right" class="content" valign="top">
                                                                        Total Charges :
                                                                    </th>
                                                                    <td align="left" valign="top">
                                                                        <asp:Label ID="lblDisplayTotalCharges" runat="server" CssClass="th-label" Text=""></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th align="right" style="text-align: right" class="content" valign="top">
                                                                        Description :
                                                                    </th>
                                                                    <td align="left" valign="top">
                                                                        <asp:Label ID="lblDisplayDescription" runat="server" CssClass="th-label" Text=""></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th align="right" style="text-align: right" class="content" valign="top">
                                                                        Status :
                                                                    </th>
                                                                    <td align="left" valign="top">
                                                                        <asp:Label ID="lblDisplayStatus" runat="server" CssClass="th-label" Text=""></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th align="right" style="text-align: right" class="content" valign="top">
                                                                        
                                                                    </th>
                                                                    <td align="left" valign="top">
                                                                        <asp:LinkButton ID="lnkRestore" runat="server" Text="Restore this order" 
                                                                            Visible="false" onclick="lnkRestore_Click"></asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <asp:Panel ID="pnlLink" runat="server">
                                                                        <th align="right" style="text-align: right" class="content" valign="top">
                                                                            &nbsp;
                                                                        </th>
                                                                        <td colspan="3">
                                                                            <div style="float: left">
                                                                                <ul class="greyarrow">
                                                                                    <li>
                                                                                        <asp:HyperLink ID="hplnkDisplayModifyOrder" runat="server" Text="Click here modify order"></asp:HyperLink></li>
                                                                                </ul>
                                                                            </div>
                                                                        </td>
                                                                    </asp:Panel>
                                                                </tr>
                                                            </table>
                </div>
                </div> </div> </div>
            </td>
        </tr>
        <tr>
            <td>
                <table border="0" cellpadding="0" width="100%" cellspacing="0">
                    <tr>
                        <td align="center">
                            <asp:GridView ID="grvPrevew" runat="server" AutoGenerateColumns="False" CssClass="product-table"
                                Width="90%" AllowSorting="True" RowStyle-HorizontalAlign="Center" OnSorting="grvManage_Sorting">
                                <Columns>
                                    <asp:TemplateField HeaderText="&lt;a href&gt;Logo&lt;/a&gt;" SortExpression="Service_Image">
                                        <AlternatingItemTemplate>
                                            <asp:Image ID="Image1" ImageUrl='<%# GetURL(Eval("Service_Image")) %>' runat="server" />
                                        </AlternatingItemTemplate>
                                        <ItemTemplate>
                                            <asp:Image ID="Image1" ImageUrl='<%# GetURL(Eval("Service_Image")) %>' runat="server" />
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="&lt;a href&gt;Name&lt;/a&gt;" SortExpression="Service_Name">
                                        <AlternatingItemTemplate>
                                            <asp:Label ID="lblServiceName" runat="server" Text='<%# Eval("Service_Name") %>'></asp:Label>
                                        </AlternatingItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblServiceName" runat="server" Text='<%# Eval("Service_Name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="&lt;a href&gt;From Date&lt;/a&gt;">
                                        <AlternatingItemTemplate>
                                            <asp:Label ID="lblFromDate" runat="server" Text='<%# Eval("OrderOfServiceDetail_FromDate") %>'></asp:Label>
                                        </AlternatingItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblFromDate" runat="server" Text='<%# Eval("OrderOfServiceDetail_FromDate") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="&lt;a href&gt;To Date&lt;/a&gt;">
                                        <AlternatingItemTemplate>
                                            <asp:Label ID="lblToDate" runat="server" Text='<%# Eval("OrderOfServiceDetail_ToDate") %>'></asp:Label>
                                        </AlternatingItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblToDate" runat="server" Text='<%# Eval("OrderOfServiceDetail_ToDate") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="&lt;a href&gt;Number Employee&lt;/a&gt;">
                                        <AlternatingItemTemplate>
                                            <asp:Label ID="lblNumberEmployee" runat="server" Text='<%# Eval("OrderOfServiceDetail_NumberOfEmployee") %>'></asp:Label>
                                        </AlternatingItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblNumberEmployee" runat="server" Text='<%# Eval("OrderOfServiceDetail_NumberOfEmployee") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="&lt;a href&gt;Price ($)&lt;/a&gt;">
                                        <AlternatingItemTemplate>
                                            <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("OrderOfServiceDetail_Price") %>'></asp:Label>
                                        </AlternatingItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("OrderOfServiceDetail_Price") %>'></asp:Label>
                                        </ItemTemplate>
                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                    </asp:TemplateField>
                                </Columns>
                                <AlternatingRowStyle CssClass="alternate-row" />
                                <RowStyle HorizontalAlign="Center" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
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
