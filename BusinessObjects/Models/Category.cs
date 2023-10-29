using System;
using System.Collections.Generic;

namespace BusinessObjects.Models
{
    public partial class Category
    {
        public int CategoryId { get; set; }
        public string CategoryName { get; set; } = null!;
        public bool Status { get; set; }
        public string? Description { get; set; }
        public int? TagId { get; set; }

        public virtual Tag? Tag { get; set; }
    }
}
