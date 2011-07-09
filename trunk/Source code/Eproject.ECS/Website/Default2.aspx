<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript" language="javascript">
        function process(id){
            document.getElementById(id).style.visibility="hidden";
        }
        
    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="<%=ResolveUrl("~")%>App_Themes/css/screen.css" type="text/css" media="screen" title="default" />
    <!--[if IE]>
    <link rel="stylesheet" media="all" type="text/css" href="css/pro_dropline_ie.css" />
    <![endif]-->

    <!--  jquery core -->
    <script src="<%=ResolveUrl("~")%>App_Themes/js/jquery-1.4.4.min.js" type="text/javascript"></script>
     
    <!--  checkbox styling script -->
    <script src="<%=ResolveUrl("~")%>App_Themes/js/jquery/ui.core.js" type="text/javascript"></script>
    <script src="<%=ResolveUrl("~")%>App_Themes/js/jquery/ui.checkbox.js" type="text/javascript"></script>
    <script src="<%=ResolveUrl("~")%>App_Themes/js/jquery/jquery.bind.js" type="text/javascript"></script>
    <script type="text/javascript">
    $(function(){
	    $('input').checkBox();
	    $('#toggle-all').click(function(){
 	    $('#toggle-all').toggleClass('toggle-checked');
	    $('#mainform input[type=checkbox]').checkBox('toggle');
	    return false;
	    });
    });
    </script>  


    <!--[if !IE 7]-->
    <!--  styled select box script version 1 -->
    <script src="<%=ResolveUrl("~")%>App_Themes/js/jquery/jquery.selectbox-0.5.js" type="text/javascript"></script>
    <script type="text/javascript">
    $(document).ready(function() {
	    $('.styledselect').selectbox({ inputClass: "selectbox_styled" });
    });
    </script>
    <!--[endif]-->


    <!--  styled select box script version 2 --> 
    <script src="<%=ResolveUrl("~")%>App_Themes/js/jquery/jquery.selectbox-0.5_style_2.js" type="text/javascript"></script>
    <script type="text/javascript">
    $(document).ready(function() {
	    $('.styledselect_form_1').selectbox({ inputClass: "styledselect_form_1" });
	    $('.styledselect_form_2').selectbox({ inputClass: "styledselect_form_2" });
    });
    </script>

    <!--  styled select box script version 3 --> 
    <script src="<%=ResolveUrl("~")%>App_Themes/js/jquery/jquery.selectbox-0.5_style_2.js" type="text/javascript"></script>
    <script type="text/javascript">
    $(document).ready(function() {
	    $('.styledselect_pages').selectbox({ inputClass: "styledselect_pages" });
    });
    </script>

    <!--  styled file upload script --> 
    <script src="<%=ResolveUrl("~")%>App_Themes/js/jquery/jquery.filestyle.js" type="text/javascript"></script>
    <script type="text/javascript" charset="utf-8">
    $(function() {
	    $("input.file_1").filestyle({ 
	    image: "images/forms/upload_file.gif",
	    imageheight : 29,
	    imagewidth : 78,
	    width : 300
	    });
    });
    </script>

    <!-- Custom jquery scripts -->
    <script src="<%=ResolveUrl("~")%>App_Themes/js/jquery/custom_jquery.js" type="text/javascript"></script>
     
    <!-- Tooltips -->
    <script src="<%=ResolveUrl("~")%>App_Themes/js/jquery/jquery.tooltip.js" type="text/javascript"></script>
    <script src="<%=ResolveUrl("~")%>App_Themes/js/jquery/jquery.dimensions.js" type="text/javascript"></script>
    <script type="text/javascript">
    $(function() {
	    $('a.info-tooltip ').tooltip({
		    track: true,
		    delay: 0,
		    fixPNG: true, 
		    showURL: false,
		    showBody: " - ",
		    top: -35,
		    left: 5
	    });
    });
    </script> 

    <!--  date picker script -->
    <link rel="stylesheet" href="<%=ResolveUrl("~")%>App_Themes/css/datePicker.css" type="text/css" />
    <script src="<%=ResolveUrl("~")%>App_Themes/js/jquery/date.js" type="text/javascript"></script>
    <script src="<%=ResolveUrl("~")%>App_Themes/js/jquery/jquery.datePicker.js" type="text/javascript"></script>
    <script type="text/javascript" charset="utf-8">
            $(function()
    {

    // initialise the "Select date" link
    $('#date-pick')
	    .datePicker(
		    // associate the link with a date picker
		    {
			    createButton:false,
			    startDate:'01/01/2005',
			    endDate:'31/12/2020'
		    }
	    ).bind(
		    // when the link is clicked display the date picker
		    'click',
		    function()
		    {
			    updateSelects($(this).dpGetSelected()[0]);
			    $(this).dpDisplay();
			    return false;
		    }
	    ).bind(
		    // when a date is selected update the SELECTs
		    'dateSelected',
		    function(e, selectedDate, $td, state)
		    {
			    updateSelects(selectedDate);
		    }
	    ).bind(
		    'dpClosed',
		    function(e, selected)
		    {
			    updateSelects(selected[0]);
		    }
	    );
    	
    var updateSelects = function (selectedDate)
    {
	    var selectedDate = new Date(selectedDate);
	    $('#d option[value=' + selectedDate.getDate() + ']').attr('selected', 'selected');
	    $('#m option[value=' + (selectedDate.getMonth()+1) + ']').attr('selected', 'selected');
	    $('#y option[value=' + (selectedDate.getFullYear()) + ']').attr('selected', 'selected');
    }
    // listen for when the selects are changed and update the picker
    $('#d, #m, #y')
	    .bind(
		    'change',
		    function()
		    {
			    var d = new Date(
						    $('#y').val(),
						    $('#m').val()-1,
						    $('#d').val()
					    );
			    $('#date-pick').dpSetSelected(d.asString());
		    }
	    );

    // default the position of the selects to today
    var today = new Date();
    updateSelects(today.getTime());

    // and update the datePicker to reflect it...
    $('#d').trigger('change');
    });
    </script>
    <!-- MUST BE THE LAST SCRIPT IN <HEAD></HEAD></HEAD> png fix -->
    <script src="<%=ResolveUrl("~")%>App_Themes/js/jquery/jquery.pngFix.pack.js" type="text/javascript"></script>
    <script type="text/javascript">
    $(document).ready(function(){
    $(document).pngFix( );
    });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
    
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Panel ID="panel1" runat="server">
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                <br />
                <br />
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <br />
                <asp:DropDownList ID="ddl" runat="server"
                        onselectedindexchanged="ddl_SelectedIndexChanged" 
                        ontextchanged="ddl_TextChanged" AutoPostBack="True" CssClass="styledselect_form_1"></asp:DropDownList>
                <br />
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Button" />
                </asp:Panel>
                <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                    <ProgressTemplate>
                        <asp:Label ID="Label2" runat="server" AssociatedControlID="Button1" 
                            Text="Processing...">
                            </asp:Label>
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ddl" EventName="SelectedIndexChanged" />
            </Triggers>
            
        </asp:UpdatePanel>
    
    </div>
    </form>
</body>
</html>
