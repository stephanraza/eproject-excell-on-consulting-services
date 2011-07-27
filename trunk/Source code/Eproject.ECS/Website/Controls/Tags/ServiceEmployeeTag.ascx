<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ServiceEmployeeTag.ascx.cs" Inherits="Controls_Tags_ServiceEmployeeTag" %>

<% String urlString = Request.Url.ToString();
   if(urlString.Contains("/Company/"))
        {%>   
        <li class="sub_show">
        <%}else{%>
        <li>
        <%
          } %><a href="<%=ResolveUrl("~")%>ManageService/Company/Create">Companies</a></li>
<%if(urlString.Contains("/Customer/"))
        {%>   
        <li class="sub_show">
        <%}else{%>
        <li>
        <%
          } %><a href="<%=ResolveUrl("~")%>ManageService/Customer/Create">Customers</a></li>
<%if(urlString.Contains("/Dealer/"))
        {%>   
        <li class="sub_show">
        <%}else{%>
        <li>
        <%
          } %><a href="<%=ResolveUrl("~")%>ManageService/Dealer/Create">Dealers</a></li>
<%if(urlString.Contains("/Order/"))
        {%>   
        <li class="sub_show">
        <%}else{%>
        <li>
        <%
          } %><a href="<%=ResolveUrl("~")%>ManageService/Order/Create">Orders</a></li>
<%if(urlString.Contains("/Problem/"))
        {%>   
        <li class="sub_show">
        <%}else{%>
        <li>
        <%
          } %><a href="<%=ResolveUrl("~")%>ManageService/Problem/Create">Problems</a></li>
<%if(urlString.Contains("/Product/"))
        {%>   
        <li class="sub_show">
        <%}else{%>
        <li>
        <%
          } %><a href="<%=ResolveUrl("~")%>ManageService/Product/Create">Products</a></li>