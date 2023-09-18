using System;
using System.Collections.Generic;

namespace proyecto2023.Models;

public partial class TbRol
{
    public int IdRol { get; set; }

    public string? NombreRol { get; set; }

    public int? ActivarRol { get; set; }

    public DateTime? FechaRegistroRol { get; set; }

    public virtual ICollection<TbPermiso> TbPermisos { get; set; } = new List<TbPermiso>();

    public virtual ICollection<TbUsuario> TbUsuarios { get; set; } = new List<TbUsuario>();
}
