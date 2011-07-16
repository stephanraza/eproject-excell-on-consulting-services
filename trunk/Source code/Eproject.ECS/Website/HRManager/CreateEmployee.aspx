<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateEmployee.aspx.cs" Inherits="HRManager_CreateEmployee" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Excell-on Consulting Services</title>  
	<script type="text/javascript">
	$(function() {
		$( "#<%=txtDOB.ClientID%>" ).datepicker({
			changeMonth: true,
			changeYear: true,
			yearRange: '1960:2011'
		});
	});
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" Runat="Server">

    <div id="page-heading"><h1>CREATE PROFILE</h1></div>

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
			            <div class="step-no">1</div>
			            <div class="step-dark-left"><a href="<%=ResolveUrl("~")%>ManageSystem/Employee/Create">
                            Create details</a></div>
			            <div class="step-dark-right">&nbsp;</div>
			            <div class="step-no-off">2</div>
			            <div class="step-light-left"><a href="<%=ResolveUrl("~")%>ManageSystem/Employee/Manage">
                            Manage employees</a></div>
			            <div class="step-light-right">&nbsp;</div>
			            <div class="step-no-off">3</div>
			            <div class="step-light-left"><a href="<%=ResolveUrl("~")%>ManageSystem/Employee/Modify">
                            Modify details</a></div>
			            <div class="step-light-right">&nbsp;</div>
			            <div class="step-no-off">4</div>
			            <div class="step-light-left"><a href="<%=ResolveUrl("~")%>ManageSystem/Employee/Trash">
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
		                    <table border="0" cellpadding="0" cellspacing="0"  id="id-form">
		                    <tr>
			                    <th valign="top">First Name :</th>
			                    <td>
                                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="inp-form"></asp:TextBox>
                                </td>
			                    <td>&nbsp;</td>
		                    </tr>
		                    <tr>
			                    <th valign="top">Last Name:</th>
			                    <td><asp:TextBox ID="txtLastName" runat="server" CssClass="inp-form"></asp:TextBox></td>
			                    <td>
                                </td>
		                    </tr>
		                    <tr>
		                        <th valign="top">Gender :</th>
		                    <td>
                                <asp:RadioButtonList ID="radListGender" runat="server" 
                                    RepeatDirection="Horizontal">
                                    <asp:ListItem Selected="True">Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
		                    <td></td>
		                    </tr>
		                    <tr>
		                        <th valign="top">Date Of Birth :</th>
		                    <td><asp:TextBox ID="txtDOB" runat="server" CssClass="inp-form" 
                                   ></asp:TextBox>
                                   <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="txtDOB" Display="Dynamic" CssClass="content" Font-Size="12px"
                                    ErrorMessage="Date of birth is required."></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                    ControlToValidate="txtDOB" Display="Dynamic" CssClass="content" Font-Size="12px"
                                    ErrorMessage="Your date of birth is invalid." Operator="LessThanEqual" 
                                    Type="Date"></asp:CompareValidator></td>
		                    <td>
                                
                                </td>
		                    </tr>
		                    <tr>
		                        <th valign="top">Address : </th>
		                        <td valign="top">
		                        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" CssClass="form-textarea"></asp:TextBox></td>
		                    <td></td>
		                    </tr>
		                    <tr>
		                    <th valign="top">Phone Number :</th>
		                    <td>
                                <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="inp-form"></asp:TextBox>
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                CssClass="content" Font-Size="12px"
                                    ControlToValidate="txtPhoneNumber" ErrorMessage="Phone number is invalid." 
                                    ValidationExpression="^[0-9]{6,15}"></asp:RegularExpressionValidator>
                            </td>
		                    <td> </td>
		                    </tr>
		                    <tr>
		                    <th valign="top">Email :</th>
		                    <td>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="inp-form"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="txtEmail" Display="Dynamic" CssClass="content" Font-Size="12px"
                                    ErrorMessage="Email is required."></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                    ErrorMessage="Email is invalid." ControlToValidate="txtEmail" Display="Dynamic" CssClass="content" Font-Size="12px"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                       
                            </td>
		                    <td> </td>
		                    </tr>
		                    <tr>
		                    <th valign="top">Avatar :</th>
		                    <td>
                                <asp:FileUpload ID="fuAvatar" CssClass="file_1" runat="server" />
                                <br />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                    ControlToValidate="fuAvatar" Display="Dynamic" CssClass="content" Font-Size="12px"
                                    ErrorMessage="Your file is not invalid. It only supports image type." 
                                    ValidationExpression="^.+\.(([jJ][pP][eE]?[gG])|([gG][iI][fF])|([pP][nN][gG])|([bB][mM][pP])|([iI][cC][oO]))$"></asp:RegularExpressionValidator>
                                
                            </td>
		                    <td></td>
		                    </tr>
		                    <tr>
			                    <th valign="top">Department:</th>
			                    <td><div class="inp-form">
                                    <asp:DropDownList ID="ddlDepartment" CssClass="styledselect_form" runat="server">
                                    </asp:DropDownList></div>
                                    <br />
                                    <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                        ControlToValidate="ddlDepartment" Display="Dynamic"  CssClass="content" Font-Size="12px"
                                        ErrorMessage="You must select department for new employee." Operator="NotEqual" 
                                        ValueToCompare="Select department"></asp:CompareValidator>
                                </td>
			                    <td>
                                </td>
		                    </tr>
	                    <tr>
		                    <th>&nbsp;</th>
		                    <td valign="top">
                                <asp:Button ID="btnSubmit" runat="server" Text="" CssClass="form-submit" 
                                    onclick="btnSubmit_Click"/>
                                <input id="btnReset" type="button" value="Reset" onclick='reset();' class="form-reset" />
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
		            <img src="<%=ResolveUrl("~")%>App_Themes/images/forms/header_preview_act.gif" width="271" height="43" alt="" />
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
</asp:Content>

