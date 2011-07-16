<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ServiceManagerControl.ascx.cs" Inherits="Controls_ServiceManagerControl" %>

<%@ Register src="~/Controls/Tags/ServiceEmployeeTag.ascx" tagname="ServiceEmployeeTag" tagprefix="ucServiceEmployeeTag" %>

<% String urlString = Request.Url.ToString();
   if(urlString.Contains("ManageService"))
   {%>   
    <ul class="current"> 
    <%}else{%>
    <ul class="select">
    <%
      } %><li><a href="#nogo"><b>Manage Service</b><!--[if IE 7]><!--></a><!--<![endif]-->
    <!--[if lte IE 6]><table><tr><td><![endif]-->
    <%if (urlString.Contains("ManageService"))
    {%>   
    <div class="select_sub show">
    <%}else{%>
    <div class="select_sub">
    <%
      } %>  
	    <ul class="sub">
		    <ucServiceEmployeeTag:ServiceEmployeeTag ID="ServiceEmployeeTag" runat="server" />
		    <%if(urlString.Contains("/Service/"))
        {%>   
        <li class="sub_show">
        <%}else{%>
        <li>
        <%
          } %><a href="<%=ResolveUrl("~")%>ManageService/Service/Create">Services</a></li>
	    </ul>
    </div>
    <!--[if lte IE 6]></td></tr></table></a><![endif]-->
    </li>
    </ul>