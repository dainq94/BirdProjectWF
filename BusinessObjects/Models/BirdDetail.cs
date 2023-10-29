using System;
using System.Collections.Generic;

namespace BusinessObjects.Models
{
    public partial class BirdDetail
    {
        public int? ProductId { get; set; }
        public DateTime? Dob { get; set; }
        public bool? Gender { get; set; }
        public double? Height { get; set; }
        public double? Weight { get; set; }
        public string? Origin { get; set; }

        public virtual Product? Product { get; set; }
    }
}
