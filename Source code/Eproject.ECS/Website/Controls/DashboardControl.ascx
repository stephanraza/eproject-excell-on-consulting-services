<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DashboardControl.ascx.cs" Inherits="Controls_DashboardControl" %>

<% String urlString = Request.Url.ToString();
   if(urlString.Contains("Dashboard"))
   {%>   
    <ul class="current"> 
    <%}else{%>
    <ul class="select">
    <%
      } %><li><a href="#nogo"><b>Dashboard</b><!--[if IE 7]><!--></a><!--<![endif]-->
    <!--[if lte IE 6]><table><tr><td><![endif]-->
    <%if (urlString.Contains("Dashboard"))
    {%>   
    <div class="select_sub show">
    <%}else{%>
    <div class="select_sub">
    <%
      } %>  
	    <ul class="sub">
		    <%if(urlString.Contains("/Statistic"))
        {%>   
        <li class="sub_show">
        <%}else{%>
        <li>
        <%
          } %>  
		    <a href="<%=ResolveUrl("~")%>Dashboard/Statistic">Statistic</a></li>
	    </ul>
    </div>
    <!--[if lte IE 6]></td></tr></table></a><![endif]-->
    </li>
    </ul>