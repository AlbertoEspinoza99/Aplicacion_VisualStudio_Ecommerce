using System;
using System.Collections.Generic;

namespace proyecto2023.Models;

public partial class TbDetalleOrden
{
    public int IdDetalle { get; set; }

    public int? IdOrden { get; set; }

    public int? IdProducto { get; set; }

    public int? CantidadDetalle { get; set; }

    public decimal? PrecioDetalle { get; set; }

    public DateTime? FechaDetalle { get; set; }

    public virtual TbOrden? IdOrdenNavigation { get; set; }

    public virtual TbProducto? IdProductoNavigation { get; set; }
}
