<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ServiceManagerControl.ascx.cs" Inherits="Controls_ServiceManagerControl" %>

<%@ Register src="~/Controls/Tags/ServiceEmployeeTag.ascx" tagname="ServiceEmployeeTag" tagprefix="ucServiceEmployeeTag" %>

    <ul class="current"><li><a href="#nogo"><b>Manage Service</b><!--[if IE 7]><!--></a><!--<![endif]-->
    <!--[if lte IE 6]><table><tr><td><![endif]-->
    <div class="select_sub show">
	    <ul class="sub">
		    <ucServiceEmployeeTag:ServiceEmployeeTag ID="ServiceEmployeeTag" runat="server" />
		    <li><a href="#nogo">Services</a></li>
	    </ul>
    </div>
    <!--[if lte IE 6]></td></tr></table></a><![endif]-->
    </li>
    </ul>