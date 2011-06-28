<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Excell-on Consulting Services</title>
    <link rel="stylesheet" href="css/screen.css" type="text/css" media="screen" title="default" />
    <!--  jquery core -->
    <script src="js/jquery/jquery-1.4.1.min.js" type="text/javascript"></script>

    <!-- Custom jquery scripts -->
    <script src="js/jquery/custom_jquery.js" type="text/javascript"></script>

    <!-- MUST BE THE LAST SCRIPT IN <HEAD></HEAD></HEAD> png fix -->
    <script src="js/jquery/jquery.pngFix.pack.js" type="text/javascript"></script>
    <script type="text/javascript">
    $(document).ready(function(){
    $(document).pngFix( );
    });
</script>
</head>
<body id="login-bg">
    <form id="form1" runat="server">
            <!-- Start: login-holder -->
        <div id="login-holder">

	        <!-- start logo -->
	        <div id="logo-login">
		        <a href="index.html"><img src="images/shared/logo.png"  alt="" /></a>
	        </div>
	        <!-- end logo -->
        	
	        <div class="clear"></div>
        	
	        <!--  start loginbox ................................................................................. -->
	        <div id="loginbox">
        	
	        <!--  start login-inner -->
	        <div id="login-inner">
                <asp:Login ID="frmLogin" runat="server" 
                    FailureText="Username or password is incorrect.">
                    <LayoutTemplate>
                            <table border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <th>Username</th>
                                    <td>
                                        <asp:TextBox ID="UserName" runat="server" CssClass="login-inp"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                            ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                            ToolTip="User Name is required." ValidationGroup="Login1" 
                                            Display="Dynamic">Enter your username.</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Password</th>
                                    <td>
                                        <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="login-inp"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                            ControlToValidate="Password" ErrorMessage="Password is required." 
                                            ToolTip="Password is required." ValidationGroup="Login1" Display="Dynamic">
                                        Enter your password.</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <th></th>
                                    <td style="height:24px">
                                        <asp:CheckBox ID="RememberMe" runat="server" CssClass="checkbox-size" 
                                            Text="Remember me"/>
                                    </td>
                                </tr>
                                <tr>
                                    <th></th>
                                    <td>
                                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" 
                                            ValidationGroup="Login1" CssClass="submit-login"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="color:Red;">
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
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
