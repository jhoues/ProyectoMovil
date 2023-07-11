using FacturacionWeb.Models;
using Newtonsoft.Json;
using System;
using System.Activities.Statements;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.Mvc;
using TransactionScope = System.Transactions.TransactionScope;

namespace FacturacionWeb.Controllers
{
    [Authorize]
    public class ClienteController : Controller
    {
        // GET: Cliente
        public ActionResult Index()
        {
            //List<Cliente> clientes = ListaClientes();
            return View();
        }


        public string GuardarCliente(string ced, string nom, string ape, string tel, string dir)
        {
            using (BDFacturaEntities context = new BDFacturaEntities())
            {
                using (var scope = context.Database.BeginTransaction(System.Data.IsolationLevel.Serializable))
                {
                    Response resp = new Response();
                    try
                    {
                        Cliente c = new Cliente();
                        c.CedRuc = ced;
                        c.Nombres = nom;
                        c.Apellidos = ape;
                        c.Telefono = tel;
                        c.Direccion = dir;
                        c.Estado = 1;
                        context.Cliente.Add(c);
                        context.SaveChanges();
                        scope.Commit();
                        resp.Status = 200;

                        return JsonConvert.SerializeObject(resp);
                    }
                    catch (Exception ex)
                    {
                        scope.Rollback();
                        resp.Status = 400;
                        resp.Error = ex.Message.Replace("'", "").Replace("\"", "");
                        return JsonConvert.SerializeObject(resp);
                    }
                }


            }


        }

        public string ListaClientes()
        {

            using (BDFacturaEntities context = new BDFacturaEntities())
            {

                Response resp = new Response();
                try
                {
                    resp.Data = context.Cliente.ToList();
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


        public string ListaClientesActivos()
        {

            using (BDFacturaEntities context = new BDFacturaEntities())
            {

                Response resp = new Response();
                try
                {
                    resp.Data = context.Cliente.Where(x=> x.Estado ==1).ToList();
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