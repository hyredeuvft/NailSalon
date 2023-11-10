using NailSalon.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NailSalon.ClassHelper
{
    public class CartClass
    {
        public static List<Product> Products { get; set; } = new List<Product>();
        public static List<Service> Services { get; set; } = new List<Service>();
    }
}
