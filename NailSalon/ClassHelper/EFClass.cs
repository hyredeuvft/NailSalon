using NailSalon.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NailSalon.ClassHelper
{
    public class EFClass
    {
        public static Entities Context { get; } = new Entities();
    }
}
