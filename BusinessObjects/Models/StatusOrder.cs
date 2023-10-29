using System;
using System.Collections.Generic;

namespace BusinessObjects.Models
{
    public partial class StatusOrder
    {
        public StatusOrder()
        {
            Orders = new HashSet<Order>();
        }

        public int StatusOrderId { get; set; }
        public string? StatusValue { get; set; }

        public virtual ICollection<Order> Orders { get; set; }
    }
}
