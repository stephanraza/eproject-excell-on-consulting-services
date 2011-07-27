<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>

<script RunAt="server">

    
    void RegisterRoutes(RouteCollection routes)
    {
        routes.MapPageRoute("Default", "Login", "~/Default.aspx");
        routes.MapPageRoute("MyAccount", "Account", "~/MyAccount.aspx");

        routes.MapPageRoute("CreateAccount", "ManageSystem/Account/Create/{id}", "~/Administrator/CreateAccount.aspx",
            new RouteValueDictionary { { "id", "" } });
        routes.MapPageRoute("ModifyAccount", "ManageSystem/Account/Modify/{id}", "~/Administrator/ModifyAccount.aspx",
            new RouteValueDictionary { { "id", "" } });
        routes.MapPageRoute("DisplayAccount", "ManageSystem/Account/Display/{id}", "~/Administrator/DisplayAccount.aspx",
            new RouteValueDictionary { { "id", "" } });
        routes.MapPageRoute("TrashAccount", "ManageSystem/Account/Trash", "~/Administrator/TrashAccount.aspx");
        routes.MapPageRoute("Statistic", "DashBoard/Statistic", "~/Administrator/Statistic.aspx");
        
        routes.MapPageRoute("CreateDepartment", "ManageSystem/Department/Create", "~/HRManager/CreateDepartment.aspx");
        routes.MapPageRoute("ManageDepartment", "ManageSystem/Department/Manage/{id}", "~/HRManager/ManageDepartment.aspx",
            new RouteValueDictionary { { "id", "" } });
        routes.MapPageRoute("ModifyDepartment", "ManageSystem/Department/Modify/{id}", "~/HRManager/ModifyDepartment.aspx",
            new RouteValueDictionary { { "id", "" } });
        routes.MapPageRoute("DisplayDepartment", "ManageSystem/Department/Display/{id}", "~/HRManager/DisplayDepartment.aspx",
            new RouteValueDictionary { { "id", "" } });
        routes.MapPageRoute("TrashDepartment", "ManageSystem/Department/Trash", "~/HRManager/TrashDepartment.aspx");

        routes.MapPageRoute("CreateEmployee", "ManageSystem/Employee/Create", "~/HRManager/CreateEmployee.aspx");
        routes.MapPageRoute("ManageEmployee", "ManageSystem/Employee/Manage/{id}", "~/HRManager/ManageEmployee.aspx",
            new RouteValueDictionary { { "id", "" }});
        routes.MapPageRoute("ModifyEmployee", "ManageSystem/Employee/Modify/{id}", "~/HRManager/ModifyEmployee.aspx",
            new RouteValueDictionary { { "id", "" } });
        routes.MapPageRoute("DisplayEmployee", "ManageSystem/Employee/Display/{id}", "~/HRManager/DisplayEmployee.aspx",
            new RouteValueDictionary { { "id", "" } });
        routes.MapPageRoute("TrashEmployee", "ManageSystem/Employee/Trash", "~/HRManager/TrashEmployee.aspx");

        routes.MapPageRoute("CreateService", "ManageService/Service/Create", "~/ServiceManager/CreateService.aspx");
        routes.MapPageRoute("ManageService", "ManageService/Service/Manage/{id}", "~/ServiceManager/ManageService.aspx",
            new RouteValueDictionary { { "id", "" } });
        routes.MapPageRoute("ModifyService", "ManageService/Service/Modify/{id}", "~/ServiceManager/ModifyService.aspx",
            new RouteValueDictionary { { "id", "" } });
        routes.MapPageRoute("DisplayService", "ManageService/Service/Display/{id}", "~/ServiceManager/DisplayService.aspx",
            new RouteValueDictionary { { "id", "" } });
        routes.MapPageRoute("TrashService", "ManageService/Service/Trash", "~/ServiceManager/TrashService.aspx");

        routes.MapPageRoute("CreateOrder", "ManageService/Order/Create", "~/ServiceEmployee/CreateOrder.aspx");
        routes.MapPageRoute("ManageOrder", "ManageService/Order/Manage/{id}", "~/ServiceEmployee/ManageOrder.aspx",
            new RouteValueDictionary { { "id", "" } });
        routes.MapPageRoute("ModifyOrder", "ManageService/Order/Modify/{id}", "~/ServiceEmployee/ModifyOrder.aspx",
            new RouteValueDictionary { { "id", "" } });
        routes.MapPageRoute("DisplayOrder", "ManageService/Order/Display/{id}", "~/ServiceEmployee/DisplayOrder.aspx",
            new RouteValueDictionary { { "id", "" } });
        routes.MapPageRoute("TrashOrder", "ManageService/Order/Trash", "~/ServiceEmployee/TrashOrder.aspx");        

        routes.MapPageRoute("CreateCustomer", "ManageService/Customer/Create", "~/ServiceEmployee/CreateCustomer.aspx");
        routes.MapPageRoute("ManageCustomer", "ManageService/Customer/Manage", "~/ServiceEmployee/ManageCustomer.aspx");
        routes.MapPageRoute("ModifyCustomer", "ManageSystem/Customer/Modify", "~/ServiceEmployee/ModifyCustomer.aspx");
        routes.MapPageRoute("TrashCustomer", "ManageService/Customer/Trash", "~/ServiceEmployee/TrashCustomer.aspx");

        routes.MapPageRoute("CreateProduct", "ManageService/Product/Create", "~/ServiceEmployee/CreateProduct.aspx");
        routes.MapPageRoute("ManageProduct", "ManageService/Product/Manage/{return}", "~/ServiceEmployee/ManageProduct.aspx",
            new RouteValueDictionary { { "return", "" } });
        routes.MapPageRoute("ModifyProduct", "ManageService/Product/Modify/{id}", "~/ServiceEmployee/ModifyProduct.aspx",
            new RouteValueDictionary { { "id", "" } });
        routes.MapPageRoute("TrashProduct", "ManageService/Product/Trash", "~/ServiceEmployee/TrashProduct.aspx");

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

        routes.MapPageRoute("CreateDealer", "ManageService/Dealer/Create", "~/ServiceEmployee/CreateDealer.aspx");
        routes.MapPageRoute("ManageDealer", "ManageService/Dealer/Manage/{return}", "~/ServiceEmployee/ManageDealer.aspx",
            new RouteValueDictionary { { "return", "" } });
        routes.MapPageRoute("ModifyDealer", "ManageService/Dealer/Modify/{id}", "~/ServiceEmployee/ModifyDealer.aspx",
            new RouteValueDictionary { { "id", "" } });
        routes.MapPageRoute("TrashDealer", "ManageService/Dealer/Trash", "~/ServiceEmployee/TrashDealer.aspx");
        
        routes.MapPageRoute("CreateNews", "ManageWeb/News/Create", "~/Employee/CreateNews.aspx");
        routes.MapPageRoute("ManageNews", "ManageWeb/News/Manage", "~/Employee/ManageNews.aspx");
        routes.MapPageRoute("ModifyNews", "ManageWeb/News/Modify", "~/Employee/ModifyNews.aspx");
        routes.MapPageRoute("TrashNews", "ManageWeb/News/Trash", "~/Employee/TrashNews.aspx");

        routes.MapPageRoute("CreateContact", "ManageWeb/Contact/Create", "~/Employee/CreateContact.aspx");
        routes.MapPageRoute("ManageContact", "ManageWeb/Contact/Manage", "~/Employee/ManageContact.aspx");
        routes.MapPageRoute("ModifyContact", "ManageWeb/Contact/Modify", "~/Employee/ModifyContact.aspx");
        routes.MapPageRoute("TrashContact", "ManageWeb/Contact/Trash", "~/Employee/TrashContact.aspx");
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

