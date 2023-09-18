using System;
using System.Collections.Generic;

namespace proyecto2023.Models;

public partial class TbPermiso
{
    public int IdPermiso { get; set; }

    public int? IdRol { get; set; }

    public int? IdMenuEmpre { get; set; }

    public virtual TbMenuEmpresarial? IdMenuEmpreNavigation { get; set; }

    public virtual TbRol? IdRolNavigation { get; set; }
}
