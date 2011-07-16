<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateOrder.aspx.cs" Inherits="ServiceEmployee_CreateOrder" Title="Excell-on Consulting Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" Runat="Server">
    <div id="page-heading"><h1>CREATE ORDER</h1></div>
    
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
            	
            	
            	<asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                
	            <table border="0" width="100%" cellpadding="0" cellspacing="0">
	            <tr valign="top">
	            <td>
            	
            	
		            <!--  start step-holder -->
		            <div id="step-holder">
			            <div class="step-no">1</div>
			            <div class="step-dark-left"><a href="<%=ResolveUrl("~")%>ManageService/Order/Create">
                            Create details</a></div>
			            <div class="step-dark-right">&nbsp;</div>
			            <div class="step-no-off">2</div>
			            <div class="step-light-left"><a href="<%=ResolveUrl("~")%>ManageService/Order/Manage">
                            Manage orders</a></div>
			            <div class="step-light-right">&nbsp;</div>
			            <div class="step-no-off">3</div>
			            <div class="step-light-left"><a href="<%=ResolveUrl("~")%>ManageService/Order/Modify">
                            Modify details</a></div>
			            <div class="step-light-right">&nbsp;</div>
			            <div class="step-no-off">4</div>
			            <div class="step-light-left"><a href="<%=ResolveUrl("~")%>ManageService/Order/Trash">
                            Trash</a></div>
			            <div class="step-light-round">&nbsp;</div>
			            <div class="clear"></div>
		            </div>
		            <!--  end step-holder -->
            	
            	
                
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
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
                    <asp:Wizard ID="wizardCreate" runat="server" ActiveStepIndex="0" Width="100%"
                            SkipLinkText="" DisplaySideBar="False" EnableTheming="True" 
                            onactivestepchanged="wizardCreate_ActiveStepChanged" 
                            onnextbuttonclick="wizardCreate_NextButtonClick" 
                            onfinishbuttonclick="wizardCreate_FinishButtonClick">
                        <StartNextButtonStyle CssClass="form-next" />
                        <FinishCompleteButtonStyle CssClass="form-finish" />
                        <StepNextButtonStyle CssClass="form-next" />
                        <FinishPreviousButtonStyle CssClass="form-back" />
                        <WizardSteps>
                            <asp:WizardStep ID="WizardCreateOrder" runat="server" Title="Create order">
                                <table border="0" cellpadding="0" cellspacing="0"  id="id-form">
		                                <tr>
			                                <th valign="top">Company Name :</th>
			                                <td>
                                                <div class="inp-form">
			                                    <asp:DropDownList ID="ddlCompanyName" runat="server" CssClass="styledselect_form">
                                                </asp:DropDownList>
                                                </div>
                                                <br />
                                                <asp:CompareValidator ID="CompareValidator2" runat="server" 
                                                    ControlToValidate="ddlCompanyName" Display="Dynamic" CssClass="content" Font-Size="12px"
                                                    ErrorMessage="You must select a company to create new order." 
                                                    Operator="NotEqual" ValueToCompare="Select company"></asp:CompareValidator>                                
                                            </td>
			                                <td></td>
		                                </tr>
		                                <tr>
			                                <th valign="top">Employee Account :</th>
			                                <td>
                                                <div class="inp-form">
			                                    <asp:DropDownList ID="ddlAccount" runat="server" CssClass="styledselect_form">
                                                </asp:DropDownList>
                                                </div>
                                                <br />
                                                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                                    ControlToValidate="ddlAccount" Display="Dynamic" CssClass="content" Font-Size="12px"
                                                    ErrorMessage="You must select an account of employee to create new order." 
                                                    Operator="NotEqual" ValueToCompare="Select account"></asp:CompareValidator>                                
                                            </td>
			                                <td></td>
		                                </tr>		                            
		                                <tr>
			                                <th valign="top">Payment method :</th>
			                                <td>
                                                <div class="inp-form">
			                                    <asp:DropDownList ID="ddlPaymentMethod" runat="server" CssClass="styledselect_form">
                                                    <asp:ListItem>Cash</asp:ListItem>
                                                    <asp:ListItem>Card</asp:ListItem>
                                                    <asp:ListItem>Online</asp:ListItem>
                                                </asp:DropDownList>
                                                </div>
                                                <br />
                                                <asp:CompareValidator ID="CompareValidator6" runat="server" 
                                                    ControlToValidate="ddlPaymentMethod" Display="Dynamic" CssClass="content" Font-Size="12px"
                                                    ErrorMessage="You must select method to pay for new order." 
                                                    Operator="NotEqual" ValueToCompare="Select method"></asp:CompareValidator>                                
                                            </td>
			                                <td></td>
		                                </tr>
		                                <tr>
		                                    <th valign="top">Bill Date :</th>
		                                <td><asp:TextBox ID="txtBillDate" runat="server" CssClass="inp-form datePicker" 
                                               ></asp:TextBox>
                                               <br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                ControlToValidate="txtBillDate" Display="Dynamic" CssClass="content" Font-Size="12px"
                                                ErrorMessage="Bill date is required."></asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="cvBillDate" runat="server" 
                                                ControlToValidate="txtBillDate" Display="Dynamic" CssClass="content" Font-Size="12px"
                                                ErrorMessage="Your bill date is invalid." Operator="LessThanEqual" 
                                                Type="Date"></asp:CompareValidator></td>
		                                    <td>                                
                                            </td>
		                                </tr>
		                                <tr>
		                                    <th valign="top">Payment Date :</th>
		                                <td><asp:TextBox ID="txtPaymentDate" runat="server" CssClass="inp-form datePicker" 
                                               ></asp:TextBox>
                                               <br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                                ControlToValidate="txtPaymentDate" Display="Dynamic" CssClass="content" Font-Size="12px"
                                                ErrorMessage="Payment date is required."></asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="cvPaymentDate" runat="server" 
                                                ControlToValidate="txtPaymentDate" Display="Dynamic" CssClass="content" Font-Size="12px"
                                                ErrorMessage="Your payment date is greater than or equal bill date." Operator="GreaterThanEqual" 
                                                Type="Date" ControlToCompare="txtBillDate"></asp:CompareValidator></td>
		                                    <td>                                
                                            </td>
		                                </tr>
		                                <tr>
		                                    <th valign="top">Description :</th>
		                                <td><asp:TextBox ID="txtDescription" runat="server" CssClass="form-textarea" 
                                               TextMode="MultiLine"></asp:TextBox>
                                               <br /></td>
		                                    <td>                                
                                            </td>
		                                </tr>
		                                <tr>
			                                <th valign="top">Status :</th>
			                                <td>
                                                <div class="inp-form">
			                                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="styledselect_form">
                                                    <asp:ListItem>Pending</asp:ListItem>
                                                    <asp:ListItem>In Progress</asp:ListItem>
                                                    <asp:ListItem>Resolved</asp:ListItem>
                                                </asp:DropDownList>
                                                </div>
                                                <br />
                                            </td>
			                                <td></td>
		                                </tr>
	                                </table>
                            </asp:WizardStep>
                            <asp:WizardStep ID="WizardSelectServices" runat="server" Title="Select services">
                                <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td valign="top">
                                            <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                            <td valign="top">
                                                <table border="0" cellpadding="0" cellspacing="0" id="id-form">
                                                <tr>
	                                                <th valign="top">Services :</th>
	                                                <td>
                                                        <div class="inp-form">
	                                                    <asp:DropDownList ID="ddlService" runat="server" 
                                                            AutoPostBack="True" CssClass="styledselect_form" 
                                                                OnSelectedIndexChanged="ddlService_SelectedIndexChanged" 
                                                                ValidationGroup="grvService">
                                                        </asp:DropDownList>
                                                        </div>
                                                        <br />
                                                        <asp:CompareValidator ID="CompareValidator3" runat="server" 
                                                            ControlToValidate="ddlService" Display="Dynamic" CssClass="content" Font-Size="12px"
                                                            ErrorMessage="You must select  service to create new order." ValidationGroup="grvService"
                                                            Operator="NotEqual" ValueToCompare="Select service"></asp:CompareValidator>                                
                                                    </td>
                                                    <td>
                                                        &nbsp;</td>
                                                </tr>
                                                <tr>
	                                                <th valign="top">From Date :</th>
                                                    <td><asp:TextBox ID="txtFromDate" runat="server" CssClass="inp-form datePicker" ValidationGroup="grvService" 
                                                   ></asp:TextBox>
                                                   <br />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                                                    ValidationGroup="grvService"
                                                    ControlToValidate="txtFromDate" Display="Dynamic" CssClass="content" Font-Size="12px"
                                                    ErrorMessage="From date is required."></asp:RequiredFieldValidator></td>
                                                        <td>
                                                            &nbsp;</td>
                                                </tr>
                                                <tr>
                                                        <th valign="top">To Date :</th>
                                                    <td><asp:TextBox ID="txtToDate" runat="server" CssClass="inp-form datePicker" 
                                                   ></asp:TextBox>
                                                   <br />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                    ValidationGroup="grvService"
                                                    ControlToValidate="txtToDate" Display="Dynamic" CssClass="content" Font-Size="12px"
                                                    ErrorMessage="To date is required."></asp:RequiredFieldValidator>
                                                    <asp:CompareValidator ID="cvToDate" runat="server" ValidationGroup="grvService"
                                                    ControlToValidate="txtToDate" Display="Dynamic" CssClass="content" Font-Size="12px"
                                                    ErrorMessage="Your date is greater than or equal from date." Operator="GreaterThanEqual" 
                                                    Type="Date" ControlToCompare="txtFromDate"></asp:CompareValidator></td>
                                                        <td>
                                                            &nbsp;</td> 
                                                </tr>
                                                <tr>
                                                    <th valign="top">Number Employees:</th>
                                                    <td><asp:TextBox ID="txtNumberEmployee" runat="server" CssClass="inp-form" 
                                                            ValidationGroup="grvService"></asp:TextBox>
                                                    <br />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                                            ValidationGroup="grvService"
                                                            ControlToValidate="txtNumberEmployee" Display="Dynamic" CssClass="content" Font-Size="12px"
                                                            ErrorMessage="Number of employees is required."></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                                        ControlToValidate="txtNumberEmployee" Display="Dynamic" CssClass="content" Font-Size="12px"
                                                         ValidationExpression= "\d+" ValidationGroup="grvService"
                                                         ErrorMessage="Format of input is invalid. A number is required."></asp:RegularExpressionValidator>  
                                                        <asp:CompareValidator ID="CompareValidator4" runat="server" 
                                                            ErrorMessage="Number of employees is invalid." Display="Dynamic" 
                                                            CssClass="content" Font-Size="12px"
                                                            ControlToValidate="txtNumberEmployee" Operator="GreaterThan" Type="Integer" 
                                                            ValueToCompare="0" ValidationGroup="grvService"></asp:CompareValidator>     
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th valign="top">&nbsp;</th>
                                                    <td>
                                                        <asp:Button ID="btnAdd" runat="server" CssClass="form-add" 
                                                            OnClick="btnAdd_Click" ValidationGroup="grvService"/>
                                                        <asp:Button ID="btnRemove" runat="server" CausesValidation="False" 
                                                            Visible="False" OnClick="btnRemove_Click" CssClass="form-remove" />
                                                    <br /></td>
                                                    <td>
                                                    </td>
                                                </tr>
	                                        </table>
	                                        </td>
	                                        </tr>
	                                        <tr>
                                            <td valign="top" align="center">
                                                <asp:GridView ID="grvManage" runat="server" AutoGenerateColumns="False" 
                                                    CssClass="product-table" Width="90%" AllowSorting="True" 
                                                    onsorting="grvManage_Sorting" 
                                                    OnSelectedIndexChanged="grvManage_SelectedIndexChanged">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="&lt;a href&gt;Logo&lt;/a&gt;" 
                                                            SortExpression="Service_Image">
                                                            <AlternatingItemTemplate>
                                                                <asp:ImageButton ID="ImageButton1" ImageUrl='<%# GetURL(Eval("Service_Image")) %>' runat="server" />
                                                            </AlternatingItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:ImageButton ID="ImageButton1" ImageUrl='<%# GetURL(Eval("Service_Image")) %>' runat="server" />
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="table-header-repeat line-left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="&lt;a href&gt;Name&lt;/a&gt;" 
                                                            SortExpression="Service_Name">
                                                            <AlternatingItemTemplate>
                                                                <asp:Label ID="lblName" runat="server" 
                                                                    Text='<%# Eval("Service_Name") %>'></asp:Label>
                                                            </AlternatingItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblName" runat="server" 
                                                                    Text='<%# Eval("Service_Name") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="table-header-repeat line-left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="&lt;a href&gt;From Date&lt;/a&gt;">
                                                            <AlternatingItemTemplate>
                                                                <asp:Label ID="lblFromDate" runat="server" 
                                                                    Text='<%# Eval("OrderOfServiceDetail_FromDate") %>'></asp:Label>
                                                            </AlternatingItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblFromDate" runat="server" 
                                                                    Text='<%# Eval("OrderOfServiceDetail_FromDate") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="table-header-repeat line-left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="&lt;a href&gt;To Date&lt;/a&gt;">
                                                            <AlternatingItemTemplate>
                                                                <asp:Label ID="lblToDate" runat="server" 
                                                                    Text='<%# Eval("OrderOfServiceDetail_ToDate") %>'></asp:Label>
                                                            </AlternatingItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblToDate" runat="server" 
                                                                    Text='<%# Eval("OrderOfServiceDetail_ToDate") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="table-header-repeat line-left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="&lt;a href&gt;Number Employee&lt;/a&gt;">
                                                            <AlternatingItemTemplate>
                                                                <asp:Label ID="lblNumberEmployee" runat="server" 
                                                                    Text='<%# Eval("OrderOfServiceDetail_NumberOfEmployee") %>'></asp:Label>
                                                            </AlternatingItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblNumberEmployee" runat="server" 
                                                                    Text='<%# Eval("OrderOfServiceDetail_NumberOfEmployee") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="table-header-repeat line-left" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="&lt;a href&gt;Price ($)&lt;/a&gt;">
                                                            <AlternatingItemTemplate>
                                                                <asp:Label ID="lblPrice" runat="server" 
                                                                    Text='<%# Eval("OrderOfServiceDetail_Price") %>'></asp:Label>
                                                            </AlternatingItemTemplate>
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblPrice" runat="server" 
                                                                    Text='<%# Eval("OrderOfServiceDetail_Price") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <HeaderStyle CssClass="table-header-repeat line-left" />
                                                        </asp:TemplateField>
                                                        <asp:CommandField ButtonType="Image" 
                                                            HeaderText="&lt;a href&gt;Remove&lt;/a&gt;" 
                                                            SelectImageUrl="~/App_Themes/images/forms/form_remove.gif" 
                                                            ShowSelectButton="True">
                                                            <HeaderStyle CssClass="table-header-repeat line-left" />
                                                        </asp:CommandField>
                                                    </Columns>
                                                    <AlternatingRowStyle CssClass="alternate-row" />
                                                </asp:GridView>
                                            </td>
                                            </tr>
	                                        </table>
                                        </td>
                                        <td valign="top">
                                            <asp:Panel ID="pnlInfo" Visible="False" runat="server">
                    
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
		                                                    <h5>Service</h5>
                                                            <table style="width: 100%;">
                                                                <tr>
                                                                    <td style="width: 40%;" valign="top">
                                                                        Service name                               
                                                                    </td>
                                                                    <td style="width: 5%;" valign="top"> : </td>
                                                                    <td><asp:Label ID="lblServiceName" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td valign="top">
                                                                        Charge                               
                                                                    </td>
                                                                    <td valign="top"> : </td>
                                                                    <td valign="top">$ <asp:Label ID="lblCharge" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>                
				                                            <br />
	                                                    </div>
                                        				
	                                                    <div class="clear"></div>
	                                                    <div class="lines-dotted-short"></div>
	                                                    <div class="left"><a href=""><img src="<%=ResolveUrl("~")%>App_Themes/images/forms/icon_plus.gif" width="21" height="21" alt="" /></a></div>
	                                                    <div class="right">
		                                                    <h5>Description</h5>
                                                            <table style="width: 100%;">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="lblDescription" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>                
				                                            <br />
	                                                    </div>
	                                                    <div class="clear"></div>
                        				                <div class="lines-dotted-short"></div>
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
                                        <td>&nbsp;</td>
                                    </tr>
                                </table>
                            </asp:WizardStep>
                            <asp:WizardStep ID="WizardPreview" runat="server" Title="Preview">
                                 <table border="0" cellpadding="0" cellspacing="0"  id="id-form" width="100%">
                                    <tr>
                                        <td>
	                                    <div >
                                        <div style="margin:0px 100px 0px 100px">
                                            <div style="padding:5px; border:solid 1px #CCC;">
	                                  <div style="background:#ECECEC">
	                                    <table border="0" align="center" cellpadding="2" cellspacing="2">
	                                      <tr>
	                                        <td colspan="5" class="title" align="left" style="padding:10px 0px 10px 10px">
                                                Company<br />
	                                          </td>
                                          </tr>
	                                      <tr>
	                                        <td colspan="5" >
	                                          <hr />
	                                          <br />
               	                              <p class="content" style="font-size:12px">- Infomation of the comapany that you choose.</p></td>
                                          </tr>
	                                      <tr>
	                                        <td align="center" valign="top" rowspan="5" style="width:200px">
                                                <asp:ImageButton ID="imgbtnCompany" runat="server" />
	                                        </td>
	                                          <th class="content" valign="top" align="left">
                                                  Company Name :</th>
	                                        <td align="left">
                                                <asp:Label ID="lblPreviewName" CssClass="content" runat="server"></asp:Label>
	                                            </td>
                                              <td align="left">
                                                  &nbsp;</td>
                                              <td align="left">
                                                  &nbsp;</td>
                                          </tr>
	                                        <tr>
                                                <th class="content" valign="top" align="left">
                                                    Phone Number :</th>
                                                <td align="left">
                                                    <asp:Label ID="lblPreviewPhone" CssClass="content" runat="server"></asp:Label></td>
                                                <td align="left">
                                                    &nbsp;</td>
                                                <td align="left">
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <th class="content" valign="top" align="left">
                                                    Email :</th>
                                                <td align="left">
                                                    <asp:Label ID="lblPreviewEmail" CssClass="content" runat="server"></asp:Label></td>
                                                <td align="left">
                                                    &nbsp;</td>
                                                <td align="left">
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <th class="content" valign="top" align="left">
                                                    Address :</th>
                                                <td align="left">
                                                    <asp:Label ID="lblPreviewAddress" CssClass="content" runat="server"></asp:Label></td>
                                                <td align="left">
                                                    &nbsp;</td>
                                                <td align="left">
                                                    &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <th class="content" valign="top" align="left">
                                                    Description :</th>
                                                <td align="left" colspan="2" rowspan="2" valign="top">
                                                    <asp:Label ID="lblPreviewDescription" CssClass="content" runat="server"></asp:Label></td>
                                                <td align="left">
                                                    &nbsp;</td>
                                            </tr>
	                                      <tr>
	                                        <td align="center" colspan="5" class="content">
                                                <hr />
                                                   </td>
                                          </tr>
                                          
	                                      <tr>
	                                        <td align="center" colspan="5" class="content">
                                                <asp:Button ID="btnChangeCompany" runat="server" CssClass="form-change" 
                                                    Text="Change Company" OnClick="btnChangeCompany_Click" />
                                                   </td>
                                          </tr>
                                          
                                        </table>
                                      </div>
                                      </div>
                                        </div>
                                        </div>
                                      
                                        <br />
                                        
                                        <div >
                                        <div style="margin:0px 100px 0px 100px">
                                            <div style="padding:5px; border:solid 1px #CCC;">
	                                          <div style="background:#ECECEC">
	                                            <table border="0" align="center" cellpadding="2" cellspacing="2">
	                                              <tr>
	                                                <td colspan="5" class="title" align="left" style="padding:10px 0px 10px 10px">
                                                        Employee<br />
	                                                  </td>
                                                  </tr>
	                                              <tr>
	                                                <td colspan="5" >
	                                                  <hr />
	                                                  <br />
               	                                      <p class="content" style="font-size:12px">- Infomation of the employee who makes bill.</p></td>
                                                  </tr>
	                                              <tr>
	                                                <td align="center" valign="top" rowspan="3" style="width:200px">
                                                        <asp:ImageButton ID="imgbtnEmployee" runat="server" />
	                                                </td>
	                                                  <th class="content" valign="top" align="left">
                                                          Employee Name :</th>
	                                                <td align="left">
                                                        <asp:Label ID="lblPreviewEmployeeName" CssClass="content" runat="server"></asp:Label>
	                                                    </td>
                                                      <td align="left">
                                                          &nbsp;</td>
                                                      <td align="left">
                                                          &nbsp;</td>
                                                  </tr>
	                                                <tr>
                                                        <th class="content" valign="top" align="left">
                                                            Account :</th>
                                                        <td align="left">
                                                            <asp:Label ID="lblPreviewAccount" CssClass="content" runat="server"></asp:Label></td>
                                                        <td align="left">
                                                            &nbsp;</td>
                                                        <td align="left">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <th class="content" valign="top" align="left">
                                                            Email :</th>
                                                        <td align="left">
                                                            <asp:Label ID="lblPreviewEmployeeEmail" CssClass="content" runat="server"></asp:Label></td>
                                                        <td align="left">
                                                            &nbsp;</td>
                                                        <td align="left">
                                                            &nbsp;</td>
                                                    </tr>
	                                              <tr>
	                                                <td align="center" colspan="5" class="content">
                                                        <hr />
                                                           </td>
                                                  </tr>
                                                  
	                                              <tr>
	                                                <td align="center" colspan="5" class="content">
                                                        <asp:Button ID="btnChangeEmployee" runat="server" CssClass="form-change" 
                                                            Text="Change Employee" OnClick="btnChangeEmployee_Click" />
                                                           </td>
                                                  </tr>
                                                  
                                                </table>
                                              </div>
                                              </div>
                                                </div>
                                                </div>
                                         <br />
                                        
                                        <div >
                                        <div style="margin:0px 100px 0px 100px">
                                            <div style="padding:5px; border:solid 1px #CCC;">
	                                          <div style="background:#ECECEC">
	                                            <table border="0" align="center" cellpadding="2" cellspacing="2">
	                                              <tr>
	                                                <td colspan="4" class="title" align="left" style="padding:10px 0px 10px 10px">
                                                        Order<br />
	                                                  </td>
                                                  </tr>
	                                              <tr>
	                                                <td colspan="5" >
	                                                  <hr />
	                                                  <br />
               	                                      <p class="content" style="font-size:12px">- Infomation of the order.</p></td>
                                                  </tr>
	                                              <tr>
	                                                <td align="center" valign="top" rowspan="6">
                                                        &nbsp;
	                                                </td>
	                                                 <th class="content" valign="top" align="left">
                                                          Bill Date :</th>
	                                                <td align="left">
                                                        <asp:Label ID="lblBillDate" CssClass="content" runat="server"></asp:Label>
	                                                    </td>
                                                      <td align="left">
                                                          &nbsp;</td>
                                                      <td align="left">
                                                          &nbsp;</td>
                                                  </tr>
	                                                <tr>
                                                        <th class="content" valign="top" align="left">
                                                            Payment Date :</th>
                                                        <td align="left">
                                                            <asp:Label ID="lblPaymentdate" CssClass="content" runat="server"></asp:Label></td>
                                                        <td align="left">
                                                            &nbsp;</td>
                                                        <td align="left">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <th class="content" valign="top" align="left">
                                                            Description :</th>
                                                        <td align="left" colspan="2" rowspan="2" valign="top">
                                                            <asp:Label ID="lblOrderDescription" CssClass="content" runat="server"></asp:Label></td>
                                                        <td align="left">
                                                            &nbsp;</td>
                                                    </tr>
                                                  <tr>
                                                        <th class="content" valign="top" align="left">
                                                            &nbsp;</th>
                                                        <td align="left">
                                                            &nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <th class="content" valign="top" align="left">
                                                        Total Services :</th>
                                                    <td align="left">
                                                        <asp:Label ID="lblTotalService" runat="server" CssClass="content"></asp:Label>
                                                    </td>
                                                    <td align="left">
                                                        &nbsp;</td>
                                                    <td align="left">
                                                        &nbsp;</td>
                                                </tr>
	                                              <tr>
	                                                  <th align="left" class="content" valign="top">
                                                          Total Charges :</th>
	                                                <td align="left">
                                                        <asp:Label ID="lblTotalCharge" runat="server" CssClass="content"></asp:Label>
                                                           </td>
                                                      <td align="left">
                                                          &nbsp;</td>
                                                      <td align="left">
                                                          &nbsp;</td>
                                                  </tr>
	                                              <tr>
	                                                <td align="center" colspan="5" class="content">
                                                        <hr />
                                                           </td>
                                                  </tr>
                                                  
                                                    <tr>
                                                        <td align="center" class="content" colspan="4">
                                                            <asp:Button ID="btnChangeOrder" runat="server" CssClass="form-change" 
                                                                Text="Change Order" OnClick="btnChangeOrder_Click" />
                                                        </td>
                                                    </tr>
                                                  
                                                </table>
                                              </div>
                                              </div>
                                                </div>
                                                </div>
                                         
                                         <br />
                                         
                                      </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <table border="0" cellpadding="0" width="100%" cellspacing="0">
                                            <tr>
                                            <td align="center">
                                            <asp:GridView ID="grvPrevew" runat="server" AutoGenerateColumns="False" 
                                                CssClass="product-table" Width="90%" AllowSorting="True" 
                                                onsorting="grvManage_Sorting">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="&lt;a href&gt;Logo&lt;/a&gt;" 
                                                        SortExpression="Service_Image">
                                                        <AlternatingItemTemplate>
                                                            <asp:ImageButton ID="ImageButton1" ImageUrl='<%# GetURL(Eval("Service_Image")) %>' runat="server" />
                                                        </AlternatingItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:ImageButton ID="ImageButton1" ImageUrl='<%# GetURL(Eval("Service_Image")) %>' runat="server" />
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="&lt;a href&gt;Name&lt;/a&gt;" 
                                                        SortExpression="Service_Name">
                                                        <AlternatingItemTemplate>
                                                            <asp:Label ID="lblName" runat="server" 
                                                                Text='<%# Eval("Service_Name") %>'></asp:Label>
                                                        </AlternatingItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblName" runat="server" 
                                                                Text='<%# Eval("Service_Name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="&lt;a href&gt;From Date&lt;/a&gt;">
                                                        <AlternatingItemTemplate>
                                                            <asp:Label ID="lblFromDate" runat="server" 
                                                                Text='<%# Eval("OrderOfServiceDetail_FromDate") %>'></asp:Label>
                                                        </AlternatingItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblFromDate" runat="server" 
                                                                Text='<%# Eval("OrderOfServiceDetail_FromDate") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="&lt;a href&gt;To Date&lt;/a&gt;">
                                                        <AlternatingItemTemplate>
                                                            <asp:Label ID="lblToDate" runat="server" 
                                                                Text='<%# Eval("OrderOfServiceDetail_ToDate") %>'></asp:Label>
                                                        </AlternatingItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblToDate" runat="server" 
                                                                Text='<%# Eval("OrderOfServiceDetail_ToDate") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="&lt;a href&gt;Number Employee&lt;/a&gt;">
                                                        <AlternatingItemTemplate>
                                                            <asp:Label ID="lblNumberEmployee" runat="server" 
                                                                Text='<%# Eval("OrderOfServiceDetail_NumberOfEmployee") %>'></asp:Label>
                                                        </AlternatingItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblNumberEmployee" runat="server" 
                                                                Text='<%# Eval("OrderOfServiceDetail_NumberOfEmployee") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="&lt;a href&gt;Price ($)&lt;/a&gt;">
                                                        <AlternatingItemTemplate>
                                                            <asp:Label ID="lblPrice" runat="server" 
                                                                Text='<%# Eval("OrderOfServiceDetail_Price") %>'></asp:Label>
                                                        </AlternatingItemTemplate>
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPrice" runat="server" 
                                                                Text='<%# Eval("OrderOfServiceDetail_Price") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                                    </asp:TemplateField>
                                                </Columns>
                                                <AlternatingRowStyle CssClass="alternate-row" />
                                            </asp:GridView>
                                            </td>
                                            </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </asp:WizardStep>
                        </WizardSteps>
                        <StepPreviousButtonStyle CssClass="form-back" />
                    </asp:Wizard>
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
        	        </ContentTemplate>
                </asp:UpdatePanel>
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
    
    </table>
    
</asp:Content>

