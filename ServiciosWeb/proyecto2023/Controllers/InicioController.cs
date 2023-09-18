using Microsoft.AspNetCore.Mvc;
using proyecto2023.Models;
using proyecto2023.Recursos;
using proyecto2023.Servicios.Contrato;

//autentificacion por cookies
using System.Security.Claims;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;



namespace proyecto2023.Controllers
{
    public class InicioController : Controller
    {
        private readonly IUsuarioService _usuarioService;

        public InicioController(IUsuarioService usuarioService)
        {
            _usuarioService = usuarioService;
        }



        public IActionResult Registrarse()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Registrarse(TbUsuario modelo)
        {
            modelo.PasswordUsu = Utilidades.EncriptarClave(modelo.PasswordUsu);

            TbUsuario usuario_creado = await _usuarioService.SavetbUsuario(modelo);

            if (usuario_creado.IdUsu > 0)
            {
                return RedirectToAction("IniciarSesion","Inicio");
            }
            ViewData["Mensaje"] = "No se pudo crear el usuario";

            return View();

        }


        public IActionResult IniciarSesion()
        {
            return View();
        }


        [HttpPost]
        public async Task<IActionResult> IniciarSesion(string correo,string clave)
        {

            TbUsuario usuario_encontrado= await _usuarioService.GetTbUsuario(correo, Utilidades.EncriptarClave(clave));

            TbUsuario usuario_encontrado2 = await _usuarioService.GetTbUsuario(correo, Utilidades.EncriptarClave(clave));

            if (usuario_encontrado == null)
            {
                ViewData["Mensaje"] = "no se encontraron coincidencias";
                return View();

            }
            else
            {

                if (usuario_encontrado.IdRol != 8)
                {



                    //si encuentra esto guardara la informacion del usuario
                    List<Claim> claims = new List<Claim>()
                                {
                                    new Claim(ClaimTypes.Name,usuario_encontrado.NombreUsu),
                                    new Claim(ClaimTypes.Role,usuario_encontrado.IdRol.ToString())

                                };

                    //luego esto registrara con una estructura por defecto
                    ClaimsIdentity claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                    //propiedades de la autentificacion
                    AuthenticationProperties properties = new AuthenticationProperties()
                    {
                        //permitir que se refresque la autentificacion
                        AllowRefresh = true,

                    };

                    await HttpContext.SignInAsync(

                        CookieAuthenticationDefaults.AuthenticationScheme,
                        new ClaimsPrincipal(claimsIdentity),
                        properties


                        );



                    return RedirectToAction("Bosque", "diseno"); ;

                }
                else
                {
                    return RedirectToAction("MenuPorUsuario", "Menu"); ;


                }
            }


        }

    }
}
