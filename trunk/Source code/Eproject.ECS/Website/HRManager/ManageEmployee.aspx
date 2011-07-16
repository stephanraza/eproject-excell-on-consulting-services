<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ManageEmployee.aspx.cs" Inherits="HRManager_ManageEmployee" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Excell-on Consulting Services</title>
    <!--[if IE]>
    <link rel="stylesheet" media="all" type="text/css" href="css/pro_dropline_ie.css" />
    <![endif]-->
    <style type="text/css">
        .page-far-right
        {
            height: 24px;
        }
    </style>
    <script type="text/javascript">
	$(function() {
		$( "#<%=lblTextBoxId.Text%>" ).datepicker({
			changeMonth: true,
			changeYear: true,
			yearRange: '1960:2011'
		});
	});
	</script>
    <asp:Label ID="lblTextBoxId" Text="" runat="server" Visible="false"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" Runat="Server">
    <div id="page-heading"><h1>MANAGE EMPLOYEE INFORMATION</h1></div>

    <%--<asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>--%>
    
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
			            <div class="step-light-left"><a href="<%=ResolveUrl("~")%>ManageSystem/Employee/Create">
                            Create details</a></div>
			            <div class="step-light-right">&nbsp;</div>
			            <div class="step-no">2</div>
			            <div class="step-dark-left"><a href="<%=ResolveUrl("~")%>ManageSystem/Employee/Manage">
                            Manage employees</a></div>
			            <div class="step-dark-right">&nbsp;</div>
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
                        <%--<asp:UpdateProgress ID="UpdateProgress1" runat="server">
                            <ProgressTemplate>
                                <asp:Label ID="lblLoading" runat="server" CssClass="form-loading" 
                                    AssociatedControlID="txtSearch"></asp:Label> 
                       
                            </ProgressTemplate>
                        </asp:UpdateProgress>--%>
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
                                    <asp:TemplateField HeaderText="&lt;a href&gt;Employee Id&lt;/a&gt;" 
                                        HeaderStyle-CssClass="table-header-check" SortExpression="Employee_Id">
                                       <ItemTemplate>
                                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Employee_Id") %>'></asp:Label>
                                        </ItemTemplate>
                                        <AlternatingItemTemplate>
                                            <asp:Label ID="lblId" runat="server" Text='<%# Eval("Employee_Id") %>'></asp:Label>
                                        </AlternatingItemTemplate>
                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="&lt;a href&gt;First Name&lt;/a&gt;" 
                                        HeaderStyle-CssClass="table-header-repeat line-left" SortExpression="Employee_FirstName">
                                       <ItemTemplate>
                                            <asp:Label ID="lblFName" runat="server" Text='<%# Eval("Employee_FirtName") %>'></asp:Label>
                                        </ItemTemplate>
                                        <AlternatingItemTemplate>
                                            <asp:Label ID="lblFName" runat="server" Text='<%# Eval("Employee_FirtName") %>'></asp:Label>
                                       </AlternatingItemTemplate>
                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="&lt;a href&gt;Last Name&lt;/a&gt;" 
                                        SortExpression="Employee_LastName">
                                        <ItemTemplate>
                                            <asp:Label ID="lblLName" runat="server" Text='<%# Eval("Employee_LastName") %>'></asp:Label>
                                        </ItemTemplate>
                                        <AlternatingItemTemplate>
                                            <asp:Label ID="lblLName" runat="server" Text='<%# Eval("Employee_LastName") %>'></asp:Label>
                                        </AlternatingItemTemplate>
                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="&lt;a href&gt;Gender&lt;/a&gt;" 
                                        SortExpression="Employee_Gender">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="CheckBox1" Enabled="false" Checked='<%# Eval("Employee_Gender") %>' runat="server" />
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:CheckBox ID="CheckBox1" Enabled="false" Checked='<%# Eval("Employee_Gender") %>' runat="server" />
                                        </EditItemTemplate>
                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                    </asp:TemplateField>                                        
                                    <asp:TemplateField HeaderText="&lt;a href&gt;Date Of Birth&lt;/a&gt;" 
                                        SortExpression="Employee_DateOfBirth">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("Employee_DateOfBirth") %>'></asp:Label>
                                        </ItemTemplate>
                                        <AlternatingItemTemplate>
                                            <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("Employee_DateOfBirth") %>'></asp:Label>
                                        </AlternatingItemTemplate>
                                        <HeaderStyle CssClass="table-header-repeat line-left" />    
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="&lt;a href&gt;Address&lt;/a&gt;" 
                                        SortExpression="Employee_Address">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Employee_Address") %>'></asp:Label>
                                        </ItemTemplate>
                                        <AlternatingItemTemplate>
                                            <asp:Label ID="lblAddress" runat="server" Text='<%# Eval("Employee_Address") %>'></asp:Label>
                                        </AlternatingItemTemplate>
                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="&lt;a href&gt;Phone Number&lt;/a&gt;" 
                                        SortExpression="Employee_PhoneNumber">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPhone" runat="server" Text='<%# Eval("Employee_PhoneNumber") %>'></asp:Label>
                                        </ItemTemplate>
                                        <AlternatingItemTemplate>
                                            <asp:Label ID="lblPhone" runat="server" Text='<%# Eval("Employee_PhoneNumber") %>'></asp:Label>
                                        </AlternatingItemTemplate>
                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="&lt;a href&gt;Email&lt;/a&gt;" 
                                        SortExpression="Employee_Email">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Employee_Email") %>'></asp:Label>
                                        </ItemTemplate>
                                        <AlternatingItemTemplate>
                                            <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Employee_Email") %>'></asp:Label>
                                        </AlternatingItemTemplate>
                                        <HeaderStyle CssClass="table-header-repeat line-left" />    
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="&lt;a href&gt;Department Name&lt;/a&gt;" 
                                        SortExpression="Department_Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Department_Name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <AlternatingItemTemplate>
                                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Department_Name") %>'></asp:Label>
                                        </AlternatingItemTemplate>
                                        <HeaderStyle CssClass="table-header-repeat line-left" /> 
                                    </asp:TemplateField>
                                    <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" 
                                        DeleteImageUrl="~/App_Themes/images/table/table_icon_remove.gif" 
                                        HeaderText="&lt;a href&gt;Option&lt;/a&gt;" 
                                        SelectImageUrl="~/App_Themes/images/table/table_icon_edit.gif" 
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
                    <tr>
                        <td colspan="2" style="padding:10px">
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">                        
                            <asp:FormView ID="frmManage" runat="server"
                                DefaultMode="Insert" Width="90%" onmodechanging="frmManage_ModeChanging">
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
	                                    <td colspan="2" class="title" align="left" style="padding:10px 0px 10px 10px">
                                            Employee information<br />
	                                      </td>
                                      </tr>
	                                  <tr>
	                                    <td colspan="2" align="center">
	                                      <hr />
	                                      <br />
                                            <asp:ImageButton ID="imgAvatar" runat="server" />
               	                          </td>
                                      </tr>
	                                  <tr>
	                                    <td align="center" class="content" colspan="2"><hr /></td>
                                      </tr>
	                                  <tr>
	                                      <th align="right" class="content" style="text-align:right" valign="top" 
                                              width="50%">
                                              First Name :</th>
                                          <td align="left">
                                              <asp:TextBox ID="txtFName" runat="server" CssClass="inp-form" 
                                                  Text='<%# Eval("Employee_FirtName") %>'></asp:TextBox>
                                          </td>
	                                  </tr>
	                                  <tr>
                                          <th align="right" class="content" style="text-align:right" valign="top" 
                                              width="50%">
                                              Last Name :</th>
                                          <td align="left" valign="top">
                                              <asp:TextBox ID="txtLName" runat="server" 
                                                  CssClass="inp-form" Text='<%# Eval("Employee_LastName") %>' ></asp:TextBox>
                                          </td>
                                          
                                      </tr>
                                      <tr>
                                          <th align="right" class="content" style="text-align:right" valign="top" 
                                              width="50%">
                                              Gender :</th>
                                          <td align="left" valign="top">
                                              <asp:RadioButtonList ID="radModifyGender" runat="server" RepeatDirection="Horizontal">
                                                  <asp:ListItem>Male</asp:ListItem>
                                                  <asp:ListItem>Female</asp:ListItem>
                                              </asp:RadioButtonList>
                                          </td>                                          
                                      </tr>
                                      <tr>
		                                    <th align="right" class="content" style="text-align:right" valign="top" 
                                              width="50%">Date Of Birth :</th>
		                                    <td><asp:TextBox ID="txtModifyDOB" runat="server" CssClass="inp-form" ></asp:TextBox>
                                               <br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                ControlToValidate="txtModifyDOB" Display="Dynamic" CssClass="content" Font-Size="12px"
                                                ErrorMessage="Date of birth is required."></asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="CompareValidator" runat="server" 
                                                ControlToValidate="txtModifyDOB" Display="Dynamic" CssClass="content" Font-Size="12px"
                                                ErrorMessage="Your date of birth is invalid." Operator="LessThanEqual" 
                                                Type="Date"></asp:CompareValidator></td>
		                                <td>
                                            
                                            </td>
		                                </tr>
		                                <tr>
		                                    <th align="right" class="content" style="text-align:right" valign="top" 
                                              width="50%">Address : </th>
		                                    <td valign="top">
		                                    <asp:TextBox ID="txtModifyAddress" Text='<%# Eval("Employee_Address") %>' runat="server" TextMode="MultiLine" CssClass="form-textarea1"></asp:TextBox></td>
		                                <td></td>
		                                </tr>
		                                <tr>
		                                <th align="right" class="content" style="text-align:right" valign="top" 
                                              width="50%">Phone Number :</th>
		                                <td>
                                            <asp:TextBox ID="txtModifyPhoneNumber" Text='<%# Eval("Employee_PhoneNumber") %>' runat="server" CssClass="inp-form"></asp:TextBox>
                                            <br />
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                            CssClass="content" Font-Size="12px"
                                                ControlToValidate="txtModifyPhoneNumber" ErrorMessage="Phone number is invalid." 
                                                ValidationExpression="^[0-9]{6,15}"></asp:RegularExpressionValidator>
                                        </td>
		                                <td> </td>
		                                </tr>
		                                <tr>
		                                <th align="right" class="content" style="text-align:right" valign="top" 
                                              width="50%">Email :</th>
		                                <td>
                                            <asp:TextBox ID="txtModifyEmail" Text='<%# Eval("Employee_Email") %>' runat="server" CssClass="inp-form"></asp:TextBox>
                                            <br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                ControlToValidate="txtModifyEmail" Display="Dynamic" CssClass="content" Font-Size="12px"
                                                ErrorMessage="Email is required."></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                ErrorMessage="Email is invalid." ControlToValidate="txtModifyEmail" Display="Dynamic" CssClass="content" Font-Size="12px"
                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                                   
                                        </td>
		                                <td> </td>
		                                </tr>
		                                <tr>
		                                <th align="right" class="content" style="text-align:right" valign="top" 
                                              width="50%">Avatar :</th>
		                                <td>
                                            <asp:FileUpload ID="fuModifyAvatar" CssClass="file_1" runat="server" />
                                            <br />
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                                ControlToValidate="fuModifyAvatar" Display="Dynamic" CssClass="content" Font-Size="12px"
                                                ErrorMessage="Your file is not invalid. It only supports image type." 
                                                ValidationExpression="^.+\.(([jJ][pP][eE]?[gG])|([gG][iI][fF])|([pP][nN][gG])|([bB][mM][pP])|([iI][cC][oO]))$"></asp:RegularExpressionValidator>
                                            
                                        </td>
		                                <td></td>
		                                </tr>
		                                <tr>
			                                <th align="right" class="content" style="text-align:right" valign="top" 
                                              width="50%">Department:</th>
			                                <td><div class="inp-form">
                                                <asp:DropDownList ID="ddlModifyDepartment" CssClass="styledselect_form" runat="server">
                                                </asp:DropDownList></div>
                                                <br />
                                                <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                                    ControlToValidate="ddlModifyDepartment" Display="Dynamic"  CssClass="content" Font-Size="12px"
                                                    ErrorMessage="You must select department for new employee." Operator="NotEqual" 
                                                    ValueToCompare="Select department"></asp:CompareValidator>
                                            </td>
			                                <td>
                                            </td>
		                                </tr>
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
                                </InsertItemTemplate>
                                <ItemTemplate>
                                </ItemTemplate>
                            </asp:FormView>
                        
                            
                        
                        </td>
                    </tr>
                    </table>
	                <!-- end id-form  -->
	                    
	                    
	                    
	            </td>
	            <td>
                    
                    
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
    
    
    <%--</ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="txtSearch" EventName="TextChanged" />
        </Triggers>
    </asp:UpdatePanel>--%>
</asp:Content>
