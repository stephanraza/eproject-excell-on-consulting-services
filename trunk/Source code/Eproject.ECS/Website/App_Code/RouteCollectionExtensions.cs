using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Web.Routing;
using System.Web.UI;
using System.Web.Compilation;

public static class RouteCollectionExtensions
{
    public static Route MapPageRoute(this RouteCollection route, string routeName, string routeUrl, string physicalFile)
    {
        return MapPageRoute(route, routeName, routeUrl, physicalFile, null, null, null);
    }

    public static Route MapPageRoute(this RouteCollection route, string routeName, string routeUrl, string physicalFile, RouteValueDictionary defaults)
    {
        return MapPageRoute(route, routeName, routeUrl, physicalFile, defaults, null, null);
    }

    public static Route MapPageRoute(this RouteCollection route, string routeName, string routeUrl, string physicalFile, RouteValueDictionary defaults, RouteValueDictionary constraints)
    {
        return MapPageRoute(route, routeName, routeUrl, physicalFile, defaults, constraints, null);
    }

    public static Route MapPageRoute(this RouteCollection route, string routeName, string routeUrl, string physicalFile, RouteValueDictionary defaults, RouteValueDictionary constraints, RouteValueDictionary dataTokens)
    {
        if (routeUrl == null)
        {
            throw new ArgumentNullException("routeUrl");
        }
        Route item = new Route(routeUrl, defaults, constraints, dataTokens, new RouteHandler(physicalFile));
        route.Add(routeName, item);
        return item;
    }
}
 
public class RouteHandler : IRouteHandler
{
    private string _physicalFile;
    public RouteHandler(string physicalFile)
    {
        _physicalFile = physicalFile;
    }
 
    public IHttpHandler GetHttpHandler(RequestContext requestContext)
    {
        HttpContext.Current.Items["RouteData"] = requestContext.RouteData;
        return BuildManager.CreateInstanceFromVirtualPath(_physicalFile, typeof(Page)) as Page;
    }
}
