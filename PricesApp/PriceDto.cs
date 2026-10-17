using System;
using System.Collections.Generic;
using System.Text;

namespace PricesApp
{
    internal class PriceDto
    {
        public int PriceId { get; set; }
        public string SupplierName { get; set; }
        public string Brand { get; set; }
        public string Article { get; set; }
        public int Qty { get; set; }
        public decimal Price { get; set; }
        public string Descr { get; set; }
    }
}
