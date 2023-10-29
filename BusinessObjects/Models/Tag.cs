using System;
using System.Collections.Generic;

namespace BusinessObjects.Models
{
    public partial class Tag
    {
        public Tag()
        {
            Categories = new HashSet<Category>();
            ProductTags = new HashSet<ProductTag>();
        }

        public int TagId { get; set; }
        public string TagName { get; set; } = null!;
        public bool Status { get; set; }
        public string? Description { get; set; }

        public virtual ICollection<Category> Categories { get; set; }
        public virtual ICollection<ProductTag> ProductTags { get; set; }
    }
}
