﻿<%@ WebHandler Language="C#" Class="getImageURL" %>

using System;
using System.Drawing;
using System.IO;

public class getImageURL : System.Web.IHttpHandler {

    bool crop;
    
    public void ProcessRequest (System.Web.HttpContext context) {
        try
        {
            String fileName;
            if (context.Request.QueryString["name"] != null)
                fileName = context.Request.QueryString["name"];
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

            String filePath = WebHelper.Instance.GetWebsitePath() + @"Temp\" + fileName;
            String data = "";

            if (File.Exists(filePath))
            {
                StreamReader file = null;
                try
                {
                    file = new StreamReader(filePath);
                    while (!file.EndOfStream)
                    {
                        data += file.ReadToEnd();
                    }
                }
                finally
                {
                    if (file != null)
                    {
                        file.Close();
                        DirectoryInfo di = new DirectoryInfo(WebHelper.Instance.GetWebsitePath() + @"Temp\");
                        foreach (FileInfo item in di.GetFiles())
                        {
                            DateTime timeFile = item.CreationTime;
                            if (timeFile.AddSeconds(10).CompareTo(DateTime.Now) <= 0)
                                item.Delete();
                        }
                    }
                }
            }

            context.Response.ContentType = "image/png";
            System.IO.Stream strm = ShowImage(data, width, height);
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
        catch (Exception ex)
        { 
            
        }
    }

    public System.IO.Stream ShowImage(String data, int width, int height)
    {
        try
        {
            Image image = WebHelper.Instance.Base64ToImage(data);
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
            tempImage.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
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