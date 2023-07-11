using FacturacionWeb.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FacturacionWeb.Controllers
{
    [Authorize]
    public class ProductoController : Controller
    {
        // GET: Producto
        public ActionResult Index()
        {
            return View();
        }

        public string ListaProductos()
        {

            using (BDFacturaEntities context = new BDFacturaEntities())
            {
                Response resp = new Response();
                try
                {
                    resp.Data = context.Producto.ToList();
                    resp.Status = 200;
                    return JsonConvert.SerializeObject(resp);
                }
                catch (Exception ex)
                {
                    resp.Status = 400;
                    resp.Error = ex.Message.Replace("'", "").Replace("\"", "");
                    return JsonConvert.SerializeObject(resp);
                }

            }
        }


        public string ListaProductosActivos()
        {

            using (BDFacturaEntities context = new BDFacturaEntities())
            {
                Response resp = new Response();
                try
                {
                    resp.Data = context.Producto.Where(x=> x.Estado == 1 && x.Stock > 0).ToList();
                    resp.Status = 200;
                    return JsonConvert.SerializeObject(resp);
                }
                catch (Exception ex)
                {
                    resp.Status = 400;
                    resp.Error = ex.Message.Replace("'", "").Replace("\"", "");
                    return JsonConvert.SerializeObject(resp);
                }

            }
        }

        public string GuardarProducto(string nombre, string pre, string costo, string stock)
        {
            using (BDFacturaEntities context = new BDFacturaEntities())
            {

                Response resp = new Response();

                try
                {
                    Producto p = new Producto();
                    p.Nombre = nombre;
                    p.Precio = Convert.ToDecimal( pre);
                    p.Stock = Convert.ToDecimal(stock);
                    p.Costo = Convert.ToDecimal(costo);
                    p.Estado = 1;
                    context.Producto.Add(p);
                    context.SaveChanges();
                    resp.Status = 200;
                    return JsonConvert.SerializeObject(resp);
                }
                catch (Exception ex)
                {

                    resp.Status = 400;
                    resp.Error = ex.Message.Replace("'", "").Replace("\"", "");
                    return JsonConvert.SerializeObject(resp);
                }
            }

        }
    }
}