using System;
using System.Collections.Generic;

namespace proyecto2023.Models;

public partial class TbDomicilio
{
    public int IdDomi { get; set; }

    public int? IdUsu { get; set; }

    public string? DepartamentoDomi { get; set; }

    public string? ProvinciaDomi { get; set; }

    public string? DistritoDomi { get; set; }

    public string? PaisDomi { get; set; }

    public virtual TbUsuario? IdUsuNavigation { get; set; }

    public virtual ICollection<TbOrden> TbOrdens { get; set; } = new List<TbOrden>();
}
