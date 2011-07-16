<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TrashDepartment.aspx.cs" Inherits="HRManager_TrashDepartment" Title="Untitled Page" %>
<%@ Register src="~/Controls/PersonalInfoControl.ascx" tagname="PersonalInfoControl" tagprefix="ucPersonalInfoControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Excell-on Consulting Services</title>
    <!--[if IE]>
    <link rel="stylesheet" media="all" type="text/css" href="css/pro_dropline_ie.css" />
    <![endif]-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" Runat="Server">
<div id="page-heading"><h1>TRASH</h1></div>

    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
    <table border="0" width="100%" cellpadding="0" cellspacing="0" id="content-table">
    <tr>
	    <th rowspan="3" class="sized"><img src="/Website/App_Themes/images/shared/side_shadowleft.jpg" width="20" height="300" alt="" /></th>
	    <th class="topleft"></th>
	    <td id="tbl-border-top">&nbsp;</td>
	    <th class="topright"></th>
	    <th rowspan="3" class="sized"><img src="/Website/App_Themes/images/shared/side_shadowright.jpg" width="20" height="300" alt="" /></th>
    </tr>
    <tr>
	    <td id="tbl-border-left"></td>
	    <td>
	    <!--  start content-table-inner -->

	            <div id="content-table-inner">
            	
	            <table border="0" width="100%" cellpadding="0" cellspacing="0">
	            <tr valign="top">
	            <td>
            	
            	
		            <!--  start step-holder -->
		            <div id="step-holder">
			            <div class="step-no-off">1</div>
			            <div class="step-light-left"><a href="<%=ResolveUrl("~")%>ManageSystem/Department/Create">
                            Create details</a></div>
			            <div class="step-light-right">&nbsp;</div>
			            <div class="step-no-off">2</div>
			            <div class="step-light-left"><a href="<%=ResolveUrl("~")%>ManageSystem/Department/Manage">
                            Manage departments</a></div>
			            <div class="step-light-right">&nbsp;</div>
			            <div class="step-no-off">3</div>
			            <div class="step-light-left"><a href="<%=ResolveUrl("~")%>ManageSystem/Department/Modify">
                            Modify details</a></div>
			            <div class="step-light-right">&nbsp;</div>
			            <div class="step-no">4</div>
			            <div class="step-dark-left"><a href="<%=ResolveUrl("~")%>ManageSystem/Department/Trash">
                            Trash</a></div>
			            <div class="step-dark-round">&nbsp;</div>
			            <div class="clear"></div>
		            </div>
		            <!--  end step-holder -->
            	
    	        <!--  start message-yellow -->
    	                <asp:Panel ID="pnlYellow" runat="server" Visible="false">
				            <div id="message-yellow">
				            <table border="0" width="100%" cellpadding="0" cellspacing="0">
				            <tr>
					            <td class="yellow-left"><asp:Label ID="lblMessage" runat="server" Text=""></asp:Label><a href="#" class="close-yellow">
                                    Close and continue.</a></td>
					            <td class="yellow-right"><asp:HyperLink ID="HyperLink1" runat="server" CssClass="close-yellow" ImageUrl="~/App_Themes/images/table/icon_close_yellow.gif"></asp:HyperLink></td>
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
                                    and try again.</a></td>
					            <td class="red-right"><asp:HyperLink ID="HyperLink2" runat="server" CssClass="close-red" ImageUrl="~/App_Themes/images/table/icon_close_red.gif"></asp:HyperLink>
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
					            <td class="blue-left">Welcome back. <a href="">View my account.</a> </td>
					            <td class="blue-right"><asp:HyperLink ID="HyperLink3" runat="server" CssClass="close-blue" ImageUrl="~/App_Themes/images/table/icon_close_blue.gif"></asp:HyperLink>
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
                                    <asp:Label ID="lblSuccess" runat="server" Text=""></asp:Label>&nbsp;<a href="#" class="close-green" onclick="reset();">Continue.</a></td>
					            <td class="green-right"><asp:HyperLink ID="HyperLink5" runat="server" CssClass="close-green" ImageUrl="~/App_Themes/images/table/icon_close_green.gif"></asp:HyperLink>
				                </td>
				            </tr>
				            </table>
				            </div>
				        </asp:Panel>
				        <!--  end message-green -->
				        
				        
				        
		            <!-- start id-form -->
		                <table border="0" width="100%" cellpadding="0" cellspacing="0">
		            <tr>
                        <th valign="top" style="text-align:right; line-height:28px;padding:5px 15px 8px 0">
                            Search :</th>
                        <td id="searchTD"><asp:TextBox ID="txtSearch" CssClass="inp-form-search" runat="server" 
                                AutoPostBack="True" ontextchanged="txtSearch_TextChanged"></asp:TextBox>
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                            <ProgressTemplate>
                                <asp:Label ID="lblLoading" runat="server" CssClass="form-loading" 
                                    AssociatedControlID="txtSearch"></asp:Label> 
                       
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                        </td>     
                    </tr>
                    <tr>
                        <td colspan="2" style="padding:10px">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:GridView ID="grvManage" runat="server" AutoGenerateColumns="False" 
                                CssClass="product-table"
                                onselectedindexchanged="grvManage_SelectedIndexChanged" Width="90%" 
                                onrowdeleting="grvManage_RowDeleting" AllowSorting="True" 
                                onsorting="grvManage_Sorting">
                                <Columns>
                                    <asp:TemplateField HeaderText="&lt;a href&gt;Department Id&lt;/a&gt;" 
                                        HeaderStyle-CssClass="table-header-check" SortExpression="Department_Id"  
                                        ItemStyle-Width="40%">
                                       <ItemTemplate>
                                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Department_Id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <AlternatingItemTemplate>
                                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Department_Id") %>'></asp:Label>
                                        </AlternatingItemTemplate>
                                        <HeaderStyle CssClass="table-header-repeat line-left" />

                                    <ItemStyle Width="40%"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="&lt;a href&gt;Name&lt;/a&gt;" 
                                        SortExpression="Department_Name">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Department_Name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <AlternatingItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Department_Name") %>'></asp:Label>
                                        </AlternatingItemTemplate>
                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                        <ItemStyle Width="20%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="&lt;a href&gt;Description&lt;/a&gt;" 
                                        SortExpression="Department_Description">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" 
                                                Text='<%# Eval("Department_Description") %>'></asp:Label>
                                        </ItemTemplate>
                                        <AlternatingItemTemplate>
                                            <asp:Label ID="Label2" runat="server" 
                                                Text='<%# Eval("Department_Description") %>'></asp:Label>
                                        </AlternatingItemTemplate>
                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                    </asp:TemplateField>
                                    <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" 
                                        DeleteImageUrl="~/App_Themes/images/table/table_icon_delete.gif" 
                                        HeaderText="&lt;a href&gt;Option&lt;/a&gt;" 
                                        SelectImageUrl="~/App_Themes/images/table/table_icon_restore.gif" 
                                        ButtonType="Image" >
                                       <HeaderStyle CssClass="table-header-repeat line-left" />
                                    </asp:CommandField>
                                </Columns>
                                <AlternatingRowStyle CssClass="alternate-row" />
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="padding-right: 10px;">
                            <!--  start paging..................................................... -->
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
			                        <!--  end paging................ -->
                        </td>
                    </tr>
                    </table>
	                <!-- end id-form  -->
	                    
	                    
	                    
	            </td>
	            <td>
                    <asp:Panel ID="pnlPersonalInfo" runat="server">
                        <ucPersonalInfoControl:PersonalInfoControl ID="PersonalInfoControl" runat="server"/>
                    </asp:Panel>
                </td>
                </tr>
                <tr>
                <td><img src="/Website/App_Themes/images/shared/blank.gif" width="695" height="1" alt="blank" /></td>
                <td></td>
                </tr>
                </table>             
        	        
                <div class="clear"></div>
                </div>


    <!--  end content-table-inner  -->
    </td>
    <td id="tbl-border-right"></td>
    </tr>
    <tr>
	    <th class="sized bottomleft"></th>
	    <td id="tbl-border-bottom">&nbsp;</td>
	    <th class="sized bottomright"></th>
    </tr>
    </table>
    
    
    </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="txtSearch" EventName="TextChanged" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

