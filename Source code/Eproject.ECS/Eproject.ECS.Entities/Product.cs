using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Eproject.ECS.Entities
{
    public class Product
    {

        #region Private Member
        private string product_id;
        private string company_id;
        private string category_id;
        private string product_name;
        private string product_price;
        private string product_description;
        private string product_image;
        private DateTime product_manufacture_date;
        private DateTime product_expiry_date;
        private bool Ppoduct_is_delete;
        #endregion

        #region Prooperties
        /// <summary>
        /// 
        /// </summary>
        public string ProductId
        {
            get { return product_id; }
            set { product_id = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string CompanyId
        {
            get { return company_id; }
            set { company_id = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string CategoryId
        {
            get { return category_id; }
            set { category_id = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ProductName
        {
            get { return product_name; }
            set { product_name = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ProductPrice
        {
            get { return product_price; }
            set { product_price = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ProductDescription
        {
            get { return product_description; }
            set { product_description = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public string ProductImage
        {
            get { return product_image; }
            set { product_image = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime ProductManufactureDate
        {
            get { return product_manufacture_date; }
            set { product_manufacture_date = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public DateTime ProductExpiryDate
        {
            get { return product_expiry_date; }
            set { product_expiry_date = value; }
        }
        /// <summary>
        /// 
        /// </summary>
        public bool PpoductIsDelete
        {
            get { return Ppoduct_is_delete; }
            set { Ppoduct_is_delete = value; }
        }

        #endregion

        #region Constructor
        /// <summary>
        /// 
        /// </summary>
        public Product()
        {
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="productId"></param>
        /// <param name="companyId"></param>
        /// <param name="categoryId"></param>
        /// <param name="productName"></param>
        /// <param name="productPrice"></param>
        /// <param name="productDescription"></param>
        /// <param name="productImage"></param>
        /// <param name="productManufactureDate"></param>
        /// <param name="productExpiryDate"></param>
        /// <param name="ppoductIsDelete"></param>
        public Product(string productId, string companyId, string categoryId, string productName, string productPrice, string productDescription, string productImage, DateTime productManufactureDate, DateTime productExpiryDate, bool ppoductIsDelete)
        {
            product_id = productId;
            company_id = companyId;
            category_id = categoryId;
            product_name = productName;
            product_price = productPrice;
            product_description = productDescription;
            product_image = productImage;
            product_manufacture_date = productManufactureDate;
            product_expiry_date = productExpiryDate;
            Ppoduct_is_delete = ppoductIsDelete;
        }

        #endregion

    }
}
