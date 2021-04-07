using System;

namespace gateway
{
    public class Availability
    {
        public Availability(Inventory inv)
        {
            Quantity = inv.Quantity;
        }
        public int Quantity { get; set; } = 0;
    }

    public class Inventory
    {
        public String ItemId {get; set;}

        public int Quantity { get; set; }
    }
    public class Products
    {
        public String ItemId { get; set; }
        public String Name { get; set; }
        public String Description { get; set; }
        public float Price { get; set; } = 0;
        public Availability Availability { get; set; }
    }
}
