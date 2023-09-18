using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using proyecto2023.Models;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace proyecto2023.Controllers
{
    public class MenuController : Controller
    {

        private ProyectoServiciosWeb2023Context _context;
        
        public MenuController(ProyectoServiciosWeb2023Context context)
        {
            _context = context;
        }

        public IActionResult MenuPorUsuario()
        {

            List<TbMenu> menuLista = _context.TbMenus.Include(m=>m.TbSubmenus).Where(x => x.IdMenu>0).ToList();

            List<TbCategoriaProducto> categoriaLista = _context.TbCategoriaProductos.ToList();

            var options = new JsonSerializerOptions
            {

                ReferenceHandler=ReferenceHandler.IgnoreCycles,
                WriteIndented = true,

            };

            HttpContext.Session.SetString("menu", JsonSerializer.Serialize(menuLista, options));
            HttpContext.Session.SetString("categoria",JsonSerializer.Serialize(categoriaLista,options));
            return RedirectToAction("PaginaVenta", "PaginaVenta");

        }

        public JsonResult OnGet(string query)
        {

            var suggestions= _context.TbProductos
                 .Where(x=>x.NombreProd.Contains(query))
                 .Select(s=>s.NombreProd)
                 .ToList();

            //var suggestions = _context.Videos
            //    .Where(v => v.Title.Contains(query))
            //    .Select(v => v.Title)
            //    .ToList();

            return new JsonResult(suggestions);
        }



    }
}
