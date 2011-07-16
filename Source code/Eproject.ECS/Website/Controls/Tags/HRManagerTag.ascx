<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HRManagerTag.ascx.cs" Inherits="Controls_Tags_HRManagerTag" %>
<% String urlString = Request.Url.ToString();
   if(urlString.Contains("/Department/"))
        {%>   
        <li class="sub_show">
        <%}else{%>
        <li>
        <%
          } %><a href="<%=ResolveUrl("~")%>ManageSystem/Department/Create">Departments</a></li>
<%if(urlString.Contains("/Employee/"))
        {%>   
        <li class="sub_show">
        <%}else{%>
        <li>
        <%
          } %><a href="<%=ResolveUrl("~")%>ManageSystem/Employee/Create">Employees</a></li>