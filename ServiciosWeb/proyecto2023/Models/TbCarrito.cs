using System;
using System.Collections.Generic;

namespace proyecto2023.Models;

public partial class TbCarrito
{
    public int IdCarrito { get; set; }

    public int? IdUsu { get; set; }

    public int? IdProducto { get; set; }

    public int? Cantidad { get; set; }

    public virtual TbProducto? IdProductoNavigation { get; set; }

    public virtual TbUsuario? IdUsuNavigation { get; set; }
    public TbCarrito()
    {

    }

    public TbCarrito(TbUsuario IdUsuario, TbProducto Idproducto, int cantidad)
    {
        IdUsu = IdUsuario.IdUsu;
        IdProducto = Idproducto.IdProducto;
        Cantidad = cantidad;


    }

}
