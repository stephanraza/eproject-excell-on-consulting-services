<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AdminControl.ascx.cs" Inherits="Controls_AdminControl" %>

<%@ Register src="~/Controls/Tags/HRManagerTag.ascx" tagname="HRManagerTag" tagprefix="ucHRManagerTag" %>
<%@ Register src="~/Controls/ServiceManagerControl.ascx" tagname="ServiceManagerControl" tagprefix="ucServiceManagerControl" %>
<%@ Register src="~/Controls/EmployeeControl.ascx" tagname="EmployeeControl" tagprefix="ucEmployeeControl" %>
<% String urlString = Request.Url.ToString();
   if(urlString.Contains("ManageSystem"))
   {%>   
    <ul class="current"> 
    <%}else{%>
    <ul class="select">
    <%
      } %>
    <li><a href="#nogo"><b>Manage System</b><!--[if IE 7]><!--></a><!--<![endif]-->
    <!--[if lte IE 6]><table><tr><td><![endif]-->
    <%if(urlString.Contains("ManageSystem"))
    {%>   
    <div class="select_sub show">
    <%}else{%>
    <div class="select_sub">
    <%
      } %>    
	    <ul class="sub">
	    <%if(urlString.Contains("Account"))
        {%>   
        <li class="sub_show">
        <%}else{%>
        <li>
        <%
          } %>  
		    <a href="<%=ResolveUrl("~")%>ManageSystem/Account/Create">Accounts</a></li>
		    <ucHRManagerTag:HRManagerTag ID="HRManagerTag" runat="server" />
    </div>
    <!--[if lte IE 6]></td></tr></table></a><![endif]-->
    </li>
    </ul>
	
    <div class="nav-divider">&nbsp;</div>
	                    
    <ucServiceManagerControl:ServiceManagerControl ID="ServiceManagerControl" runat="server" />
	
    <div class="nav-divider">&nbsp;</div>
	
    <ucEmployeeControl:EmployeeControl ID="EmployeeControl" runat="server" />