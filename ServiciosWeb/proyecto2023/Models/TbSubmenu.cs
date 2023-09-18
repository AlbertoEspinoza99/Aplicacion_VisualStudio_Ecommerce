using System;
using System.Collections.Generic;

namespace proyecto2023.Models;

public partial class TbSubmenu
{
    public int IdSubmenu { get; set; }

    public int IdMenu { get; set; }

    public string DesSubmene { get; set; } = null!;

    public string UrlSubmenu { get; set; } = null!;

    public virtual TbMenu IdMenuNavigation { get; set; } = null!;
}
