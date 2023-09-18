using System;
using System.Collections.Generic;

namespace proyecto2023.Models;

public partial class TbUsuario
{
    public int IdUsu { get; set; }

    public string? EmailUsu { get; set; }

    public string? PasswordUsu { get; set; }

    public string? NombreUsu { get; set; }

    public string? ApellidoUsu { get; set; }

    public string? EstadoUsu { get; set; }

    public string? UsuarioUsu { get; set; }

    public int? IdRol { get; set; }

    public int? NuevoUsuarioUsu { get; set; }

    public virtual TbRol? IdRolNavigation { get; set; }

    public virtual ICollection<TbCarrito> TbCarritos { get; set; } = new List<TbCarrito>();

    public virtual ICollection<TbDomicilio> TbDomicilios { get; set; } = new List<TbDomicilio>();

    public virtual ICollection<TbOrden> TbOrdens { get; set; } = new List<TbOrden>();
}
