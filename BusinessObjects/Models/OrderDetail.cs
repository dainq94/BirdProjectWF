using System;
using System.Collections.Generic;

namespace BusinessObjects.Models
{
    public partial class OrderDetail
    {
        public int OrderDetailsId { get; set; }
        public int OrderId { get; set; }
        public int ProductId { get; set; }
        public int Quantity { get; set; }
        public decimal? TotalPrice { get; set; }
        public double? Rate { get; set; }
        public string? Comment { get; set; }
        public bool? IsRated { get; set; }

        public virtual Order Order { get; set; } = null!;
        public virtual Product Product { get; set; } = null!;
    }
}
