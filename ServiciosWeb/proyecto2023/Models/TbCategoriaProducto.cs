using System;
using System.Collections.Generic;

namespace proyecto2023.Models;

public partial class TbCategoriaProducto
{
    public int IdCategoria { get; set; }

    public string? DescripcionCate { get; set; }

    public DateTime? FechaRegistroCate { get; set; }

    public virtual ICollection<TbProducto> TbProductos { get; set; } = new List<TbProducto>();
}
