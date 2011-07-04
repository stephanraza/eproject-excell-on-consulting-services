<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MenuControl.ascx.cs" Inherits="Controls_MenuControl" %>

<%@ Register src="~/Controls/AdminControl.ascx" tagname="AdminControl" tagprefix="ucAdminControl" %>
<%@ Register src="~/Controls/EmployeeControl.ascx" tagname="EmployeeControl" tagprefix="ucEmployeeControl" %>
<%@ Register src="~/Controls/HRManagerControl.ascx" tagname="HRManagerControl" tagprefix="ucHRManagerControl" %>
<%@ Register src="~/Controls/ServiceEmployeeControl.ascx" tagname="ServiceEmployeeControl" tagprefix="ucServiceEmployeeControl" %>
<%@ Register src="~/Controls/ServiceManagerControl.ascx" tagname="ServiceManagerControl" tagprefix="ucServiceManagerControl" %>


<asp:PlaceHolder ID="plcMenu" runat="server"></asp:PlaceHolder>

