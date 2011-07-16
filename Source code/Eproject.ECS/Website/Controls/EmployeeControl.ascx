<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EmployeeControl.ascx.cs" Inherits="Controls_EmployeeControl" %>

<% String urlString = Request.Url.ToString();
   if(urlString.Contains("ManageWeb"))
   {%>   
    <ul class="current"> 
    <%}else{%>
    <ul class="select">
    <%
      } %><li><a href="#nogo"><b>Manage Web</b><!--[if IE 7]><!--></a><!--<![endif]-->
    <!--[if lte IE 6]><table><tr><td><![endif]-->
    <%if (urlString.Contains("ManageWeb"))
    {%>   
    <div class="select_sub show">
    <%}else{%>
    <div class="select_sub">
    <%
      } %>  
	    <ul class="sub">
		    <%if(urlString.Contains("/New/"))
        {%>   
        <li class="sub_show">
        <%}else{%>
        <li>
        <%
          } %><a href="<%=ResolveUrl("~")%>Manage/New/Create">News</a></li>
		    <%if(urlString.Contains("/Contact/"))
        {%>   
        <li class="sub_show">
        <%}else{%>
        <li>
        <%
          } %><a href="<%=ResolveUrl("~")%>Manage/Contact/Create">Contacts</a></li>
	    </ul>
    </div>
    <!--[if lte IE 6]></td></tr></table></a><![endif]-->
    </li>
    </ul>