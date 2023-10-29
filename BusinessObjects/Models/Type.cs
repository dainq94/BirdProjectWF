using System;
using System.Collections.Generic;

namespace BusinessObjects.Models
{
    public partial class Type
    {
        public int TypeId { get; set; }
        public string Name { get; set; } = null!;
    }
}
