using System;
using System.Collections.Generic;

namespace proyecto2023.Models;

public partial class TbMetodoPago
{
    public int IdPago { get; set; }

    public string? NombrePago { get; set; }

    public virtual ICollection<TbOrden> TbOrdens { get; set; } = new List<TbOrden>();
}
