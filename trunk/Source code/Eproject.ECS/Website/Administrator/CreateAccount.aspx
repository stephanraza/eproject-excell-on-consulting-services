<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateAccount.aspx.cs" Inherits="Administrator_CreateAccount" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Excell-on Consulting Services</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContent" Runat="Server">
    
    <div id="page-heading"><h1>CREATE ACCOUNT</h1></div>

    <table border="0" width="100%" cellpadding="0" cellspacing="0" id="content-table">
    <tr>
	    <th rowspan="3" class="sized"><img src="/Website/App_Themes/images/shared/side_shadowleft.jpg" width="20" height="300" alt="" /></th>
	    <th class="topleft"></th>
	    <td id="tbl-border-top">&nbsp;</td>
	    <th class="topright"></th>
	    <th rowspan="3" class="sized"><img src="/Website/App_Themes/images/shared/side_shadowright.jpg" width="20" height="300" alt="" /></th>
    </tr>
    <tr>
	    <td id="tbl-border-left"></td>
	    <td>
	    <!--  start content-table-inner -->
	    <div id="content-table-inner">
    	
	    <table border="0" width="100%" cellpadding="0" cellspacing="0">
	    <tr valign="top">
	    <td>
    	
    	
		    <!--  start step-holder -->
		    <div id="step-holder">
			    <div class="step-no">1</div>
			    <div class="step-dark-left"><a href="">Create accou</a>nt details</div>
			    <div class="step-dark-right">&nbsp;</div>
			    <div class="step-no-off">2</div>
			    <div class="step-light-left"><a href="">View all accounts</a></div>
			    <div class="step-light-right">&nbsp;</div>
			    <div class="step-no-off">3</div>
			    <div class="step-light-left"><a href="">Trash</a></div>
			    <div class="step-light-round">&nbsp;</div>
			    <div class="clear"></div>
		    </div>
		    <!--  end step-holder -->
    	
		    <!-- start id-form -->
		    <table border="0" cellpadding="0" cellspacing="0"  id="id-form">
		    <tr>
			    <th valign="top">Account Id :</th>
			    <td><asp:Label ID="lblAccId" runat="server" Font-Bold="False" Font-Size="15pt"></asp:Label></td>
			    <td></td>
		    </tr>
		    <tr>
			    <th valign="top">Employee Id :</th>
			    <td><asp:TextBox ID="txtEmployeeId" runat="server" CssClass="inp-form"></asp:TextBox></td>
			    <td></td>
		    </tr>
		    <tr>
			    <th valign="top">User name:</th>
			    <td><asp:TextBox ID="txtUserName" runat="server" CssClass="inp-form"></asp:TextBox></td>
			    <td>
			    <div class="error-left"></div>
			    <div class="error-inner">This field is required.</div>
			    </td>
		    </tr>
		    <tr>
		        <th valign="top">Using default password :</th>
		    <td><asp:CheckBox ID="ckbDefaultPassword" runat="server" /> (Default password: 
                <asp:Label ID="lblDefaultPassword" runat="server" Text=" 123456"></asp:Label>)</td>
		    <td></td>
		    </tr>
		    <tr>
		        <th valign="top">Password :</th>
		    <td><asp:TextBox ID="txtPassword" runat="server" CssClass="inp-form"></asp:TextBox></td>
		    <td></td>
		    </tr>
		    <tr>
		        <th valign="top">Confirm Password :</th>
		    <td><asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="inp-form"></asp:TextBox></td>
		    <td></td>
		    </tr>
		    <tr>
		    <th valign="top">Role :</th>
		    <td><asp:DropDownList ID="ddlRole" runat="server" CssClass="styledselect_form_1">
                </asp:DropDownList>
            </td>
		    <td></td>
		    </tr> 
		    <tr>
			    <th valign="top">Price:</th>
			    <td><input type="text" class="inp-form" /></td>
			    <td></td>
		    </tr>
	    <tr>
		    <th>&nbsp;</th>
		    <td valign="top">
                <asp:Button ID="Button1" runat="server" Text="" CssClass="form-submit"/>
                <asp:Button ID="Button2" runat="server" Text="" CssClass="form-reset"/>
		    </td>
		    <td></td>
	    </tr>
	    </table>
	    <!-- end id-form  -->

	    </td>
	    <td>

	    <!--  start related-activities -->
	    <div id="related-activities">
    		
		    <!--  start related-act-top -->
		    <div id="related-act-top">
		    <img src="/Website/App_Themes/images/forms/header_related_act.gif" width="271" height="43" alt="" />
		    </div>
		    <!-- end related-act-top -->
    		
		    <!--  start related-act-bottom -->
		    <div id="related-act-bottom">
    		
			    <!--  start related-act-inner -->
			    <div id="related-act-inner">
    			
				    <div class="left"><a href=""><img src="/Website/App_Themes/images/forms/icon_plus.gif" width="21" height="21" alt="" /></a></div>
				    <div class="right">
					    <h5>Add another product</h5>
					    Lorem ipsum dolor sit amet consectetur adipisicing elitsed do eiusmod tempor.
					    <ul class="greyarrow">
						    <li><a href="">Click here to visit</a></li> 
						    <li><a href="">Click here to visit</a> </li>
					    </ul>
				    </div>
    				
				    <div class="clear"></div>
				    <div class="lines-dotted-short"></div>
    				
				    <div class="left"><a href=""><img src="/Website/App_Themes/images/forms/icon_minus.gif" width="21" height="21" alt="" /></a></div>
				    <div class="right">
					    <h5>Delete products</h5>
					    Lorem ipsum dolor sit amet consectetur adipisicing elitsed do eiusmod tempor.
					    <ul class="greyarrow">
						    <li><a href="">Click here to visit</a></li> 
						    <li><a href="">Click here to visit</a> </li>
					    </ul>
				    </div>
    				
				    <div class="clear"></div>
				    <div class="lines-dotted-short"></div>
    				
				    <div class="left"><a href=""><img src="/Website/App_Themes/images/forms/icon_edit.gif" width="21" height="21" alt="" /></a></div>
				    <div class="right">
					    <h5>Edit categories</h5>
					    Lorem ipsum dolor sit amet consectetur adipisicing elitsed do eiusmod tempor.
					    <ul class="greyarrow">
						    <li><a href="">Click here to visit</a></li> 
						    <li><a href="">Click here to visit</a> </li>
					    </ul>
				    </div>
				    <div class="clear"></div>
    				
			    </div>
			    <!-- end related-act-inner -->
			    <div class="clear"></div>
    		
		    </div>
		    <!-- end related-act-bottom -->
    	
	    </div>
	    <!-- end related-activities -->

    </td>
    </tr>
    <tr>
    <td><img src="/Website/App_Themes/images/shared/blank.gif" width="695" height="1" alt="blank" /></td>
    <td></td>
    </tr>
    </table>
     
    <div class="clear"></div>
     

    </div>
    <!--  end content-table-inner  -->
    </td>
    <td id="tbl-border-right"></td>
    </tr>
    <tr>
	    <th class="sized bottomleft"></th>
	    <td id="tbl-border-bottom">&nbsp;</td>
	    <th class="sized bottomright"></th>
    </tr>
    </table>
</asp:Content>

