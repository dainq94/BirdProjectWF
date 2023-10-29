﻿using System;
using System.Collections.Generic;

namespace BusinessObjects.Models
{
    public partial class ImageProduct
    {
        public int? ProductId { get; set; }
        public string? Image { get; set; }
        public bool? DeleteFlag { get; set; }

        public virtual Product? Product { get; set; }
    }
}
