<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="<%=ResolveUrl("~")%>App_Themes/css/ui-lightness/jquery-ui-1.8.7.custom.css" rel="stylesheet" type="text/css" />
    <script src="<%=ResolveUrl("~")%>App_Themes/js/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script src="<%=ResolveUrl("~")%>App_Themes/js/jquery-ui-1.8.7.custom.min.js" type="text/javascript"></script>    
	<%--<script type="text/javascript">
	$(function() {
		$( '<%=txtDate.ClientID%>' ).datepicker({
			changeMonth: true,
			changeYear: true,
			yearRange: '1900:2010'
		});
	});
	</script>--%>
	
	</asp:Content>

