// -----------------------------------------------------------------------
// <copyright file="WebHelper.cs">
//   Copyright 2011 - hoangdp_c00473. All rights reserved.
// </copyright>
// -----------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Web;
using System.Drawing;

    /// <summary>
    /// The WebHelper.cs class support some method for controlling the operation of website.
    /// </summary>
    public class WebHelper
    {
        /// <summary>
        /// SingleTon pattern.
        /// </summary>
        private static WebHelper instance;

        public static WebHelper Instance
        {
            get
            {
                if (instance == null)
                    instance = new WebHelper();
                return instance;
            }
        }        
        /// <summary>
        /// Constructor of SecurityHelper class.
        /// </summary>
        private WebHelper()
        {
            
        }

        public String GetJqueryScript(String root, String path)
        {
            String[] url = root.Split('\\');
            String redirect = "";
            foreach (String item in url)
            {
                redirect += item + "\\";
                if (item.Equals("Website"))
                    break;
            }
            String filePath = redirect + path;
            String script = "";
            
            if (File.Exists(filePath))
            {
                StreamReader file = null;
                try
                {
                    file = new StreamReader(filePath);
                    while (!file.EndOfStream)
                    {
                        script += file.ReadLine();
                        script += Environment.NewLine;
                    }
                }
                finally
                {
                    if (file != null)
                        file.Close();
                }
            }

            return script;
        }

        public String GetURL()
        {
            String[] url = HttpContext.Current.Request.Url.AbsoluteUri.Split('/');
            String redirect = "";
            foreach (String item in url)
            {
                redirect += item + "/";
                if (item.Equals("Website"))
                    break;
            }
            return redirect;
        }

        //Image to Base64 String
        public string ImageToBase64(Image image, System.Drawing.Imaging.ImageFormat format)
        {
            using (MemoryStream ms = new MemoryStream())
            {
                // Convert Image to byte[]
                image.Save(ms, format);
                byte[] imageBytes = ms.ToArray();

                // Convert byte[] to Base64 String
                string base64String = Convert.ToBase64String(imageBytes);
                return base64String;
            }
        }

        //Base64 String to Image
        public Image Base64ToImage(string base64String)
        {
            // Convert Base64 String to byte[]
            byte[] imageBytes = Convert.FromBase64String(base64String);
            MemoryStream ms = new MemoryStream(imageBytes, 0,
              imageBytes.Length);

            // Convert byte[] to Image
            ms.Write(imageBytes, 0, imageBytes.Length);
            Image image = Image.FromStream(ms, true);
            return image;
        }

        public String GetImageURL(String data, int width, int height, bool crop)
        {
            try
            {
                String url = "";
                String fileName = "Image";

                System.IO.StreamWriter file = new System.IO.StreamWriter(@"C:\" + fileName);
                file.Write(data);

                file.Close();

                url = String.Format("getImageURL.ashx?name={0}&width={1}&height={2}&crop={3}", fileName, width, height, crop);

                return url;
            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public String GetWebsitePath(String root)
        {
            String[] url = root.Split('\\');
            String redirect = "";
            foreach (String item in url)
            {
                redirect += item + "\\";
                if (item.Equals("Website"))
                    break;
            }
            return redirect;
        }
    }
