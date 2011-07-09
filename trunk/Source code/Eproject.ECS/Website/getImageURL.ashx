<%@ WebHandler Language="C#" Class="getImageURL" %>

using System;
using System.Drawing;
using System.IO;

public class getImageURL : System.Web.IHttpHandler {

    bool crop;
    
    public void ProcessRequest (System.Web.HttpContext context) {

        String id;
        if (context.Request.QueryString["id"] != null)
            id = Convert.ToInt32(context.Request.QueryString["id"]);
        else
            throw new ArgumentException("No parameter specified");

        int width;
        if (context.Request.QueryString["width"] != null)
            width = Convert.ToInt32(context.Request.QueryString["width"]);
        else
            throw new ArgumentException("No parameter specified");

        int height;
        if (context.Request.QueryString["height"] != null)
            height = Convert.ToInt32(context.Request.QueryString["height"]);
        else
            throw new ArgumentException("No parameter specified");

        crop = true;
        if (context.Request.QueryString["crop"] != null)
            crop = Convert.ToBoolean(context.Request.QueryString["crop"]);
        
        context.Response.ContentType = "image/png";
        System.IO.Stream strm = ShowImage(photoID, width, height);
        strm.Position = 0;
        byte[] buffer = new byte[4096];
        int byteSeq = strm.Read(buffer, 0, 4096);

        while (byteSeq > 0)
        {
            context.Response.OutputStream.Write(buffer, 0, byteSeq);
            byteSeq = strm.Read(buffer, 0, 4096);
        }
        //context.Response.BinaryWrite(buffer);
    }

    public System.IO.Stream ShowImage(int photoID, int width, int height)
    {
        AlbumsStoreDataSet.PhotoRow photoRow = (AlbumsStoreDataSet.PhotoRow)photoTable.Select("photo_ID=" + photoID)[0];
        try
        {
            Image image = Image.FromStream(new MemoryStream(photoRow.photo));
            Image tempImage = ImageHelper.resizeImage(image, new Size(width + 10, image.Height));

            if (tempImage.Height < height)
            {
                tempImage = ImageHelper.resizeImage(image, new Size(image.Width, height+10));
            }

            Rectangle rectangle = new Rectangle();
            rectangle.X = tempImage.Width / 2 - width / 2;
            rectangle.Y = tempImage.Height / 2 - height / 2;
            rectangle.Width = width;
            rectangle.Height = height;

            if (image.Width < width || image.Height < height)
                crop = false;
            if (crop)
                tempImage = ImageHelper.cropImage(tempImage, rectangle);
            
            MemoryStream ms = new MemoryStream();
            tempImage.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
            return ms;
        }
        catch(Exception ex)
        {
            return null;
        }
    }
    
    public bool IsReusable {
        get {
            return false;
        }
    }

}