using Microsoft.EntityFrameworkCore;
using proyecto2023.Models;
using proyecto2023.Servicios.Contrato;

namespace proyecto2023.Servicios.Implementacion
{
    public class UsuarioService : IUsuarioService
    {
        private readonly ProyectoServiciosWeb2023Context _dbContext;

        public UsuarioService(ProyectoServiciosWeb2023Context dbContext)
        {
            _dbContext = dbContext;
        }   

        public async Task<TbUsuario> GetTbUsuario(string correo, string clave)
        {
           
            TbUsuario usuario_encontrado= await _dbContext.TbUsuarios.Where(p=>p.EmailUsu==correo && p.PasswordUsu ==clave)
                .FirstOrDefaultAsync();

            return usuario_encontrado;
        }

        public async Task<TbUsuario> SavetbUsuario(TbUsuario modelo)
        {

            _dbContext.TbUsuarios.Add(modelo);
            await _dbContext.SaveChangesAsync();
            return modelo;
        }
    }
}
