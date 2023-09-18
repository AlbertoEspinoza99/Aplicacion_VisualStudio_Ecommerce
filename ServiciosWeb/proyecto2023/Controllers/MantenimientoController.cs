using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using proyecto2023.Models;
using proyecto2023.Servicios.Contrato;
using Microsoft.Data.SqlClient;
using proyecto2023.Recursos;
using Microsoft.EntityFrameworkCore;

namespace proyecto2023.Controllers
{
    public class MantenimientoController : Controller
    {
        private ProyectoServiciosWeb2023Context _context;

        private readonly IUsuarioService _usuarioService;

        private readonly IConfiguration _config;

        public MantenimientoController(ProyectoServiciosWeb2023Context context, IUsuarioService usuarioService,IConfiguration configuration)
        {
            _context = context;
            _usuarioService = usuarioService;
            _config= configuration;
        }


 //////////////////**********PRODUCTO**********///////////////////////////////////////////////////////////////////////////////////////////



        public IActionResult ListaProducto()
        {

            List<TbProducto> listaProducto= _context.TbProductos.Include(x=>x.IdCategoriaNavigation).ToList();

            return View(listaProducto);
        }


        public IActionResult CreateProducto()
        {
            ViewBag.IdCategoria = new SelectList(_context.TbCategoriaProductos.ToList(), "IdCategoria", "DescripcionCate");
            return View(new TbProducto());

        }

        [HttpPost]
        public IActionResult CreateProducto(TbProducto obj)
        {

            string mensaje = string.Empty;

            using(SqlConnection cn = new(_config["ConnectionStrings:cadenaSQL"]))
            {
                try
                {
                    SqlCommand cmd = new SqlCommand("proc_AgregarProducto", cn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@nombre_produc", obj.NombreProd);
                    cmd.Parameters.AddWithValue("@marca_produc", obj.MarcaProd);
                    cmd.Parameters.AddWithValue("@precio_produc", obj.PrecioProd);
                    cmd.Parameters.AddWithValue("@id_categoria", obj.IdCategoria);
                    cmd.Parameters.AddWithValue("@img_producto", obj.ImgProd);
                    cmd.Parameters.AddWithValue("@stock_produc", obj.StockProd);
                    cn.Open();
                    int cantidad = cmd.ExecuteNonQuery();
                    mensaje = $"se agrego {cantidad} elementos";
                }
                catch (Exception e) { mensaje = e.Message; }
                {

                }

                ViewBag.Mensaje = mensaje;
                return RedirectToAction("ListaProducto", "Mantenimiento");


            }

        }


        public IActionResult EditarProducto(int id)
        {

            TbProducto proc= _context.TbProductos.Where(x=>x.IdProducto==id).FirstOrDefault();
            ViewBag.IdCategoria = new SelectList(_context.TbCategoriaProductos.ToList(), "IdCategoria", "DescripcionCate");

            return View(proc);
        }

        [HttpPost]
        public IActionResult EditarProducto(TbProducto obj)
        {
            string mensaje=string.Empty;

            try
            {
                using (SqlConnection cn = new(_config["ConnectionStrings:cadenaSQL"]))
                {
                    SqlCommand cmd = new SqlCommand("proc_ActualizarProducto", cn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id_produc", obj.IdProducto);
                    cmd.Parameters.AddWithValue("@nombre_produc", obj.NombreProd);
                    cmd.Parameters.AddWithValue("@marca_produc", obj.MarcaProd);
                    cmd.Parameters.AddWithValue("@precio_produc", obj.PrecioProd);
                    cmd.Parameters.AddWithValue("@id_categoria", obj.IdCategoria);
                    cmd.Parameters.AddWithValue("@img_producto", obj.ImgProd);
                    cmd.Parameters.AddWithValue("@stock_produc", obj.StockProd);
                    cn.Open();
                    int numero = cmd.ExecuteNonQuery();
                    mensaje = $"se agrego {numero}";

                }

            }
            catch(Exception e) { mensaje=e.Message; }
            {


            }
            ViewBag.Mensaje=mensaje;
            return RedirectToAction("ListaProducto", "Mantenimiento");

        }

        public IActionResult DetalleProducto(int id)
        {
            TbProducto proc= _context.TbProductos.Where(c=>c.IdProducto==id).Include(x=>x.IdCategoriaNavigation).FirstOrDefault();  

            return View(proc);

        }

        [HttpPost]
        public IActionResult EliminarProducto(int id)
        {
            string mensaje = string.Empty;

            try
            {
                using (SqlConnection cn=new(_config["ConnectionStrings:cadenaSQL"]))
                {
                    SqlCommand cmd = new SqlCommand("proc_EliminarProducto", cn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id_produc", id);
                    cn.Open();
                    int numero = cmd.ExecuteNonQuery();
                    mensaje = $"se agrego{numero}";
                }


            }
            catch(Exception e) { mensaje = e.Message; }
            {

            }
            return RedirectToAction("ListaProducto", "Mantenimiento");

        }







 //////////////////**********USUARIO**********///////////////////////////////////////////////////////////////////////////////////////////




        public IActionResult ListaUsuario()
        {

            List<TbUsuario> listaUsuario= _context.TbUsuarios.Include(x=>x.IdRolNavigation).ToList();
            return View(listaUsuario);
        }




        public IActionResult Create()
        {
            ViewBag.IdRol = new SelectList(_context.TbRols.ToList(), "IdRol", "NombreRol");

            return View(new TbUsuario());
        }

        [HttpPost]
        public IActionResult Create(TbUsuario obj)
        {

            string mensaje=string.Empty;

            using (SqlConnection cn= new(_config["ConnectionStrings:cadenaSQL"]))
            {

                try
                {
                    SqlCommand cmd = new SqlCommand("proc_AgregarUsuario", cn);
                    cmd.CommandType=System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@email_usu", obj.EmailUsu);
                    cmd.Parameters.AddWithValue("@contrasena_usu", Utilidades.EncriptarClave(obj.PasswordUsu));
                    cmd.Parameters.AddWithValue("@nombre_usu", obj.NombreUsu);
                    cmd.Parameters.AddWithValue("@apellido_usu", obj.ApellidoUsu);
                    cmd.Parameters.AddWithValue("@estado_usu", obj.EstadoUsu);
                    cmd.Parameters.AddWithValue("@usuario_usu", obj.UsuarioUsu);
                    cmd.Parameters.AddWithValue("@id_rol", obj.IdRol);
                    cmd.Parameters.AddWithValue("@nuevo_esuario", obj.NuevoUsuarioUsu);
                    cn.Open();
                    int cantidad = cmd.ExecuteNonQuery();
                    mensaje = $"se agrego {cantidad}";


                }
                catch(Exception ex) { mensaje=ex.Message; }
                {



                }
                ViewBag.mensaje = mensaje;
                return RedirectToAction("ListaUsuario", "Mantenimiento");

            }


        }



        public IActionResult EditarUsuario(int id)
        {
            TbUsuario usu= _context.TbUsuarios.Where(x=>x.IdUsu==id).FirstOrDefault();
            ViewBag.IdRol = new SelectList(_context.TbRols.ToList(), "IdRol", "NombreRol");
            return View(usu);

        }

        [HttpPost]
        public IActionResult EditarUsuario(TbUsuario obj)
        {

            string mensaje = string.Empty;

            using (SqlConnection cn = new(_config["ConnectionStrings:cadenaSQL"]))
            {

                try
                {
                    SqlCommand cmd = new SqlCommand("proc_Actualizar", cn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@codigo_usu", obj.IdUsu);
                    cmd.Parameters.AddWithValue("@email_usu", obj.EmailUsu);
                    cmd.Parameters.AddWithValue("@contrasena_usu", Utilidades.EncriptarClave(obj.PasswordUsu));
                    cmd.Parameters.AddWithValue("@nombre_usu", obj.NombreUsu);
                    cmd.Parameters.AddWithValue("@apellido_usu", obj.ApellidoUsu);
                    cmd.Parameters.AddWithValue("@estado_usu", obj.EstadoUsu);
                    cmd.Parameters.AddWithValue("@usuario_usu", obj.UsuarioUsu);
                    cmd.Parameters.AddWithValue("@id_rol", obj.IdRol);
                    cmd.Parameters.AddWithValue("@nuevo_esuario", obj.NuevoUsuarioUsu);
                    cn.Open();
                    int cantidad = cmd.ExecuteNonQuery();
                    mensaje = $"se agrego {cantidad}";


                }
                catch (Exception ex) { mensaje = ex.Message; }
                {



                }
                ViewBag.mensaje = mensaje;
                return RedirectToAction("ListaUsuario", "Mantenimiento");

            }

        }


        public IActionResult DetalleUsuario(int id)
        {

            TbUsuario usu= _context.TbUsuarios.Where(x=>x.IdUsu==id).FirstOrDefault();

            return View(usu);
        }



        [HttpPost]
        public IActionResult EliminarUsuario(int id)
        {
            string mensaje = string.Empty;

            try
            {
                using (SqlConnection cn = new(_config["ConnectionStrings:cadenaSQL"]))
                {
                    SqlCommand cmd = new SqlCommand("proc_EliminarUsuario", cn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@codigo_usu", id);
                    cn.Open();
                    int numero = cmd.ExecuteNonQuery();
                    mensaje = $"se agrego{numero}";
                }


            }
            catch (Exception e) { mensaje = e.Message; }
            {

            }
            return RedirectToAction("ListaUsuario", "Mantenimiento");

        }

















































    }
}
