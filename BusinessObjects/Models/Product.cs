using System;
using System.Collections.Generic;

namespace BusinessObjects.Models
{
    public partial class Product
    {
        public Product()
        {
            InverseParent = new HashSet<Product>();
            OrderDetails = new HashSet<OrderDetail>();
            ProductCollections = new HashSet<ProductCollection>();
            ProductTags = new HashSet<ProductTag>();
            RateProducts = new HashSet<RateProduct>();
        }

        public int ProductId { get; set; }
        public string? Name { get; set; }
        public decimal? Price { get; set; }
        public int? Quantity { get; set; }
        public bool? Status { get; set; }
        public int? ClassType { get; set; }
        public string? ClassValue { get; set; }
        public DateTime? CreateDate { get; set; }
        public int? ParentId { get; set; }
        public int? CategoryId { get; set; }
        public bool? IsParent { get; set; }
        public int? ShopId { get; set; }
        public string? Description { get; set; }
        public bool? DeleteFlag { get; set; }

        public virtual Product? Parent { get; set; }
        public virtual ICollection<Product> InverseParent { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
        public virtual ICollection<ProductCollection> ProductCollections { get; set; }
        public virtual ICollection<ProductTag> ProductTags { get; set; }
        public virtual ICollection<RateProduct> RateProducts { get; set; }
    }
}
