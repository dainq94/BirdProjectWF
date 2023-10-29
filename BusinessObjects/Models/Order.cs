using System;
using System.Collections.Generic;

namespace BusinessObjects.Models
{
    public partial class Order
    {
        public Order()
        {
            OrderDetails = new HashSet<OrderDetail>();
        }

        public int OrderId { get; set; }
        public int? OrderFromUser { get; set; }
        public string? CustomerName { get; set; }
        public string? CustomerEmail { get; set; }
        public string? CustomerPhone { get; set; }
        public string? CustomerAddress { get; set; }
        public DateTime DateTime { get; set; }
        public int PaymentMethod { get; set; }
        public int? DeliverStatus { get; set; }
        public decimal? TotalOrder { get; set; }

        public virtual StatusOrder? DeliverStatusNavigation { get; set; }
        public virtual User? OrderFromUserNavigation { get; set; }
        public virtual Payment PaymentMethodNavigation { get; set; } = null!;
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
