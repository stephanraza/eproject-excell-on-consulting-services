<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>

<script RunAt="server">

    
    void RegisterRoutes(RouteCollection routes)
    {
        routes.MapPageRoute("Default", "Login", "~/Default.aspx");
        routes.MapPageRoute("MyAccount", "Account", "~/MyAccount.aspx");

        routes.MapPageRoute("CreateAccount", "ManageSystem/Account/Create", "~/Administrator/CreateAccount.aspx");
        routes.MapPageRoute("ManageAccount", "ManageSystem/Account/Manage", "~/Administrator/ManageAccount.aspx");
        routes.MapPageRoute("ModifyAccount", "ManageSystem/Account/Modify/{id}", "~/Administrator/ModifyAccount.aspx",
            new RouteValueDictionary { { "id", "" } });

        routes.MapPageRoute("CreateDepartment", "ManageSystem/Department/Create", "~/HRManager/CreateDepartment.aspx");
        routes.MapPageRoute("ManageDepartment", "ManageSystem/Department/Manage", "~/HRManager/ManageDepartment.aspx");
        routes.MapPageRoute("TrashDepartment", "ManageSystem/Department/Trash", "~/HRManager/TrashDepartment.aspx");

        routes.MapPageRoute("CreateEmployee", "ManageSystem/Employee/Create", "~/HRManager/CreateEmployee.aspx");
        routes.MapPageRoute("ManageEmployee", "ManageSystem/Employee/Manage", "~/HRManager/ManageEmployee.aspx");
        routes.MapPageRoute("TrashEmployee", "ManageSystem/Employee/Trash", "~/HRManager/TrashEmployee.aspx");

        routes.MapPageRoute("CreateService", "ManageService/Service/Create", "~/ServiceManager/CreateService.aspx");
        routes.MapPageRoute("ManageService", "ManageService/Service/Manage", "~/ServiceManager/ManageService.aspx");
        routes.MapPageRoute("TrashService", "ManageService/Service/Trash", "~/ServiceManager/TrashService.aspx");

        routes.MapPageRoute("CreateOrder", "ManageService/Order/Create", "~/ServiceEmployee/CreateOrder.aspx");
        routes.MapPageRoute("ManageOrder", "ManageService/Order/Manage", "~/ServiceEmployee/ManageOrder.aspx");
        routes.MapPageRoute("TrashOrder", "ManageService/Order/Trash", "~/ServiceEmployee/TrashOrder.aspx");        

        routes.MapPageRoute("CreateCustomer", "ManageService/Customer/Create", "~/ServiceEmployee/CreateCustomer.aspx");
        routes.MapPageRoute("ManageCustomer", "ManageService/Customer/Manage", "~/ServiceEmployee/ManageCustomer.aspx");

        routes.MapPageRoute("CreateDealer", "ManageService/Dealer/Create", "~/ServiceEmployee/CreateDealer.aspx");
        routes.MapPageRoute("ManageDealer", "ManageService/Dealer/Manage", "~/ServiceEmployee/ManageDealer.aspx");          

        routes.MapPageRoute("CreateCompany", "ManageService/Company/Create", "~/ServiceEmployee/CreateCompany.aspx");
        routes.MapPageRoute("ManageCompany", "ManageService/Company/Manage/{return}", "~/ServiceEmployee/ManageCompany.aspx",
            new RouteValueDictionary { { "return", "" } });
        routes.MapPageRoute("ModifyCompany", "ManageService/Company/Modify/{id}", "~/ServiceEmployee/ModifyCompany.aspx",
            new RouteValueDictionary { { "id", "" } });
        routes.MapPageRoute("TrashCompany", "ManageService/Company/Trash", "~/ServiceEmployee/TrashCompany.aspx");

        routes.MapPageRoute("CreateProblem", "ManageService/Problem/Create", "~/ServiceEmployee/CreateProblem.aspx");
        routes.MapPageRoute("ManageProblem", "ManageService/Problem/Manage/{return}", "~/ServiceEmployee/ManageProblem.aspx",
            new RouteValueDictionary { { "return", "" } });
        routes.MapPageRoute("ModifyProblem", "ManageService/Problem/Modify/{id}", "~/ServiceEmployee/ModifyProblem.aspx",
            new RouteValueDictionary { { "id", "" } });
        routes.MapPageRoute("TrashProblem", "ManageService/Problem/Trash", "~/ServiceEmployee/TrashProblem.aspx");

        routes.MapPageRoute("CreateProduct", "ManageService/Product/Create", "~/ServiceEmployee/CreateProduct.aspx");
        routes.MapPageRoute("ManageProduct", "ManageService/Product/Manage/{return}", "~/ServiceEmployee/ManageProduct.aspx",
            new RouteValueDictionary { { "return", "" } });
        routes.MapPageRoute("ModifyProduct", "ManageService/Product/Modify/{id}", "~/ServiceEmployee/ModifyProduct.aspx",
            new RouteValueDictionary { { "id", "" } });
        routes.MapPageRoute("TrashProduct", "ManageService/Product/Trash", "~/ServiceEmployee/TrashProduct.aspx");
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

