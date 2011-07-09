<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HRManagerControl.ascx.cs" Inherits="Controls_HRManagerControl" %>

<%@ Register src="~/Controls/Tags/HRManagerTag.ascx" tagname="HRManagerTag" tagprefix="ucHRManagerTag" %>
<% String urlString = Request.Url.ToString();
   if(urlString.Contains("ManageSystem"))
   {%>   
    <ul class="current"> 
    <%}else{%>
    <ul class="select">
    <%
      } %><li><a href="#nogo"><b>Manage System</b><!--[if IE 7]><!--></a><!--<![endif]-->
    <!--[if lte IE 6]><table><tr><td><![endif]-->
    <%if(urlString.Contains("ManageSystem"))
    {%>   
    <div class="select_sub show">
    <%}else{%>
    <div class="select_sub">
    <%
      } %>  
	    <ul class="sub">
		    <ucHRManagerTag:HRManagerTag ID="HRManagerTag" runat="server" />
	    </ul>
    </div>
    <!--[if lte IE 6]></td></tr></table></a><![endif]-->
    </li>
    </ul>