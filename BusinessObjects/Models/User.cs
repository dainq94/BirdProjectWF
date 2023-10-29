using System;
using System.Collections.Generic;

namespace BusinessObjects.Models
{
    public partial class User
    {
        public User()
        {
            InverseManager = new HashSet<User>();
            Orders = new HashSet<Order>();
            RateProducts = new HashSet<RateProduct>();
        }

        public int UserId { get; set; }
        public string? FullName { get; set; }
        public string? Email { get; set; }
        public string? EmailId { get; set; }
        public string? Password { get; set; }
        public string? Phone { get; set; }
        public DateTime? Dob { get; set; }
        public string? Address { get; set; }
        public string? Avatar { get; set; }
        public string? Gender { get; set; }
        public int? RoleId { get; set; }
        public int? ManagerId { get; set; }
        public bool? Status { get; set; }
        public string? Description { get; set; }
        public bool? DeleteFlag { get; set; }

        public virtual User? Manager { get; set; }
        public virtual Role? Role { get; set; }
        public virtual ICollection<User> InverseManager { get; set; }
        public virtual ICollection<Order> Orders { get; set; }
        public virtual ICollection<RateProduct> RateProducts { get; set; }
    }
}
