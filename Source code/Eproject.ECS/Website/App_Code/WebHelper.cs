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

namespace Eproject.ECS.Bll
{
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

        // C# to convert a string to a byte array.
        public byte[] StrToByteArray(string str)
        {
            System.Text.UTF8Encoding encoding = new System.Text.UTF8Encoding();
            return encoding.GetBytes(str);
        }

        public String ByteArrayToStr(byte[] dBytes)
        {
            System.Text.UTF8Encoding encoding = new System.Text.UTF8Encoding();
            return encoding.GetString(dBytes);
        }
    }
}
