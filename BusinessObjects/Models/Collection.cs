using System;
using System.Collections.Generic;

namespace BusinessObjects.Models
{
    public partial class Collection
    {
        public Collection()
        {
            ProductCollections = new HashSet<ProductCollection>();
        }

        public int CollectionId { get; set; }
        public string CollectionName { get; set; } = null!;
        public string? Link { get; set; }
        public bool Status { get; set; }
        public string? Description { get; set; }

        public virtual ICollection<ProductCollection> ProductCollections { get; set; }
    }
}
