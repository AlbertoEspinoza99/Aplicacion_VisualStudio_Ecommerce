using Microsoft.AspNetCore.Mvc;

namespace proyecto2023.Controllers
{
    public class PaginaVentaController : Controller
    {
        public IActionResult PaginaVenta()
        {
            return View();
        }
    }
}
