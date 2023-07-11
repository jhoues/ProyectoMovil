using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FacturacionWeb.Models
{
    public class FacturaModelView
    {
        public int ID { get; set; }
        public string CedRuc { get; set; }
        public string Cliente { get; set; }
        public DateTime Fecha { get; set; }
        public decimal Total { get; set; }
        public decimal Iva { get; set; }
        public string Empleado { get; set; }
        public int Estado { get; set; }
    }
}