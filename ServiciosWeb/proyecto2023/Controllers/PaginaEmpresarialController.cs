using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;

namespace proyecto2023.Controllers
{
    [Authorize]
    public class PaginaEmpresarialController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult CerrarSesion()
        {

            HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);

            return RedirectToAction("MenuPorUsuario", "Menu");

        }

    }
}
