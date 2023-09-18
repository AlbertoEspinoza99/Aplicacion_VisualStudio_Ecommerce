using System;
using System.Collections.Generic;

namespace proyecto2023.Models;

public partial class TbMenu
{
    public int IdMenu { get; set; }

    public string DescribcionMenu { get; set; } = null!;

    public string UrlMenu { get; set; } = null!;

    public virtual ICollection<TbSubmenu> TbSubmenus { get; set; } = new List<TbSubmenu>();
}
