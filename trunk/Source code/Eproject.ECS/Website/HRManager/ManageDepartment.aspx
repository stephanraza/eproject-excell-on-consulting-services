<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageDepartment.aspx.cs" Inherits="HRManager_ManageDepartment" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Excell-on Consulting Services</title>
    <script type="text/javascript" language="javascript">
        function confirmRemove() {
            return confirm("Are you sure to remove this department ?");
        }
    </script>
    <!--[if IE]>
    <link rel="stylesheet" media="all" type="text/css" href="css/pro_dropline_ie.css" />
    <![endif]-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" Runat="Server">
    <div id="page-heading"><h1>MANAGE ACCOUNT INFORMATION</h1></div>

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
			            <div class="step-no">2</div>
			            <div class="step-dark-left"><a href="<%=ResolveUrl("~")%>ManageSystem/Department/Manage">
                            Manage departments</a></div>
			            <div class="step-dark-right">&nbsp;</div>
			            <div class="step-no-off">3</div>
			            <div class="step-light-left"><a href="<%=ResolveUrl("~")%>ManageSystem/Department/Modify">
                            Modify details</a></div>
			            <div class="step-light-right">&nbsp;</div>
			            <div class="step-no-off">4</div>
			            <div class="step-light-left"><a href="<%=ResolveUrl("~")%>ManageSystem/Department/Trash">
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
                        <th valign="top" style="text-align:right; line-height:28px;padding:5px 15px 8px 0">Search :</th>
                        <td><asp:TextBox ID="txtSearch" CssClass="inp-form-search" runat="server" 
                                AutoPostBack="True" ontextchanged="txtSearch_TextChanged"></asp:TextBox>
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                            <ProgressTemplate>
                                <asp:Label ID="lblLoading" runat="server" CssClass="form-loading" 
                                    AssociatedControlID="txtSearch" Height="32px" Width="32px">aaaaaaaaaaaaaaaaaaaaaa</asp:Label>
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
                                DataSourceID="SqlDataSource1" CssClass="product-table"
                                onselectedindexchanged="grvManage_SelectedIndexChanged" Width="90%" 
                                onrowdeleting="grvManage_RowDeleting">
                                <Columns>
                                    <asp:TemplateField HeaderText="<a hreft>Department Id</a>" HeaderStyle-CssClass="table-header-check" SortExpression="Department_Id"  ItemStyle-Width="40%">
                                        <EditItemTemplate>
                                            <asp:Label ID="lblId" runat="server" Text='<%# Bind("Department_Id") %>'></asp:Label>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="lblId" runat="server" Text='<%# Bind("Department_Id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <AlternatingItemTemplate>
                                            <asp:Label ID="lblId" runat="server" Text='<%# Bind("Department_Id") %>'></asp:Label>
                                        </AlternatingItemTemplate>
                                        <HeaderStyle CssClass="table-header-repeat line-left" />

                                    <ItemStyle Width="40%"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="&lt;a href&gt;Name&lt;/a&gt;" 
                                        SortExpression="Department_Name">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Department_Name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Department_Name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <AlternatingItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Department_Name") %>'></asp:Label>
                                        </AlternatingItemTemplate>
                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                        <ItemStyle Width="20%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="&lt;a href&gt;Description&lt;/a&gt;" 
                                        SortExpression="Department_Description">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" 
                                                Text='<%# Bind("Department_Description") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" 
                                                Text='<%# Bind("Department_Description") %>'></asp:Label>
                                        </ItemTemplate>
                                        <AlternatingItemTemplate>
                                            <asp:Label ID="Label2" runat="server" 
                                                Text='<%# Bind("Department_Description") %>'></asp:Label>
                                        </AlternatingItemTemplate>
                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<a href>Action</a>" HeaderStyle-CssClass="table-header-repeat line-left">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="imgbtnSelect" runat="server" CausesValidation="False" 
                                                CommandName="Select" Text="Select" ImageUrl="../App_Themes/images/table/table_icon_edit.gif"></asp:ImageButton>
                                            <asp:ImageButton ID="imgbtnRemove" runat="server" CausesValidation="False" 
                                                CommandName="Delete" Text="Remove" ImageUrl="../App_Themes/images/table/table_icon_remove.gif"></asp:ImageButton>
                                        </ItemTemplate>
                                        <AlternatingItemTemplate>
                                            <asp:ImageButton ID="imgbtnSelect" runat="server" CausesValidation="False" 
                                                CommandName="Select" Text="Select" ImageUrl="../App_Themes/images/table/table_icon_edit.gif"></asp:ImageButton>
                                            <asp:ImageButton ID="imgbtnRemove" runat="server" CausesValidation="False" 
                                                CommandName="Delete" Text="Remove" ImageUrl="../App_Themes/images/table/table_icon_remove.gif"></asp:ImageButton>
                                        </AlternatingItemTemplate>
                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                    </asp:TemplateField>
                                </Columns>
                                <AlternatingRowStyle CssClass="alternate-row" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ECS %>" 
                                ProviderName="<%$ ConnectionStrings:ECS.ProviderName %>" 
                                DeleteCommand="DELETE FROM [Department] WHERE [Department_Id] = @Department_Id" 
                                SelectCommand="SELECT [Department_Id], [Department_Name], [Department_Description] FROM [Department] WHERE ([Department_IsDelete] = @Department_IsDelete)" 
                                >
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="False" Name="Department_IsDelete" Type="Boolean" />
                                </SelectParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="Department_Id" Type="Object" />
                                </DeleteParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="padding:10px">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">                        
                            <asp:FormView ID="frmManage" runat="server" DataSourceID="SqlDataSource1" 
                                DefaultMode="Insert" Width="90%">
                                <EditItemTemplate>
                                <!-- START EDIT TEMPLATE -->   
		                    <table border="0" cellpadding="0" cellspacing="0"  id="id-form" width="100%">
	                    <tr>
	                        <td>
		                    <div >
                              <div style="margin:0px 100px 0px 100px">
                                    
                                  <div style="padding:5px; border:solid 1px #CCC;">
	                              <div style="background:#ECECEC">
	                                <table width="100%" border="0" align="center" cellpadding="2" cellspacing="2">
	                                  <tr>
	                                    <td colspan="2" class="title" align="left" style="padding:10px 0px 10px 10px">Department information<br />
	                                      </td>
                                      </tr>
	                                  <tr>
	                                    <td colspan="2" >
	                                      <hr />
	                                      <br />
               	                          <p class="content" style="font-size:12px">- Change information of the department that is selected.</p></td>
                                      </tr>
	                                  <tr>
	                                    <td align="center" class="content" colspan="2"><hr /></td>
                                      </tr>
	                                  <tr>
	                                      <th align="right" class="content" style="text-align:right" valign="top" 
                                              width="50%">
                                              Department Name :</th>
                                          <td align="left">
                                              <asp:Label ID="Department_NameLabel" runat="server" CssClass="th-label" 
                                                  Text='<%# Bind("Department_Name") %>'></asp:Label>
                                          </td>
                                          <tr>
                                              <th align="right" class="content" style="text-align:right" valign="top" 
                                                  width="50%">
                                                  Description :</th>
                                              <td align="left" valign="top">
                                                  <asp:TextBox ID="Department_DescriptionTextBox" runat="server" 
                                                      CssClass="form-textarea1" Text='<%# Bind("Department_Description") %>' 
                                                      TextMode="MultiLine"></asp:TextBox>
                                              </td>
                                              <tr>
                                                  <th>
                                                      &nbsp;</th>
                                                  <td align="center" class="content">
                                                      <asp:Button ID="UpdateButton" runat="server" CssClass="form-change-left" 
                                                          onclick="UpdateButton_Click" Text="" />
                                                      <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                                                          CommandName="Cancel" CssClass="form-cancel" Text="" />
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
	                <!-- END EDIT TEMPLATE  -->
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                <table border="0" cellpadding="0" cellspacing="0"  id="id-form">
		                            <tr>
			                            <th valign="top">Department Name :</th>
			                            <td>
                                            <asp:TextBox ID="Department_NameTextBox" Text='<%# Bind("Department_Name") %>' runat="server" CssClass="inp-form"></asp:TextBox>
                                            <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="Department_NameTextBox" Display="Dynamic" CssClass="content" Font-Size="12px"
                                            ErrorMessage="Name of department is required."></asp:RequiredFieldValidator>
                                        </td>
			                            <td>&nbsp;</td>
		                            </tr>
		                            <tr>
			                            <th valign="top">Description :</th>
			                            <td><asp:TextBox ID="Department_DescriptionTextBox" runat="server" CssClass="form-textarea" Text='<%# Bind("Department_Description") %>'
                                                TextMode="MultiLine"></asp:TextBox></td>
			                            <td>
                                        </td>
		                            </tr>
	                                <tr>
		                                <th>&nbsp;</th>
		                                <td valign="top">
                                            <asp:Button ID="InsertButton" runat="server" Text="" CssClass="form-submit" 
                                                onclick="InsertButton_Click" />
                                            <asp:Button ID="InsertCancelButton" runat="server" Text="" CssClass="form-reset" CausesValidation="False" CommandName="Cancel"/>
		                                </td>
		                                <td></td>
	                                </tr>
	                            </table>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <%--Department_Name:
                                    <asp:Label ID="Department_NameLabel" runat="server" 
                                        Text='<%# Bind("Department_Name") %>' />
                                    <br />
                                    Department_Description:
                                    <asp:Label ID="Department_DescriptionLabel" runat="server" 
                                        Text='<%# Bind("Department_Description") %>' />
                                    <br />--%>
                                </ItemTemplate>
                            </asp:FormView>
                        
                            
                        
                        </td>
                    </tr>
                    </table>
	                <!-- end id-form  -->
	                    
	                    
	                    
	            </td>
	            <td>
        <asp:Panel ID="pnlPreview" runat="server">
                    
	            <!--  start related-activities -->
	            <div id="related-activities">
            		
		            <!--  start related-act-top -->
		            <div id="related-act-top">
		            <img src="<%=ResolveUrl("~")%>App_Themes/images/forms/header_personal_act.gif" width="271" height="43" alt="" />
		            </div>
		            <!-- end related-act-top -->
            		
		            <!--  start related-act-bottom -->
		            <div id="related-act-bottom">
            		
			            <!--  start related-act-inner -->
			            <div id="related-act-inner">
			                <div style="text-align:center"><asp:ImageButton ID="imgAvatar" runat="server" 
                                    CausesValidation="False" ImageUrl="~/App_Themes/images/other/no_image.png" /></div>
                                    
                            <div class="clear"></div>
	                        <div class="lines-dotted-short"></div>            				
	                        <div class="left"><a href=""><img src="<%=ResolveUrl("~")%>App_Themes/images/forms/icon_plus.gif" width="21" height="21" alt="" /></a></div>
	                        <div class="right">
		                        <h5>Account</h5>
		                        <table style="width: 100%;">
                                    <tr>
                                        <td style="width: 40%;" valign="top">
                                            User name
                                        </td>
                                        <td style="width: 5%;" valign="top"> : </td>
                                        <td valign="top"><asp:Label ID="lblUserName" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            Role
                                        </td>
                                        <td valign="top"> : </td>
                                        <td valign="top"><asp:Label ID="lblRole" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
		                        <ul class="greyarrow"> 
			                        <li>
                                        <asp:HyperLink ID="hplnkModifyAccount" runat="server">Click here modify account</asp:HyperLink></li>
		                        </ul>
	                        </div>
	                        <div class="clear"></div>
				            
			                <div class="clear"></div>
				            <div class="lines-dotted-short"></div>
				            <div class="left"><a href=""><img src="<%=ResolveUrl("~")%>App_Themes/images/forms/icon_plus.gif" width="21" height="21" alt="" /></a></div>
				            <div class="right">
					            <h5>Profile</h5>
                                <table style="width: 100%;">
                                    <tr>
                                        <td style="width: 40%;" valign="top">
                                            First name                               
                                        </td>
                                        <td style="width: 5%;" valign="top"> : </td>
                                        <td><asp:Label ID="lblFirstName" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            Last name                               
                                        </td>
                                        <td valign="top"> : </td>
                                        <td valign="top"><asp:Label ID="lblLastName" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            Gender                               
                                        </td>
                                        <td valign="top"> : </td>
                                        <td><asp:Label ID="lblGender" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            Date of birth
                                        </td>
                                        <td valign="top"> : </td>
                                        <td><asp:Label ID="lblDOB" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            Address
                                        </td>
                                        <td valign="top"> : </td>
                                        <td valign="top">
                                           <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            Phone number
                                        </td>
                                        <td valign="top"> : </td>
                                        <td valign="top"><asp:Label ID="lblPhoneNumber" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            Email
                                        </td>
                                        <td valign="top"> : </td>
                                        <td valign="top"><asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                </table>                
        					    <br />
					            <ul class="greyarrow"> 
						            <li><a href="">Click here modify profile</a> </li>
					            </ul>
				            </div>
            				
				            <div class="clear"></div>
				            <div class="lines-dotted-short"></div>            				
				            <div class="left"><a href=""><img src="<%=ResolveUrl("~")%>App_Themes/images/forms/icon_plus.gif" width="21" height="21" alt="" /></a></div>
				            <div class="right">
					            <h5>Department</h5>
					            <table style="width: 100%;">
                                    <tr>
                                        <td style="width: 40%;" valign="top">
                                            Name
                                        </td>
                                        <td style="width: 5%;" valign="top"> : </td>
                                        <td valign="top"><asp:Label ID="lblDepartmentName" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            Description
                                        </td>
                                        <td valign="top"> : </td>
                                        <td valign="top"><asp:Label ID="lblDescription" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
					            <ul class="greyarrow"> 
						            <li><a href="">Click here modify department</a> </li>
					            </ul>
				            </div>
				            <div class="clear"></div>
            				
			            </div>
			            <!-- end related-act-inner -->
			            <div class="clear"></div>
            		
		            </div>
		            <!-- end related-act-bottom -->
            	
	            </div>
	            <!-- end related-activities -->
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

