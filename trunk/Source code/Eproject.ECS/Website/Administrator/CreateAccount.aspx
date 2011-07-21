<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateAccount.aspx.cs" Inherits="Administrator_CreateAccount" Title="Excell-on Consulting Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" language="javascript">
        function ckbDefaultPassword(){
            if(document.<%=Form.ClientID %>.<%=ckbDefaultPassword.ClientID %>.checked)
            {
                document.<%=Form.ClientID %>.<%=txtPassword.ClientID %>.disabled = true;
                document.<%=Form.ClientID %>.<%=txtConfirmPassword.ClientID %>.disabled = true;
                document.<%=Form.ClientID %>.<%=txtPassword.ClientID %>.value = "123456";
                document.<%=Form.ClientID %>.<%=txtConfirmPassword.ClientID %>.value = "123456";
            }
            else
            {
                document.<%=Form.ClientID %>.<%=txtPassword.ClientID %>.disabled = false;
                document.<%=Form.ClientID %>.<%=txtConfirmPassword.ClientID %>.disabled = false;
                document.<%=Form.ClientID %>.<%=txtPassword.ClientID %>.value = "";
                document.<%=Form.ClientID %>.<%=txtConfirmPassword.ClientID %>.value = "";
            }
        }
    </script>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
    <div id="page-heading"><h1>CREATE ACCOUNT</h1></div>

    <table border="0" width="100%" cellpadding="0" cellspacing="0" id="content-table">
    <tr>
	    <th rowspan="3" class="sized"><img src="<%=ResolveUrl("~")%>App_Themes/images/shared/side_shadowleft.jpg" width="20" height="300" alt="" /></th>
	    <th class="topleft"></th>
	    <td id="tbl-border-top">&nbsp;</td>
	    <th class="topright"></th>
	    <th rowspan="3" class="sized"><img src="<%=ResolveUrl("~")%>App_Themes/images/shared/side_shadowright.jpg" width="20" height="300" alt="" /></th>
    </tr>
    <tr>
	    <td id="tbl-border-left"></td>
	    <td>
	    <!--  start content-table-inner -->
	    
	    <asp:UpdatePanel ID="upAjax" runat="server">
            <ContentTemplate> 
	            <div id="content-table-inner">
            	
	            <table border="0" width="100%" cellpadding="0" cellspacing="0">
	            <tr valign="top">
	            <td>
            	
            	
		            <!--  start step-holder -->
		            <div id="step-holder">
			            <div class="step-no">1</div>
			            <div class="step-dark-left"><a href="<%=ResolveUrl("~")%>ManageSystem/Account/Create">
                            Create details</a></div>
			            <div class="step-dark-right">&nbsp;</div>
			            <div class="step-no-off">2</div>
			            <div class="step-light-left"><a href="<%=ResolveUrl("~")%>ManageSystem/Employee/Manage">
                            Manage accounts</a></div>
			            <div class="step-light-right">&nbsp;</div>
			            <div class="step-no-off">3</div>
			            <div class="step-light-left"><a href="<%=ResolveUrl("~")%>ManageSystem/Account/Modify">
                            Modify details</a></div>
			            <div class="step-light-right">&nbsp;</div>
			            <div class="step-no-off">4</div>
			            <div class="step-light-left"><a href="<%=ResolveUrl("~")%>ManageSystem/Account/Trash">
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
					            <td class="yellow-left">You have a new message. <a href="">Go to Inbox.</a></td>
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
                                    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>&nbsp;<asp:HyperLink ID="hplnkRed" runat="server" CssClass="close-red">Please try again.</asp:HyperLink></td>
					            <td class="red-right"><asp:HyperLink ID="hplnkRedClose" runat="server" CssClass="close-red" ImageUrl="~/App_Themes/images/table/icon_close_red.gif"></asp:HyperLink>
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
                                    <asp:Label ID="lblSuccess" runat="server" Text=""></asp:Label>&nbsp;<asp:HyperLink ID="hplnkGreen" runat="server" CssClass="close-green">Add new one.</asp:HyperLink></td>
					            <td class="green-right"><asp:HyperLink ID="hplnkGreenClose" runat="server" CssClass="close-green" ImageUrl="~/App_Themes/images/table/icon_close_green.gif"></asp:HyperLink>
				                </td>
				            </tr>
				            </table>
				            </div>
				        </asp:Panel>
				        <!--  end message-green -->
				        
		            <!-- start id-form -->   
		                    <table border="0" cellpadding="0" cellspacing="0"  id="id-form">
		                    <tr>
			                    <th valign="top">Employee Email :</th>
			                    <td>
                                    <div class="inp-form">
			                        <asp:DropDownList ID="ddlEmployeeEmail" runat="server" 
                                        AutoPostBack="True" CssClass="styledselect_form"
                                        onselectedindexchanged="ddlEmployeeEmail_SelectedIndexChanged">
                                    </asp:DropDownList>
                                    </div>
                                    <br />
                                    <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                        ControlToValidate="ddlEmployeeEmail" Display="Dynamic" CssClass="content" Font-Size="12px"
                                        ErrorMessage="You must select Employee's email to create an account." 
                                        Operator="NotEqual" ValueToCompare="Select email"></asp:CompareValidator>
                                
                                </td>
			                    <td></td>
		                    </tr>
		                    <tr>
			                    <th valign="top">User name:</th>
			                    <td><asp:TextBox ID="txtUserName" runat="server" CssClass="inp-form"></asp:TextBox>
			                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="txtUserName" Display="Dynamic" CssClass="content" Font-Size="12px"
                                        ErrorMessage="User name is required."></asp:RequiredFieldValidator></td>
			                    <td>
                                </td>
		                    </tr>
		                    <tr>
		                        <th valign="top">Using default password :</th>
		                    <td><asp:CheckBox ID="ckbDefaultPassword" runat="server" onclick="ckbDefaultPassword();"/> 
                                &nbsp;&nbsp;( Default password : <asp:Label ID="lblDefaultPassword" runat="server" Text="123456 " ForeColor="Red" Font-Bold="True"></asp:Label> 
                                )</td>
		                    <td></td>
		                    </tr>
		                    <tr>
		                        <th valign="top">Password :</th>
		                    <td><asp:TextBox ID="txtPassword" runat="server" CssClass="inp-form" 
                                    TextMode="Password"></asp:TextBox>
                                    <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="txtPassword" Display="Dynamic" CssClass="content" Font-Size="12px"
                                    ErrorMessage="Password is required."></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                    ControlToValidate="txtPassword" Display="Dynamic" CssClass="content" Font-Size="12px"
                                    ErrorMessage="Password minimum length is 6 characters." 
                                    ValidationExpression="^.{6,}$"></asp:RegularExpressionValidator></td>
		                    <td>
                                </td>
		                    </tr>
		                    <tr>
		                        <th valign="top">Confirm Password :</th>
		                    <td><asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="inp-form" 
                                    TextMode="Password"></asp:TextBox><br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="txtConfirmPassword" Display="Dynamic" CssClass="content" Font-Size="12px"
                                    ErrorMessage="Confirm password is required."></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                    ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" 
                                    Display="Dynamic" CssClass="content" Font-Size="12px" ErrorMessage="Password and confirm password must match."></asp:CompareValidator>
                                </td>
                                    
		                    <td></td>
		                    </tr>
		                    <tr>
		                    <th valign="top">Role :</th>
		                    <td>
		                    <div class="inp-form">
		                    <asp:DropDownList ID="ddlRole" runat="server" CssClass="styledselect_form">
                                </asp:DropDownList></div>
                                <br />
                                <asp:CompareValidator ID="CompareValidator3" runat="server" 
                                    ControlToValidate="ddlRole" Display="Dynamic" CssClass="content" Font-Size="12px"
                                    ErrorMessage="You must select role for new account." Operator="NotEqual" 
                                    ValueToCompare="Select role"></asp:CompareValidator>
                            </td>
		                    <td>
                                
                                </td>
		                    </tr>
	                    <tr>
		                    <th>&nbsp;</th>
		                    <td valign="top">
                                <asp:Button ID="btnSubmit" runat="server" Text="" CssClass="form-submit" 
                                    onclick="btnSubmit_Click"/>
                                <asp:Button ID="btnReset" runat="server" Text="" CssClass="form-reset" onclick="btnReset_Click" 
                                    />
		                    </td>
		                    <td></td>
	                    </tr>
	                    </table>
	                    <!-- end id-form  -->
	            </td>
	            <td>
	            
                    <asp:Panel ID="pnlPreview" Visible="false" runat="server">
                    
	            <!--  start related-activities -->
	            <div id="related-activities">
            		
		            <!--  start related-act-top -->
		            <div id="related-act-top">
		            <img src="<%=ResolveUrl("~")%>App_Themes/images/forms/header_related_act.gif" width="271" height="43" alt="" />
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
						            <li><asp:HyperLink ID="hplnkModifyProfile" runat="server">Click here modify profile</asp:HyperLink></li>
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
						            <li><asp:HyperLink ID="hpnlnkModifyDepartment" runat="server">Click here modify department</asp:HyperLink></li>
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
            <td><img src="<%=ResolveUrl("~")%>App_Themes/images/shared/blank.gif" width="695" height="1" alt="blank" /></td>
            <td></td>
            </tr>
            </table>             
        	        
                <div class="clear"></div>
                </div>
 
                
                
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ddlEmployeeEmail" 
                    EventName="SelectedIndexChanged" />
            </Triggers>
        </asp:UpdatePanel>


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
</asp:Content>

