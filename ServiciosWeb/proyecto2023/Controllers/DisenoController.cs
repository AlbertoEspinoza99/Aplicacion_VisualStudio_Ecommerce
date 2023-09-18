using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using proyecto2023.Models;
using System.Security.Claims;

namespace proyecto2023.Controllers
{
    [Authorize]
    public class DisenoController : Controller
    {

        private ProyectoServiciosWeb2023Context _context;

        public DisenoController(ProyectoServiciosWeb2023Context context)
        {
            _context=context;
        }

        public IActionResult Bosque()
        {

            ClaimsPrincipal claimdUser = HttpContext.User;

            string nombreUsuario="";
           

            if (claimdUser.Identity.IsAuthenticated)
            {

				nombreUsuario= claimdUser.Claims.Where(c=>c.Type==ClaimTypes.Name).Select(c=>c.Value).SingleOrDefault();

			}
            int? numero = _context.TbUsuarios.Where(c => c.NombreUsu == nombreUsuario).Select(x => x.NuevoUsuarioUsu).FirstOrDefault();


            ViewData["nombre"] = nombreUsuario;
           
            ViewBag.numero=numero;

            if (numero == 1)
            {

                _context.TbUsuarios.Where(c => c.NombreUsu == nombreUsuario).ToList().ForEach(x => x.NuevoUsuarioUsu = 2);
                _context.SaveChanges();
                return View();
            }

            return View();
        }
    }
}
