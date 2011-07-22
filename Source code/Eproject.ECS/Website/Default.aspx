<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Excell-on Consulting Services</title>
    <link href="<%=ResolveUrl("~")%>App_Themes/css/ui-lightness/jquery-ui-1.8.7.custom.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="<%=ResolveUrl("~")%>App_Themes/css/screen.css" type="text/css" media="screen" title="default" />
    <!--[if IE]>
    <link rel="stylesheet" media="all" type="text/css" href="css/pro_dropline_ie.css" />
    <![endif]-->
    <script src="<%=ResolveUrl("~")%>App_Themes/js/jquery.min.js" type="text/javascript"></script>
    <script src="<%=ResolveUrl("~")%>App_Themes/js/jquery-ui.min.js" type="text/javascript"></script>
    <script src="<%=ResolveUrl("~")%>App_Themes/js/jquery/custom_jquery.js" type="text/javascript"></script>
</head>
<body id="login-bg">
    <form id="form1" runat="server">
    <!-- Start: login-holder -->
    <div id="login-holder">

	    <!-- start logo -->
	    <div id="logo-login">
		    <a href="Default.aspx"><img src="App_Themes/images/shared/logo.png"  alt="" /></a>
	    </div>
	    <!-- end logo -->
    	
	    <div class="clear"></div>
    	
	    <!--  start loginbox ................................................................................. -->
	    <div id="loginbox">
    	
	    <!--  start login-inner -->
	    <div id="login-inner">
            <asp:Login ID="frmLogin" runat="server" 
                FailureText="Login was not successful. Please try again." 
                onloggedin="frmLogin_LoggedIn">
                <LayoutTemplate>
                    <table border="0" cellpadding="0" class="id-form">
                        <tr>
                        <th>Username</th>
                            <td>
                                <asp:TextBox ID="UserName" runat="server" CssClass="login-inp"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                    ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                    ToolTip="User Name is required." ValidationGroup="frmLogin" CssClass="content"
                                    Display="Dynamic">Enter your user name.</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <th>Password</th>
                            <td>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="login-inp"></asp:TextBox>
                                <br />
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                    ControlToValidate="Password" ErrorMessage="Password is required." 
                                    ToolTip="Password is required." ValidationGroup="frmLogin" CssClass="content"
                                    Display="Dynamic">Enter your password.</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <th></th>
                            <td style="padding-top:5px">
                                <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me" CssClass="checkbox-size"/>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="color:Red;" class="content">
                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <th></th>
                            <td>
                                <asp:Button ID="LoginButton" runat="server" CommandName="Login"
                                    ValidationGroup="frmLogin" CssClass="submit-login"/>
                            </td>
                        </tr>
                    </table>
                    </table>
                </LayoutTemplate>
            </asp:Login>
	    </div>
 	    <!--  end login-inner -->
	    <div class="clear"></div>
	    <a href="" class="forgot-pwd">Forgot Password?</a>
     </div>
     <!--  end loginbox -->
     
	    <!--  start forgotbox ................................................................................... -->
	    <div id="forgotbox">
		    <div id="forgotbox-text">Please send us your email and we'll reset your password.</div>
		    <!--  start forgot-inner -->
		    <div id="forgot-inner">
		    <table border="0" cellpadding="0" cellspacing="0">
		    <tr>
			    <th>Email address:</th>
			    <td><input type="text" value=""   class="login-inp" /></td>
		    </tr>
		    <tr>
			    <th> </th>
			    <td><input type="button" class="submit-login"  /></td>
		    </tr>
		    </table>
		    </div>
		    <!--  end forgot-inner -->
		    <div class="clear"></div>
		    <a href="" class="back-login">Back to login</a>
	    </div>
	    <!--  end forgotbox -->

    </div>
    <!-- End: login-holder -->
    </form>
</body>
</html>
