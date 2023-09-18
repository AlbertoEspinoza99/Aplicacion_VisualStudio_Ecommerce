using System;
using System.Collections.Generic;

namespace proyecto2023.Models;

public partial class TbSubmenuEmpresarial
{
    public int IdSubmenuEmpre { get; set; }

    public int? IdMenuEmpre { get; set; }

    public string? DesSubmenuEmpre { get; set; }

    public string? UrlSubmenuEmpre { get; set; }

    public virtual TbMenuEmpresarial? IdMenuEmpreNavigation { get; set; }
}
