using Microsoft.CodeAnalysis.CSharp.Syntax;
using Microsoft.EntityFrameworkCore;
using proyecto2023.Models;

namespace proyecto2023.Servicios.Contrato
{
    public interface IUsuarioService
    {

        Task<TbUsuario> GetTbUsuario(string correo,string clave);

        Task<TbUsuario> SavetbUsuario(TbUsuario modelo);

        


       

    }
}
