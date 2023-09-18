using Microsoft.AspNetCore.Mvc;
using proyecto2023.Extension;
using proyecto2023.Models;
using System.Linq;

namespace proyecto2023.Controllers
{
    public class ListaDeProductosPorCategoriasController : Controller
    {

        private ProyectoServiciosWeb2023Context _context;

        public ListaDeProductosPorCategoriasController(ProyectoServiciosWeb2023Context context)
        {
            _context=context;
        }


        public IActionResult ListaProducto(int categoria)
        {

            List<TbProducto> listaProducto= _context.TbProductos.Where(x=>x.IdCategoria== categoria).ToList();


            return View(listaProducto);
        }

        private int indice(int id)
        {

            List<TbCarrito> compras = HttpContext.Session.GetObject<List<TbCarrito>>("carrito");

            for(int i=0; i < compras.Count; i++)
            {
                if (compras[i].IdProducto == id)
                {
                    return i;
                }

            }

            return -1;

        }


        public IActionResult listaCarrito(int idProducto,int idCategoria)
        {
           
            int idUsuario = 1;
            int cantidad = 1;

            int? numeroStock= _context.TbProductos.Where(x=>x.IdProducto== idProducto).Select(c => c.StockProd).FirstOrDefault();

            List<TbCarrito> compras = new List<TbCarrito>();


            if (numeroStock == 0)
            {
                TempData["Mensaje"] = "Total permitido";
                return RedirectToAction("ListaProducto", "ListaDeProductosPorCategorias", new { categoria = idCategoria });
            }
            else
            {

                if (HttpContext.Session.GetObject<List<TbCarrito>>("carrito") == null)
                {


                    compras.Add(new TbCarrito(_context.TbUsuarios.Find(idUsuario), _context.TbProductos.Find(idProducto), cantidad));
                    _context.TbProductos.Where(x => x.IdProducto == idProducto).ToList().ForEach(z => z.StockProd -= 1);
                    _context.SaveChanges();
                    HttpContext.Session.SetObject("carrito", compras);
                }
                else
                {

                    int posicion = indice(idProducto);

                    if (posicion == -1)
                    {
                        compras = HttpContext.Session.GetObject<List<TbCarrito>>("carrito");
                        compras.Add(new TbCarrito(_context.TbUsuarios.Find(idUsuario), _context.TbProductos.Find(idProducto), cantidad));
                        _context.TbProductos.Where(x => x.IdProducto == idProducto).ToList().ForEach(z => z.StockProd -= 1);
                        _context.SaveChanges();
                        HttpContext.Session.SetObject("carrito", compras);
                    }
                    else
                    {


                        compras = HttpContext.Session.GetObject<List<TbCarrito>>("carrito");


                        compras[posicion].Cantidad += cantidad;
                        _context.TbProductos.Where(x => x.IdProducto == idProducto).ToList().ForEach(z => z.StockProd -= 1);
                        _context.SaveChanges();

                        HttpContext.Session.SetObject("carrito", compras);




                    }


                }



                return RedirectToAction("ListaProducto", "ListaDeProductosPorCategorias", new { categoria = idCategoria });
            }


        }





    }
}
