using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace proyecto2023.Controllers
{
	[Authorize]
	public class terminosYcondicionesController : Controller
	{
		public IActionResult xxx()
		{
			

			return View();
		}
	}
}
