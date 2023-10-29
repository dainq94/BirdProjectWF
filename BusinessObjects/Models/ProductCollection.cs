using System;
using System.Collections.Generic;

namespace BusinessObjects.Models
{
    public partial class ProductCollection
    {
        public int ProductId { get; set; }
        public int CollectionId { get; set; }
        public bool DeleteFlag { get; set; }

        public virtual Collection Collection { get; set; } = null!;
        public virtual Product Product { get; set; } = null!;
    }
}
