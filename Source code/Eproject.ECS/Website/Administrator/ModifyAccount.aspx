<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ModifyAccount.aspx.cs" Inherits="Administrator_ModifyAccount" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" Runat="Server">
<div id="page-heading"><h1>MODIFY ACCOUNT INFORMATION</h1></div>

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
	            <div id="content-table-inner">
            	
	            <table border="0" width="100%" cellpadding="0" cellspacing="0">
	            <tr valign="top">
	            <td>
            	
            	
		            <!--  start step-holder -->
		            <div id="step-holder">
			            <div class="step-no-off">1</div>
			            <div class="step-light-left"><a href="<%=ResolveUrl("~")%>ManageSystem/Account/Create">
                            Create details</a></div>
			            <div class="step-light-right">&nbsp;</div>
			            <div class="step-no-off">2</div>
			            <div class="step-light-left"><a href="">Manage accounts</a></div>
			            <div class="step-light-right">&nbsp;</div>
			            <div class="step-no">3</div>
			            <div class="step-dark-left"><a href="<%=ResolveUrl("~")%>ManageSystem/Account/Modify">Modify details</a></div>
			            <div class="step-dark-right">&nbsp;</div>
			            <div class="step-no-off">4</div>
			            <div class="step-light-left"><a href="">Trash</a></div>
			            <div class="step-light-round">&nbsp;</div>
			            <div class="clear"></div>
		            </div>
		            <!--  end step-holder -->
            	
    	        <!--  start message-yellow -->
    	                <asp:Panel ID="pnlYellow" runat="server" Visible="false">
				            <div id="message-yellow">
				            <table border="0" width="100%" cellpadding="0" cellspacing="0">
				            <tr>
					            <td class="yellow-left"><asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>&nbsp;<a href="#" class="close-yellow">Close and continue.</a></td>
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
                                    <asp:Label ID="lblSuccess" runat="server" Text=""></asp:Label>&nbsp;<a href="#" class="close-green" onclick="reset();">Add 
                                    new one.</a></td>
					            <td class="green-right"><asp:HyperLink ID="HyperLink5" runat="server" CssClass="close-green" ImageUrl="~/App_Themes/images/table/icon_close_green.gif"></asp:HyperLink>
				                </td>
				            </tr>
				            </table>
				            </div>
				        </asp:Panel>
				        <!--  end message-green -->
		            <!-- start id-form -->   
		                    <table border="0" cellpadding="0" cellspacing="0"  id="id-form" width="100%">
	                    <tr>
	                        <td>
		                    <div >
              <div style="margin:0px 100px 0px 100px">
                    
                  <div style="padding:5px; border:solid 1px #CCC;">
	              <div style="background:#ECECEC">
	                <table width="100%" border="0" align="center" cellpadding="2" cellspacing="2">
	                  <tr>
	                    <td colspan="2" class="title" align="left" style="padding:10px 0px 10px 10px">Password<br />
	                      </td>
                      </tr>
	                  <tr>
	                    <td colspan="2" >
	                      <hr />
	                      <br />
               	          <p class="content" style="font-size:12px">- Reset password for user.</p></td>
                      </tr>
	                  <tr>
	                    <td align="center" class="content" colspan="2"><hr /></td>
                      </tr>
                      
	                  <tr>
	                    <td align="center" class="content" colspan="2">
                              <asp:Button ID="btnResetPassword" runat="server" 
                                  Text="Reset Password" CssClass="form-reset-center" 
                                  onclick="btnResetPassword_Click"/>
                          </td>
                      </tr>
                    </table>
                  </div>
                  </div>
                  <br />
                  
                  <div style="padding:5px; border:solid 1px #CCC;">
	              <div style="background:#ECECEC">
	                <table width="100%" border="0" align="center" cellpadding="2" cellspacing="2">
	                  <tr>
	                    <td colspan="2" class="title" align="left" style="padding:10px 0px 10px 10px">Role<br />
	                    </td>
                      </tr>
	                  <tr>
	                    <td colspan="2" >
                            <hr />
                            <br />
               	            <p class="content" style="font-size:12px">- Change role for user.</p>
               	            </td>
                      </tr>
	                  <tr>
	                    <th width="50%" align="right" style="text-align:right" class="content" valign="top">Role :</th>
	                    <td align="left" valign="top">
	                        <div class="inp-form">
		                    <asp:DropDownList ID="ddlRole" runat="server" CssClass="styledselect_form">
                                </asp:DropDownList></div>
                                <br />
                            <asp:CompareValidator ID="CompareValidator3" runat="server" 
                                ControlToValidate="ddlRole" Display="Dynamic" CssClass="content" Font-Size="12px"
                                ErrorMessage="You must select role." Operator="NotEqual" ValidationGroup="grvRole"
                                ValueToCompare="Select role"></asp:CompareValidator>
                        </td>
                      </tr>
	                  <tr>
	                    <td align="center" class="content" colspan="2"><hr /></td>
                      </tr>
	                  <tr>
	                    <td align="center" class="content" colspan="2">
                              <asp:Button ID="btnChangeRole" runat="server" ValidationGroup="grvRole"
                                  Text="Change Role" CssClass="form-change" onclick="btnChangeRole_Click" />
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
			                        <li><asp:HyperLink ID="hplnkModifyAccount" runat="server">Click here modify account</asp:HyperLink></li>
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
            <td><img src="<%=ResolveUrl("~")%>App_Themes/images/shared/blank.gif" width="695" height="1" alt="blank" /></td>
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
</asp:Content>

