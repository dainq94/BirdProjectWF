using System;
using System.Collections.Generic;

namespace BusinessObjects.Models
{
    public partial class RateProduct
    {
        public int RateId { get; set; }
        public double? Rate { get; set; }
        public string? Comment { get; set; }
        public int? CustomerId { get; set; }
        public int? ProductId { get; set; }
        public DateTime? Date { get; set; }
        public bool? DeleteFlag { get; set; }

        public virtual User? Customer { get; set; }
        public virtual Product? Product { get; set; }
    }
}
