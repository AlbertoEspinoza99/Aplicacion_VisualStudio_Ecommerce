using Humanizer;
using Microsoft.AspNetCore.Mvc;
using proyecto2023.Models;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using System.Globalization;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace proyecto2023.Controllers
{
    public class ConsultaController : Controller
    {

        private ProyectoServiciosWeb2023Context _context;

        public ConsultaController(ProyectoServiciosWeb2023Context context)
        {
            _context = context;
        }


        public IActionResult CONSULTAS() 
        {
            return View();  
        }

        public IActionResult CONSULTAproducto()
        {

            List<TbProducto> lista = _context.TbProductos.Include(x=>x.IdCategoriaNavigation).ToList();

            ViewData["listaProducto"] = lista;

            return View();
        }



        public IActionResult resumenVenta()
        {

            DateTime FechaInicio = DateTime.Now;
            FechaInicio= FechaInicio.AddDays(-5);
            // A ESTO SE LE LLAMA lenqiud
            List<CTVenta> lista = (from tborden in _context.TbOrdens
                                   where tborden.FechaOrden.Value.Date >= FechaInicio.Date
                                   group tborden by tborden.FechaOrden.Value.Date into grupo
                                   select new CTVenta
                                   {
                                       fecha = grupo.Key.ToString("dd/MM/yyyy"),
                                       cantidad = grupo.Count(),
                                   }).ToList();


            //Esta línea se utiliza para devolver una respuesta HTTP con un estado 200 OK (éxito)
            return StatusCode(StatusCodes.Status200OK,lista);
        }


        public IActionResult resumenProducto()
        {

            //DateTime FechaInicio = DateTime.Now;
            //FechaInicio = FechaInicio.AddDays(-5);
            

            // A ESTO SE LE LLAMA lenqiud
            List<CTProducto> lista = (from tbDetalleorden in _context.TbDetalleOrdens                               
                                   group tbDetalleorden by tbDetalleorden.IdProducto into grupo
                                   orderby grupo.Sum(x => x.CantidadDetalle) descending 
                                      select new CTProducto
                                   {

                                       Producto = _context.TbProductos.Where(x=>x.IdProducto== grupo.Key).Select(x=>x.NombreProd).FirstOrDefault().ToString(),                                   
                                       cantidad = grupo.Sum(x => x.CantidadDetalle)
                                   }).Take(4).ToList();


            //Esta línea se utiliza para devolver una respuesta HTTP con un estado 200 OK (éxito)
            return StatusCode(StatusCodes.Status200OK, lista);
        }




        public IActionResult productoVentas(int cod)
        {


            List<CTProductoSusVentas> lista = (from detalle in _context.TbDetalleOrdens
                                               where detalle.IdProducto == cod
                                               group detalle by detalle.IdProducto into grupo
                                               orderby grupo.Sum(s => s.CantidadDetalle) descending
                                               select new CTProductoSusVentas
                                               {
                                                   producto = _context.TbProductos.Where(x => x.IdProducto == grupo.Key).Select(x => x.NombreProd).FirstOrDefault().ToString(),
                                                   cantidad = grupo.Sum(s => s.CantidadDetalle)

                                               }).ToList();

               return StatusCode(StatusCodes.Status200OK, lista);
        }





        public IActionResult resumenMes()
        {
          
            var grupos = _context.TbDetalleOrdens
                .GroupBy(tdDetalle => new { Month = tdDetalle.FechaDetalle.Value.Month })
                .ToList();

            List<CTProductoMes> lista = grupos
                .Select(grupo => new CTProductoMes
                {
                    //CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(grupo.Key.Month),
                    fecha = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(grupo.Key.Month),
                    cantidad = (int)grupo.GroupBy(e => e.IdProducto).Select(g => new { IdProducto = g.Key, TotalCantidad = g.Sum(a => a.CantidadDetalle) }).OrderByDescending(g => g.TotalCantidad).Take(1).FirstOrDefault().TotalCantidad,
                    producto = string.Join(", ", grupo
                        .GroupBy(e => e.IdProducto)
                        .Select(g => new { IdProducto = g.Key, TotalCantidad = g.Sum(a => a.CantidadDetalle) })
                        .OrderByDescending(g => g.TotalCantidad)
                        .Take(2)
                        .Join(_context.TbProductos, g => g.IdProducto, p => p.IdProducto, (g, p) => p.NombreProd)
                        .ToList())
                })
                .ToList();

            return StatusCode(StatusCodes.Status200OK, lista);



        }

















    }
}
