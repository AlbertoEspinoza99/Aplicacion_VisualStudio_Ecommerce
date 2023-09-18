using AspNetCore.Reporting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using proyecto2023.Models;
using System.Data;

namespace proyecto2023.Controllers
{
    public class ReporteController : Controller
    {

        private IConfiguration _config;
        private ProyectoServiciosWeb2023Context _context;
        private IWebHostEnvironment _webHostEnv;

        public ReporteController(IConfiguration config, ProyectoServiciosWeb2023Context context, IWebHostEnvironment webHostEnv)
        {
            _config = config;
            _context = context;
            _webHostEnv = webHostEnv;
            System.Text.Encoding.RegisterProvider(System.Text.CodePagesEncodingProvider.Instance);
        }

        public IActionResult index()
        {

            List<TbOrden> lista= _context.TbOrdens.Include(x=>x.IdUsuNavigation).ToList();

            ViewData["lista"] = lista;

            return View();
        }

        public DataTable getProducto()
        {

            var dt = new DataTable();
            using (SqlConnection cn = new(_config["ConnectionStrings:cadenaSQL"]))
            {

                SqlCommand cmd = new SqlCommand("productoReporte", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cn.Open();
                SqlDataAdapter dr = new SqlDataAdapter(cmd);
                dr.Fill(dt);
                cn.Close();

            }
            return dt;

        }


        public DataTable getUsuario(int id)
        {
            
            var dt = new DataTable();

            using (SqlConnection cn = new SqlConnection(_config["ConnectionStrings:cadenaSQL"]))
            {
                using (SqlCommand cmd = new SqlCommand("ReporteCompras", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", id);
                    // Agrega más parámetros si es necesario

                    cn.Open();
                    using (SqlDataAdapter dr = new SqlDataAdapter(cmd))
                    {
                        dr.Fill(dt);
                    }
                }
            }

            return dt;
        }









        public IActionResult ResultadoInfo()
        {

            var dt = new DataTable();
            dt = getProducto();

            string mimetype = "";
            int extension = 1;
            var path = $"{_webHostEnv.WebRootPath}\\Reports\\rptProductoInfo.rdlc";

            Dictionary<string, string> parameters = new Dictionary<string, string>();
            parameters.Add("prmt1", "Reportes");
            parameters.Add("prmt2", DateTime.Now.ToString("dd-MM-yyyy"));
            parameters.Add("prmt3", "Productos");

            LocalReport localReport = new LocalReport(path);
            localReport.AddDataSource("dsProducto", dt);

            var res = localReport.Execute(RenderType.Pdf, extension, parameters, mimetype);

            return File(res.MainStream, "application/pdf");

        }

        public IActionResult ResultadoUsuario(int id)
        {

            var dt = new DataTable();
            dt = getUsuario(id);

            string mimetype = "";
            int extension = 1;
            var path = $"{_webHostEnv.WebRootPath}\\Reports\\rptUsuario.rdlc";

            Dictionary<string, string> parameters = new Dictionary<string, string>();
            parameters.Add("prm1", "FACTURA");
            parameters.Add("prm2", DateTime.Now.ToString("dd-MM-yyyy"));
          

            LocalReport localReport = new LocalReport(path);
            localReport.AddDataSource("dsUsuario", dt);

            var res = localReport.Execute(RenderType.Pdf, extension, parameters, mimetype);

            return File(res.MainStream, "application/pdf");




        }










    }
}
