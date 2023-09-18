using System;
using System.Collections.Generic;

namespace proyecto2023.Models;

public partial class TbOrden
{
    public int IdOrden { get; set; }

    public int? IdUsu { get; set; }

    public int? IdPago { get; set; }

    public decimal? Total { get; set; }

    public int? IdDomi { get; set; }

    public DateTime? FechaOrden { get; set; }

    public virtual TbDomicilio? IdDomiNavigation { get; set; }

    public virtual TbMetodoPago? IdPagoNavigation { get; set; }

    public virtual TbUsuario? IdUsuNavigation { get; set; }

    public virtual ICollection<TbDetalleOrden> TbDetalleOrdens { get; set; } = new List<TbDetalleOrden>();
}
