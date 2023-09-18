using Microsoft.AspNetCore.Mvc;
using proyecto2023.Models;

namespace proyecto2023.Controllers
{
    public class ListaProductosPorBusqueda : Controller
    {

        private ProyectoServiciosWeb2023Context _context;

        public ListaProductosPorBusqueda(ProyectoServiciosWeb2023Context context)
        {
            _context = context;
        }


        public IActionResult Lista(string nombre,int pa=0)
        {

            List<TbProducto> lista = _context.TbProductos.Where(x => x.NombreProd.Contains(nombre)).ToList();

            //numero de filas por paginas


            int filas = 4;
            int n = lista.Count();

            int pags = n % filas > 0 ? n / filas + 1 : n / filas;

            ViewBag.pags = pags;
            ViewBag.pa = pa;
            ViewBag.nom = nombre;

            return View(lista.Skip(pa*filas).Take(filas));
        }
    }
}
