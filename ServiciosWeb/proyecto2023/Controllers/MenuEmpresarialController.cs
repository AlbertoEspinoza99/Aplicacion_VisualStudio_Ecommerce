using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using proyecto2023.Models;
using System.Drawing.Text;
using System.Text.Json.Serialization;
using System.Text.Json;
using System.Security.Claims;

namespace proyecto2023.Controllers
{
    public class MenuEmpresarialController : Controller
    {

        private ProyectoServiciosWeb2023Context _context;

        public MenuEmpresarialController(ProyectoServiciosWeb2023Context context)
        {
            _context = context;
        }

        public IActionResult MenuEmp()
        {
            List<TbMenuEmpresarial> lista = _context.TbMenuEmpresarials.Include(x => x.TbSubmenuEmpresarials).Include(m=>m.TbPermisos).Where(z => z.IdMenuEmpre > 0).ToList();

            ClaimsPrincipal usuario = HttpContext.User;

            string nombreUsuaio= usuario.Claims.Where(c=>c.Type==ClaimTypes.Role).Select(c=>c.Value).FirstOrDefault();

            int numero=Int32.Parse(nombreUsuaio);


            var option = new JsonSerializerOptions
            {

                ReferenceHandler = ReferenceHandler.IgnoreCycles,
                WriteIndented = true,

            };

            HttpContext.Session.SetString("menuEmpre",JsonSerializer.Serialize(lista,option));
            HttpContext.Session.SetString("Rol",JsonSerializer.Serialize(numero,option));

            return RedirectToAction("Index", "PaginaEmpresarial");

        }


    }
}
