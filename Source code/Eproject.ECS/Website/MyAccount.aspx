<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyAccount.aspx.cs" Inherits="MyAccount" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Excell-on Consulting Services</title>	
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" Runat="Server">

    <div id="page-heading"><h1>MODIFY PERSONAL INFORMATION</h1></div>

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
		            <%--<div id="step-holder">
			            <div class="step-no">1</div>
			            <div class="step-dark-left"><a href="<%=ResolveUrl("~")%>/ManageSystem/Account/Create">
                            Create details</a></div>
			            <div class="step-dark-right">&nbsp;</div>
			            <div class="step-no-off">2</div>
			            <div class="step-light-left"><a href="">Manage employees</a></div>
			            <div class="step-light-right">&nbsp;</div>
			            <div class="step-no-off">3</div>
			            <div class="step-light-left"><a href="">Modify details</a></div>
			            <div class="step-light-right">&nbsp;</div>
			            <div class="step-no-off">4</div>
			            <div class="step-light-left"><a href="">Trash</a></div>
			            <div class="step-light-round">&nbsp;</div>
			            <div class="clear"></div>
		            </div>--%>
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
		            <table border="0" cellpadding="0" cellspacing="0"  id="id-form" width="100%">
	                    <tr>
	                        <td>
		                    <div >
              <div style="margin:0px 100px 0px 100px">
                    
                  <div style="padding:5px; border:solid 1px #CCC;">
	              <div style="background:#ECECEC">
	                <table width="100%" border="0" align="center" cellpadding="2" cellspacing="2">
	                  <tr>
	                    <td colspan="2" class="title" align="left" style="padding:10px 0px 10px 10px">Name<br />
	                      </td>
                      </tr>
	                  <tr>
	                    <td colspan="2" >
	                      <hr />
	                      <br />
               	          <p class="content" style="font-size:12px">- Change your display name.</p></td>
                      </tr>
	                  <tr>
	                    <th width="50%" style="text-align:right" class="content" valign="top">First Name :</th>
	                    <td align="left">
	                        <asp:TextBox ID="txtFirstName" runat="server" ValidationGroup="grpName" 
                                CssClass="inp-form"></asp:TextBox>
                            <br />
                                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" 
                                    ErrorMessage="Enter your first name." CssClass="content" Display="Dynamic" 
                                    Font-Size="12px" ControlToValidate="txtFirstName" 
                                ValidationGroup="grpName"></asp:RequiredFieldValidator>
			                                    </td>
                      </tr>
	                  <tr>
	                    <th align="right" style="text-align:right" class="content" valign="top">Last Name :</th>
	                    <td align="left" valign="top">
	                        <asp:TextBox ID="txtLastName" runat="server" CssClass="inp-form" ValidationGroup="grpName"></asp:TextBox>
                            <br />
                                <asp:RequiredFieldValidator ID="rfvLastName" runat="server" 
                                    ErrorMessage="Enter your last name." CssClass="content" Display="Dynamic" 
                                    Font-Size="12px" ControlToValidate="txtLastName" 
                                ValidationGroup="grpName"></asp:RequiredFieldValidator>
                               </td>
                      </tr>
                      
	                  <tr>
	                    <td align="center" class="content" colspan="2"><hr /></td>
                      </tr>
                      
	                  <tr>
	                    <td align="center" class="content" colspan="2">
                              <asp:Button ID="btnChangeName" runat="server" 
                                  Text="Change Name" CssClass="form-change" 
                                  ValidationGroup="grpName" onclick="btnChangeName_Click" />
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
	                    <td colspan="2" class="title" align="left" style="padding:10px 0px 10px 10px">Contact<br />
	                    </td>
                      </tr>
	                  <tr>
	                    <td colspan="2" >
                            <hr />
                            <br />
               	            <p class="content" style="font-size:12px">- Change your contact address that include: email address, home address, phone number ....</p>
               	            </td>
                      </tr>
	                  <tr>
	                    <th width="50%" align="right" style="text-align:right" class="content" valign="top">Email :</th>
	                    <td align="left" valign="top">
	                        <asp:TextBox ID="txtEmail" runat="server" CssClass="inp-form" ValidationGroup="grpEmail"></asp:TextBox>
                            <br />
                                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                                    ErrorMessage="Enter your email address." CssClass="content" Display="Dynamic" 
                                    Font-Size="12px" ControlToValidate="txtEmail" 
                                ValidationGroup="grpEmail"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                                    CssClass="content" Display="Dynamic" 
                                    ErrorMessage="Contact email address is incorect." Font-Size="12px" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                    ControlToValidate="txtEmail" ValidationGroup="grpEmail"></asp:RegularExpressionValidator>
                        </td>
                      </tr>
                      <tr>
	                    <th width="50%" align="right" style="text-align:right" class="content" valign="top">Address :</th>
	                    <td align="left" valign="top">
	                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-textarea1" TextMode="MultiLine" ValidationGroup="grpEmail"></asp:TextBox>
                      </td>
                      </tr>
                      <tr>
	                    <th width="50%" align="right" style="text-align:right" class="content" valign="top">Phone number :</th>
	                    <td align="left" valign="top">
	                        <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="inp-form" ValidationGroup="grpEmail"></asp:TextBox>
	                        <br />
	                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" Display="Dynamic" 
                                    ControlToValidate="txtPhoneNumber" CssClass="content" Font-Size="12px" ErrorMessage="Phone number is invalid." 
                             ValidationGroup="grpEmail" ValidationExpression="^[0-9]{6,15}"></asp:RegularExpressionValidator>
                      </td>
                      </tr>
	                  <tr>
	                    <td align="center" class="content" colspan="2"><hr /></td>
                      </tr>
	                  <tr>
	                    <td align="center" class="content" colspan="2">
                              <asp:Button ID="btnChangeEmail" runat="server" 
                                  Text="Change Email" CssClass="form-change" ValidationGroup="grpEmail" 
                                  onclick="btnChangeEmail_Click" />
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
	                    <td colspan="2" class="title" align="left" style="padding:10px 0px 10px 10px">Password<br />
	                    </td>
                      </tr>
	                  <tr>
	                    <td colspan="2" >
	                        <hr />
                            <br />
               	            <p class="content" style="font-size:12px">- By changing your password you will be logged off all other computers.</p>
               	            <br />
                            <p class="content" style="font-size:12px">- Do not use the same password that you use for other online accounts.</p>
                            <br />
                            <p class="content" style="font-size:12px">- Your new password must be at least 6 characters in length.</p>
                            <br />
                            <p class="content" style="font-size:12px">- Use a combination of letters, numbers and punctuation.</p>
                            <br />
                            <p class="content" style="font-size:12px">- Passwords are case-sensitive. Remember to check your Caps Lock key.</p>
                        </td>
                      </tr>
	                  <tr>
	                    <th width="50%" align="right" style="text-align:right" class="content" valign="top">Old Password :</th>
	                    <td align="left" valign="top">
	                      &nbsp;<asp:TextBox ID="txtOldPassword" runat="server" CssClass="inp-form" TextMode="Password" 
                                ValidationGroup="grpPassword"></asp:TextBox>
                            <br />
	                    </td>
                      </tr>
                      <tr>
	                    <th width="50%" align="right" style="text-align:right" class="content" valign="top">New Password :</th>
	                    <td align="left" valign="top">
	                      &nbsp;<asp:TextBox ID="txtNewPassword" CssClass="inp-form" runat="server" TextMode="Password" 
                                ValidationGroup="grpPassword"></asp:TextBox>
	                        <br />
                            <asp:CompareValidator ID="cvNewPassword" runat="server" 
                                ControlToCompare="txtOldPassword" ControlToValidate="txtNewPassword" 
                                CssClass="content" Display="Dynamic" 
                                ErrorMessage="Do not use the same password with old password." Font-Size="12px" 
                                Operator="NotEqual"></asp:CompareValidator>
	                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                    CssClass="content" Display="Dynamic" 
                                    ErrorMessage="Password minimum length is 6 characters." Font-Size="12px" 
                                    ValidationExpression="^.{6,}$" ControlToValidate="txtNewPassword" 
                                ValidationGroup="grpPassword"></asp:RegularExpressionValidator>
	                    </td>
                      </tr>
                      <tr>
	                    <th width="50%"  align="right" style="text-align:right" class="content" valign="top">Confirm Password :</th>
	                    <td align="left" valign="top">
	                      &nbsp;<asp:TextBox ID="txtConfirmPassword" CssClass="inp-form" runat="server" TextMode="Password" 
                                ValidationGroup="grpPassword"></asp:TextBox>
	                        <br />
                                <asp:CompareValidator ID="cvConfirmPassword" runat="server" 
                                    ControlToCompare="txtNewPassword" ControlToValidate="txtConfirmPassword" 
                                    CssClass="content" Display="Dynamic" ErrorMessage="Password is not match." 
                                    Font-Size="12px" ValidationGroup="grpPassword"></asp:CompareValidator>
	                    </td>
                      </tr>
                      
	                  <tr>
	                    <td align="center" class="content" colspan="2"><hr /></td>
                      </tr>
                      <tr>
	                    <td  align="center" class="content" colspan="2">
                              <asp:Button ID="btnChangePassword" runat="server" 
                                  Text="Change Password" CssClass="form-change" 
                                  ValidationGroup="grpPassword" onclick="btnChangePassword_Click" />
                          </td>
                      </tr>
                    </table>
                  </div>
              </div>
              <br />
              <div style="padding:5px; border:solid 1px #CCC;">
                    <div style="background:#ECECEC">
                      <table width="100%" border="0" cellpadding="2" cellspacing="2">
                        <tr>
                          <td colspan="2" class="title" align="left" style="padding:10px 0px 10px 10px">Gender<br />
                          </td>
                        </tr>
                        <tr>
                          <td colspan="2" >
                          <hr />
                          <br />
                          <p class="content" style="font-size:12px">- Change your gender.</p></td>
                        </tr>
                        <tr>
                          <th align="right" style="text-align:right" class="content" valign="top" width="50%">Gender :</th>
                          <td align="left" style="padding:0 0 0px 0">
                              <asp:RadioButtonList ID="radGender" runat="server" RepeatDirection="Horizontal">
                                  <asp:ListItem>Male</asp:ListItem>
                                  <asp:ListItem>Female</asp:ListItem>
                              </asp:RadioButtonList>
                          </td>
                        </tr>
                        
	                  <tr>
	                    <td align="center" class="content" colspan="2"><hr /></td>
                      </tr>
                        <tr>
                          <td align="center" class="content" colspan="2">
                              <asp:Button ID="btnChangeGender" runat="server" 
                                  Text="Change Gender" CssClass="form-change"
                                  onclick="btnChangeGender_Click" />
                            </td>
                        </tr>
                      </table>
                    </div>
                  </div>
              <br />
                  <div style="padding:5px; border:solid 1px #CCC;">
                    <div style="background:#ECECEC">
                      <table width="100%" border="0" cellpadding="2" cellspacing="2">
                        <tr>
                          <td colspan="2" class="title" align="left" style="padding:10px 0px 10px 10px">Date of birth<br />
                          </td>
                        </tr>
                        <tr>
                          <td colspan="2" >
                          <hr />
                          <br />
                          <p class="content" style="font-size:12px">- Change your date of birth.</p></td>
                        </tr>
                        <tr>
                          <th align="right" class="content" style="text-align:right" valign="top" width="50%">Date of birth :</th>
                          <td align="left" valign="top">
                            &nbsp;<asp:TextBox ID="txtBirthday" CssClass="inp-form" runat="server" 
                                  ValidationGroup="grpBirthday"></asp:TextBox>
                              <br />
                                <asp:CompareValidator ID="cvBirthday" runat="server" 
                                    ErrorMessage="Your date of birth is invalid." Display="Dynamic" CssClass="content" 
                                    Font-Size="12px" ControlToValidate="txtBirthday" Type="Date" 
                                    Operator="LessThanEqual" ValidationGroup="grpBirthday"></asp:CompareValidator>
                          </td>
                        </tr>
                        
	                  <tr>
	                    <td align="center" class="content" colspan="2"><hr /></td>
                      </tr>
                        <tr>
                          <td align="center" class="content" colspan="2">
                              <asp:Button ID="btnChangeBirthday" runat="server" 
                                  Text="Change Birthday" CssClass="form-change" 
                                  ValidationGroup="grpBirthday" onclick="btnChangeBirthday_Click" />
                            </td>
                        </tr>
                      </table>
                    </div>
                  </div>
                  <br />
                  
                  <div style="padding:5px; border:solid 1px #CCC;">
                    <div style="background:#ECECEC">
                      <table width="100%" border="0" cellpadding="2" cellspacing="2">
                        <tr>
                          <td colspan="2" class="title" align="left" style="padding:10px 0px 10px 10px">Avatar<br />
                          </td>
                        </tr>
                        <tr>
                          <td colspan="2" >
                          <hr />
                          <br />
                          <p class="content" style="font-size:12px">- Change your avatar.</p></td>
                        </tr>
                        <tr>
                          <th align="right" class="content" style="text-align:right" valign="top" width="50%">Avatar :</th>
                          <td align="left" valign="top">
                            &nbsp;<asp:FileUpload ID="fuAvatar" CssClass="file_1" runat="server" />
                              <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                    ControlToValidate="fuAvatar" Display="Dynamic" CssClass="content" 
                                    Font-Size="12px" ValidationGroup="grpAvatar"
                                    ErrorMessage="Your file is not invalid. It only supports image type." 
                                    ValidationExpression="^.+\.(([jJ][pP][eE]?[gG])|([gG][iI][fF])|([pP][nN][gG])|([bB][mM][pP])|([iI][cC][oO]))$"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ErrorMessage="You need browse your file." CssClass="content" Display="Dynamic" 
                                    Font-Size="12px" ControlToValidate="fuAvatar" 
                                ValidationGroup="grpAvatar"></asp:RequiredFieldValidator>    
                                
                          </td>
                        </tr>
                        
	                  <tr>
	                    <td align="center" class="content" colspan="2"><hr /></td>
                      </tr>
                        <tr>
                          <td align="center" class="content" colspan="2">
                              <asp:Button ID="btnChangeAvatar" runat="server" 
                                  Text="Change Avatar" CssClass="form-change" ValidationGroup="grpAvatar" 
                                  onclick="btnChangeAvatar_Click" />
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
	  <script type="text/javascript">
		$("#<%=txtBirthday.ClientID%>" ).datepicker({
			changeMonth: true,
			changeYear: true,
			yearRange: '1960:2011'
		});
	</script>
</asp:Content>

