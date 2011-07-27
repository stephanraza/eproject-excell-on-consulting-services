<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Statistic.aspx.cs" Inherits="Statistic" Title="Excell-on Consulting Services"
    ValidateRequest="false" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

  

    <script type="text/javascript" src="<%=ResolveUrl("~")%>App_Themes/js/jschart/highcharts.js"></script>

    <!-- 1a) Optional: add a theme file -->
    <!--
			<script type="text/javascript" src="../js/themes/gray.js"></script>
		-->
    <!-- 1b) Optional: the exporting module -->

    <script type="text/javascript" src="<%=ResolveUrl("~")%>App_Themes/js/jschart/modules/exporting.js"></script>

    <!-- 2. Add the JavaScript to initialize the chart on document ready -->

    <script type="text/javascript"> 
		
			/**
			 * Visualize an HTML table using Highcharts. The top (horizontal) header 
			 * is used for series names, and the left (vertical) header is used 
			 * for category names. This function is based on jQuery.
			 * @param {Object} table The reference to the HTML table to visualize
			 * @param {Object} options Highcharts options
			 */
			Highcharts.visualize = function(table, options) {
				// the categories
				options.xAxis.categories = [];
				$('.category', table).each( function(i) {
					options.xAxis.categories.push(this.innerHTML);
				});
				
				// the data series
				options.series = [];
				$('tr', table).each( function(i) {
					var tr = this;
					$('th, td', tr).each( function(j) {
						if(j > 0)
							    {
							if (i == 0) { // get the name and init the series
							    
								options.series[j-1] = { 
									name: this.innerHTML,
									data: []
								};
								
							} else { // add values
							    
								    options.series[j-1].data.push(parseFloat(this.innerHTML));
								
							}
						}
					});
				});
				
				var chart = new Highcharts.Chart(options);
			}
				
			// On document ready, call visualize on the datatable.
			$(document).ready(function() {			
				var table = $('.dataTable');
				options = {
					   chart: {
					      renderTo: 'container',
					      defaultSeriesType: 'column'
					   },
					   title: {
					      text: 'Monthly Profit'
					   },
					   xAxis: {
					   },
					   yAxis: {
					      title: {
					         text: 'Profit ($)'
					      }
					   },
					   tooltip: {
					      formatter: function() {
					         return '<b>'+ this.series.name +'</b><br/>'+
					           num2money(this.y);
					      }
					   }
					};
				
			      					
				Highcharts.visualize(table, options);
			});
function num2money(n_value) {

	// validate input

	if (isNaN(Number(n_value)))

		return 'ERROR';



	// save the sign

	var b_negative = Boolean(n_value < 0);

	n_value = Math.abs(n_value);



	// round to 1/100 precision, add ending zeroes if needed

	var s_result = String(Math.round(n_value * 1e2) % 1e2 + '00').substring(0, 2);

	

	// separate all orders

	var b_first = true;

	//var s_subresult;

	while (n_value >= 1) {

		s_subresult = (n_value >= 1e3 ? '00' : '') + Math.floor(n_value % 1e3);

		s_result = s_subresult.slice(-3) + (b_first ? '.' : ',') +  s_result;

		b_first = false;

		n_value = n_value / 1e3;

	}

	// add at least one integer digit

	if (b_first)

		s_result = '0.' +  s_result;

    s_result = s_result.split('.')[0];

	// apply formatting and return

	return b_negative

		? '($' + s_result + ')'

		: '$' + s_result;

}
        $(document).ready(function () {
	        $(".dataTable").hide();
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" runat="Server">
    <div id="page-heading">
        <h1>
            STATISTIC</h1>
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
                                                                ID="hplnkRed" runat="server" CssClass="close-red">Please 
                                    try again.</asp:HyperLink>
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
                                        <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <table border="0" width="100%" cellpadding="0" class="product-table" cellspacing="0">
                                                        <tr>
                                                            <th class="tableTitle">
                                                                <a href="">Right Now</a>
                                                            </th>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                You have
                                                                <asp:HyperLink ID="hplnkNumberOrder" runat="server" />,
                                                                <asp:HyperLink ID="hplnkNumberEmployee" runat="server" />
                                                                and
                                                                <asp:HyperLink ID="hplnkNumberCompany" runat="server" />, this month you made
                                                                <asp:HyperLink ID="hplnkPayment" runat="server" />
                                                                and a total of <strong>
                                                                    <asp:Label ID="lblProfit" runat="server" /></strong> profit
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
                                            <tr>
                                                <td>
                                                    <!-- 3. Add the container -->
                                                    <div id="container" style="width: 800px; height: 400px; margin: 0 auto">
                                                    </div>
                                                    <asp:GridView ID="grvDataTable" CssClass="dataTable" runat="server" AutoGenerateColumns="False">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Month" ItemStyle-CssClass="category">
                                                                <ItemTemplate>
                                                                    <asp:Literal ID="LiteralMonth" runat="server" Text='<%# Eval("Month") %>'></asp:Literal>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Profit" ItemStyle-CssClass="value">
                                                                <ItemTemplate>
                                                                    <asp:Literal ID="LiteralProfit" runat="server" Text='<%# Eval("Profit") %>'></asp:Literal>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td style="width: 50%" valign="top">
                                                                <table border="0" width="100%" cellpadding="0" class="statistic-table" cellspacing="0">
                                                                    <tr>
                                                                        <th class="tableTitle">
                                                                            <asp:LinkButton ID="lnkLP" runat="server" OnClick="lnkLP_Click">Late payments</asp:LinkButton>
                                                                        </th>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:GridView ID="grvLatePayments" runat="server" AutoGenerateColumns="False" CssClass="product-table"
                                                                                Width="100%">
                                                                                <Columns>
                                                                                    <asp:TemplateField HeaderText="&lt;a href&gt;Company&lt;/a&gt;" HeaderStyle-CssClass="table-header-repeat line-left">
                                                                                        <ItemTemplate>
                                                                                            <asp:HyperLink ID="hplnkCompanyLP" runat="server" NavigateUrl='<%# GetCompanyLPUrl(Eval("Company_Id")) %>'
                                                                                                Text='<%# Eval("Company_Name") %>'></asp:HyperLink>
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:HyperLink ID="hplnkCompanyLP" runat="server" NavigateUrl='<%# GetCompanyLPUrl(Eval("Company_Id")) %>'
                                                                                                Text='<%# Eval("Company_Name") %>'></asp:HyperLink>
                                                                                        </AlternatingItemTemplate>
                                                                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="&lt;a href&gt;Payment&lt;/a&gt;">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblPaymenLP" runat="server" Text='<%# Eval("Total_Charge") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:Label ID="lblPaymenLP" runat="server" Text='<%# Eval("Total_Charge") %>'></asp:Label>
                                                                                        </AlternatingItemTemplate>
                                                                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="&lt;a href&gt;Payment Date&lt;/a&gt;">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblPaymenDateLP" runat="server" Text='<%# Eval("OrderOfService_PaymentDate") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:Label ID="lblPaymenDateLP" runat="server" Text='<%# Eval("OrderOfService_PaymentDate") %>'></asp:Label>
                                                                                        </AlternatingItemTemplate>
                                                                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                                <AlternatingRowStyle CssClass="alternate-row" />
                                                                            </asp:GridView>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td>
                                                                &nbsp;&nbsp;&nbsp;
                                                            </td>
                                                            <td style="width: 50%" valign="top">
                                                                <table border="0" width="100%" cellpadding="0" class="statistic-table" cellspacing="0">
                                                                    <tr>
                                                                        <th class="tableTitle">
                                                                            <asp:LinkButton ID="lnkBS" runat="server" OnClick="lnkBS_Click">Best Services</asp:LinkButton>
                                                                        </th>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:GridView ID="grvBestService" runat="server" AutoGenerateColumns="False" CssClass="product-table"
                                                                                Width="100%">
                                                                                <Columns>
                                                                                    <asp:TemplateField HeaderText="&lt;a href&gt;Service Name&lt;/a&gt;" HeaderStyle-CssClass="table-header-repeat line-left">
                                                                                        <ItemTemplate>
                                                                                            <asp:HyperLink ID="hplnkServiceNameBS" runat="server" NavigateUrl='<%# GetServiceBSUrl(Eval("Service_Id")) %>'
                                                                                                Text='<%# Eval("Service_Name") %>'></asp:HyperLink>
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:HyperLink ID="hplnkServiceNameBS" runat="server" NavigateUrl='<%# GetServiceBSUrl(Eval("Service_Id")) %>'
                                                                                                Text='<%# Eval("Service_Name") %>'></asp:HyperLink>
                                                                                        </AlternatingItemTemplate>
                                                                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="&lt;a href&gt;Charge&lt;/a&gt;">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblChargeBS" runat="server" Text='<%# Eval("Service_Charge") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:Label ID="lblChargeBS" runat="server" Text='<%# Eval("Service_Charge") %>'></asp:Label>
                                                                                        </AlternatingItemTemplate>
                                                                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="&lt;a href&gt;Orders&lt;/a&gt;">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblOrderBS" runat="server" Text='<%# Eval("Orders") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:Label ID="lblOrderBS" runat="server" Text='<%# Eval("Orders") %>'></asp:Label>
                                                                                        </AlternatingItemTemplate>
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
                                                            <td style="width: 50%" valign="top">
                                                                <table border="0" width="100%" cellpadding="0" class="statistic-table" cellspacing="0">
                                                                    <tr>
                                                                        <th class="tableTitle">
                                                                            <asp:LinkButton ID="lnkVC" runat="server" OnClick="lnkBS_Click">V.I.P Clients</asp:LinkButton>
                                                                        </th>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:GridView ID="grvVIPClients" runat="server" AutoGenerateColumns="False" CssClass="product-table"
                                                                                Width="100%">
                                                                                <Columns>
                                                                                    <asp:TemplateField HeaderText="&lt;a href&gt;Company&lt;/a&gt;" HeaderStyle-CssClass="table-header-repeat line-left">
                                                                                        <ItemTemplate>
                                                                                            <asp:HyperLink ID="hplnkCompanyVC" runat="server" NavigateUrl='<%# GetCompanyLPUrl(Eval("Company_Id")) %>'
                                                                                                Text='<%# Eval("Company_Name") %>'></asp:HyperLink>
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:HyperLink ID="hplnkCompanyVC" runat="server" NavigateUrl='<%# GetCompanyLPUrl(Eval("Company_Id")) %>'
                                                                                                Text='<%# Eval("Company_Name") %>'></asp:HyperLink>
                                                                                        </AlternatingItemTemplate>
                                                                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="&lt;a href&gt;Payment&lt;/a&gt;">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblPaymenVC" runat="server" Text='<%# Eval("Payment") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:Label ID="lblPaymenVC" runat="server" Text='<%# Eval("Payment") %>'></asp:Label>
                                                                                        </AlternatingItemTemplate>
                                                                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="&lt;a href&gt;Orders&lt;/a&gt;">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblOrdersVC" runat="server" Text='<%# Eval("Orders") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:Label ID="lblOrdersVC" runat="server" Text='<%# Eval("Orders") %>'></asp:Label>
                                                                                        </AlternatingItemTemplate>
                                                                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                                                                    </asp:TemplateField>
                                                                                </Columns>
                                                                                <AlternatingRowStyle CssClass="alternate-row" />
                                                                            </asp:GridView>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td>
                                                                &nbsp;&nbsp;&nbsp;
                                                            </td>
                                                            <td style="width: 50%" valign="top">
                                                                <table border="0" width="100%" cellpadding="0" class="statistic-table" cellspacing="0">
                                                                    <tr>
                                                                        <th class="tableTitle">
                                                                            <a href="">Newest Problems</a>
                                                                        </th>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: center; width: 50%">
                                                                            <asp:GridView ID="grvNewestProblem" runat="server" AutoGenerateColumns="False" CssClass="product-table"
                                                                                Width="100%">
                                                                                <Columns>
                                                                                    <asp:TemplateField HeaderText="&lt;a href&gt;Service Name&lt;/a&gt;" HeaderStyle-CssClass="table-header-repeat line-left">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblServiceNameBS" runat="server" Text='<%# Eval("Service_Name") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:Label ID="lblServiceNameBS" runat="server" Text='<%# Eval("Service_Name") %>'></asp:Label>
                                                                                        </AlternatingItemTemplate>
                                                                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="&lt;a href&gt;Charge&lt;/a&gt;">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblChargeBS" runat="server" Text='<%# Eval("Service_Charge") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:Label ID="lblChargeBS" runat="server" Text='<%# Eval("Service_Charge") %>'></asp:Label>
                                                                                        </AlternatingItemTemplate>
                                                                                        <HeaderStyle CssClass="table-header-repeat line-left" />
                                                                                    </asp:TemplateField>
                                                                                    <asp:TemplateField HeaderText="&lt;a href&gt;Orders&lt;/a&gt;">
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="lblOrdersBS" runat="server" Text='<%# Eval("Orders") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <AlternatingItemTemplate>
                                                                                            <asp:Label ID="lblOrdersBS" runat="server" Text='<%# Eval("Orders") %>'></asp:Label>
                                                                                        </AlternatingItemTemplate>
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
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" style="padding: 10px">
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
    </asp:UpdatePanel>
</asp:Content>
