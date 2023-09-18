using System;
using System.Collections.Generic;

namespace proyecto2023.Models;

public partial class TbProducto
{
    public int IdProducto { get; set; }

    public string? NombreProd { get; set; }

    public string? MarcaProd { get; set; }

    public decimal? PrecioProd { get; set; }

    public int? IdCategoria { get; set; }

    public string? ImgProd { get; set; }

    public int? StockProd { get; set; }

    public virtual TbCategoriaProducto? IdCategoriaNavigation { get; set; }

    public virtual ICollection<TbCarrito> TbCarritos { get; set; } = new List<TbCarrito>();

    public virtual ICollection<TbDetalleOrden> TbDetalleOrdens { get; set; } = new List<TbDetalleOrden>();
}
