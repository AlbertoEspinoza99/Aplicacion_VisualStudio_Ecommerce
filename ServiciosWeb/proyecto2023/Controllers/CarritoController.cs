using Microsoft.AspNetCore.Mvc;
using proyecto2023.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Session;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.Globalization;
using proyecto2023.Extension;
using Microsoft.CodeAnalysis.Host;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Build.Framework;

namespace proyecto2023.Controllers
{
    public  class  CarritoController : Controller
    {

        private static ProyectoServiciosWeb2023Context _context;

        public  CarritoController(ProyectoServiciosWeb2023Context context)
        {
            _context = context;
        }



        private int indice(int id)
        {

            List<TbCarrito> compras = HttpContext.Session.GetObject<List<TbCarrito>>("carrito");



            for (int i = 0; i < compras.Count; i++)
            {
                if (compras[i].IdProducto == id)
                {
                    return i;
                }


            }

            return -1;

        }



        public  IActionResult AgregarCarrito()
        {
            List<TbProducto> listaProducto = _context.TbProductos.ToList();

            return View(listaProducto);
        }



        [HttpPost]
        public  IActionResult AgregarCarrito(int iddd, int valor)
        {
            int idUsuario = 1;
            int cantidad = 1;
            int? numeroStock = _context.TbProductos.Where(x => x.IdProducto == iddd).Select(c => c.StockProd).FirstOrDefault();


            List<TbCarrito> compras = new List<TbCarrito>();

            if (numeroStock == 0)
            {
                TempData["Mensaje"] = "Total permitido";
                int posicion = indice(iddd);
                if (valor == 2)
                {

                    compras = HttpContext.Session.GetObject<List<TbCarrito>>("carrito");

                    compras[posicion].Cantidad -= cantidad;
                    _context.TbProductos.Where(x => x.IdProducto == iddd).ToList().ForEach(z => z.StockProd += 1);
                    _context.SaveChanges();
                    HttpContext.Session.SetObject("carrito", compras);
                    int? numeral = compras[posicion].Cantidad;

                    if (numeral <= 0)
                    {
                        TempData["Mensaje"] = "Producto Eliminado";
                        EliminarCarrito(iddd);
                    }

                }
               
                return RedirectToAction("AgregarCarrito", "Carrito");
            }
            else
            {
                if (HttpContext.Session.GetObject<List<TbCarrito>>("carrito") == null)
                {

                    compras.Add(new TbCarrito(_context.TbUsuarios.Find(idUsuario), _context.TbProductos.Find(iddd), cantidad));
                    _context.TbProductos.Where(x => x.IdProducto == iddd).ToList().ForEach(z => z.StockProd -= 1);
                    _context.SaveChanges();
                    HttpContext.Session.SetObject("carrito", compras);

                }
                else
                {


                    int posicion = indice(iddd);

                    if (posicion == -1)
                    {
                        compras = HttpContext.Session.GetObject<List<TbCarrito>>("carrito");
                        compras.Add(new TbCarrito(_context.TbUsuarios.Find(idUsuario), _context.TbProductos.Find(iddd), cantidad));
                        _context.TbProductos.Where(x => x.IdProducto == iddd).ToList().ForEach(z => z.StockProd -= 1);
                        _context.SaveChanges();
                        HttpContext.Session.SetObject("carrito", compras);

                    }
                    else
                    {
                        if (valor == 1)
                        {

                            compras = HttpContext.Session.GetObject<List<TbCarrito>>("carrito");
                            compras[posicion].Cantidad += cantidad;
                            _context.TbProductos.Where(x => x.IdProducto == iddd).ToList().ForEach(z => z.StockProd -= 1);
                            _context.SaveChanges();
                            HttpContext.Session.SetObject("carrito", compras);

                        }
                        else
                        {
                            compras = HttpContext.Session.GetObject<List<TbCarrito>>("carrito");
                            
                            compras[posicion].Cantidad -= cantidad;
                            _context.TbProductos.Where(x => x.IdProducto == iddd).ToList().ForEach(z => z.StockProd += 1);
                            _context.SaveChanges();
                            HttpContext.Session.SetObject("carrito", compras);
                            int? numeral = compras[posicion].Cantidad;

                            if (numeral<=0)
                            {
                                TempData["Mensaje"] = "Producto Eliminado";
                                EliminarCarrito(iddd);
                            }
                           

                        }


                    }


                }

                return RedirectToAction("AgregarCarrito", "Carrito");
            }
        }



        public IActionResult EliminarCarrito(int codProc)
        {
            List<TbCarrito> compras = HttpContext.Session.GetObject<List<TbCarrito>>("carrito");
            compras.RemoveAt(indice(codProc));
            HttpContext.Session.SetObject("carrito", compras);
            return RedirectToAction("AgregarCarrito", "Carrito");


        }

        public IActionResult GenerarPedido()
        {
            double total = HttpContext.Session.GetObject<double>("precio");

            ViewBag.IdUsu = 1;
            ViewBag.IdPago = new SelectList(_context.TbMetodoPagos.ToList(), "IdPago", "NombrePago");
            ViewBag.IdDomi = 1;
            ViewBag.precioTotal=total;

            return View(new TbOrden());

        }

        [HttpPost]
        public IActionResult GenerarPedido(TbOrden objeto)
        {
            List<TbCarrito> compras = new List<TbCarrito>();
            compras = HttpContext.Session.GetObject<List<TbCarrito>>("carrito");
            

            if(compras!=null && compras.Count > 0)
            {

                TbOrden orden = new TbOrden();

                orden.IdUsu=objeto.IdUsu;
                orden.IdPago=objeto.IdPago;
                orden.Total= objeto.Total;
                orden.IdDomi=objeto.IdDomi;
                orden.FechaOrden = DateTime.Now;

                orden.TbDetalleOrdens = (from producto in compras select new TbDetalleOrden { 
                
                                            IdProducto= producto.IdProducto,
                                            CantidadDetalle= producto.Cantidad,
                                            PrecioDetalle= decimal.Parse(_context.TbProductos.Where(x => x.IdProducto == producto.IdProducto).Select(c => c.PrecioProd).FirstOrDefault().ToString()),
                                            FechaDetalle= DateTime.Now
                                             }).ToList();


                _context.TbOrdens.Add(orden);
                _context.SaveChanges();
                HttpContext.Session.SetObject("carrito",new LinkedList<TbCarrito>());

            }

            return RedirectToAction("MenuPorUsuario", "Menu");
        }

    }
    
}
