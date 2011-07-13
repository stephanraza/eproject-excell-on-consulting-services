<%@ Application Language="C#" %>
<%@ Import  Namespace="System.Web.Routing" %>

<script runat="server">

    
    void RegisterRoutes(RouteCollection routes)
    {      
        routes.MapPageRoute("Default", "Login", "~/Default.aspx");
        routes.MapPageRoute("MyAccount", "Account", "~/MyAccount.aspx");      
        routes.MapPageRoute("CreateAccount", "ManageSystem/Account/Create", "~/Administrator/CreateAccount.aspx");
        routes.MapPageRoute("ManageAccount", "ManageSystem/Account/Manage", "~/Administrator/ManageAccount.aspx");
        routes.MapPageRoute("ModifyAccount", "ManageSystem/Account/Modify/{id}", "~/Administrator/ModifyAccount.aspx",
            new RouteValueDictionary { { "id", "" }});
        routes.MapPageRoute("CreateDeparment", "ManageSystem/Department/Create", "~/HRManager/CreateDepartment.aspx");
        routes.MapPageRoute("ManageDeparment", "ManageSystem/Department/Manage", "~/HRManager/ManageDepartment.aspx");
        routes.MapPageRoute("CreateEmployee", "ManageSystem/Employee/Create", "~/HRManager/CreateEmployee.aspx");
        routes.MapPageRoute("CreateCompany", "ManageService/Company/Create", "~/ServiceManager/CreateCompany.aspx");
        routes.MapPageRoute("ManageCompany", "ManageService/Company/Manage", "~/ServiceManager/ManageCompany.aspx");
        routes.MapPageRoute("CreateCustomer", "ManageService/Customer/Create", "~/ServiceManager/CreateCustomer.aspx");
        routes.MapPageRoute("ManageCustomer", "ManageService/Customer/Manage", "~/ServiceManager/ManageCustomer.aspx");
        routes.MapPageRoute("CreateDealer", "ManageService/Dealer/Create", "~/ServiceManager/CreateDealer.aspx");
        routes.MapPageRoute("ManageDealer", "ManageService/Dealer/Manage", "~/ServiceManager/ManageDealer.aspx");
        routes.MapPageRoute("CreateProduct", "ManageService/Product/Create", "~/ServiceManager/CreateProduct.aspx");
        routes.MapPageRoute("ManageProduct", "ManageService/Product/Manage", "~/ServiceManager/ManageProduct.aspx");
        routes.MapPageRoute("CreateProblem", "ManageService/Problem/Create", "~/ServiceManager/CreateProblem.aspx");
        routes.MapPageRoute("ManageProblem", "ManageService/Problem/Manage", "~/ServiceManager/ManageProblem.aspx");
    }

    void Application_Start(object sender, EventArgs e)
    {
        RegisterRoutes(RouteTable.Routes);
    }
 
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
