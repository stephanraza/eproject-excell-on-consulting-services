<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ServiceEmployeeControl.ascx.cs" Inherits="Controls_ServiceEmployeeControl" %>

<%@ Register src="~/Controls/Tags/ServiceEmployeeTag.ascx" tagname="ServiceEmployeeTag" tagprefix="ucServiceEmployeeTag" %>

    <ul class="select"><li><a href="#nogo"><b>Manage Service</b><!--[if IE 7]><!--></a><!--<![endif]-->
    <!--[if lte IE 6]><table><tr><td><![endif]-->
    <div class="select_sub show">
	    <ul class="sub">
		    <ucServiceEmployeeTag:ServiceEmployeeTag ID="ServiceEmployeeTag" runat="server" />
	    </ul>
    </div>
    <!--[if lte IE 6]></td></tr></table></a><![endif]-->
    </li>
    </ul>