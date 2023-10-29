using System;
using System.Collections.Generic;

namespace BusinessObjects.Models
{
    public partial class Payment
    {
        public Payment()
        {
            Orders = new HashSet<Order>();
        }

        public int PaymentId { get; set; }
        public string Method { get; set; } = null!;
        public bool Status { get; set; }

        public virtual ICollection<Order> Orders { get; set; }
    }
}
