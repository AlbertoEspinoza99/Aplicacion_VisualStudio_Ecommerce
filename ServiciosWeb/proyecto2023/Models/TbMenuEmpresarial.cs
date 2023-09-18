using System;
using System.Collections.Generic;

namespace proyecto2023.Models;

public partial class TbMenuEmpresarial
{
    public int IdMenuEmpre { get; set; }

    public string? DescribcionMenuEmpre { get; set; }

    public string? UrlMenuEmpre { get; set; }

    public virtual ICollection<TbPermiso> TbPermisos { get; set; } = new List<TbPermiso>();

    public virtual ICollection<TbSubmenuEmpresarial> TbSubmenuEmpresarials { get; set; } = new List<TbSubmenuEmpresarial>();
}
