using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace proyecto2023.Models;

public partial class ProyectoServiciosWeb2023Context : DbContext
{
    public ProyectoServiciosWeb2023Context()
    {
    }

    public ProyectoServiciosWeb2023Context(DbContextOptions<ProyectoServiciosWeb2023Context> options)
        : base(options)
    {
    }

    public virtual DbSet<TbCarrito> TbCarritos { get; set; }

    public virtual DbSet<TbCategoriaProducto> TbCategoriaProductos { get; set; }

    public virtual DbSet<TbDetalleOrden> TbDetalleOrdens { get; set; }

    public virtual DbSet<TbDomicilio> TbDomicilios { get; set; }

    public virtual DbSet<TbMenu> TbMenus { get; set; }

    public virtual DbSet<TbMenuEmpresarial> TbMenuEmpresarials { get; set; }

    public virtual DbSet<TbMetodoPago> TbMetodoPagos { get; set; }

    public virtual DbSet<TbOrden> TbOrdens { get; set; }

    public virtual DbSet<TbPermiso> TbPermisos { get; set; }

    public virtual DbSet<TbProducto> TbProductos { get; set; }

    public virtual DbSet<TbRol> TbRols { get; set; }

    public virtual DbSet<TbSubmenu> TbSubmenus { get; set; }

    public virtual DbSet<TbSubmenuEmpresarial> TbSubmenuEmpresarials { get; set; }

    public virtual DbSet<TbUsuario> TbUsuarios { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder) { }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<TbCarrito>(entity =>
        {
            entity.HasKey(e => e.IdCarrito).HasName("PK__tb_carri__83A2AD9CEAB895D5");

            entity.ToTable("tb_carrito");

            entity.Property(e => e.IdCarrito).HasColumnName("id_carrito");
            entity.Property(e => e.Cantidad).HasColumnName("cantidad");
            entity.Property(e => e.IdProducto).HasColumnName("id_producto");
            entity.Property(e => e.IdUsu).HasColumnName("id_usu");

            entity.HasOne(d => d.IdProductoNavigation).WithMany(p => p.TbCarritos)
                .HasForeignKey(d => d.IdProducto)
                .HasConstraintName("FK__tb_carrit__id_pr__2A4B4B5E");

            entity.HasOne(d => d.IdUsuNavigation).WithMany(p => p.TbCarritos)
                .HasForeignKey(d => d.IdUsu)
                .HasConstraintName("FK__tb_carrit__id_us__29572725");
        });

        modelBuilder.Entity<TbCategoriaProducto>(entity =>
        {
            entity.HasKey(e => e.IdCategoria).HasName("PK__tb_categ__CD54BC5AAA60E19E");

            entity.ToTable("tb_categoriaProducto");

            entity.Property(e => e.IdCategoria).HasColumnName("id_categoria");
            entity.Property(e => e.DescripcionCate)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("descripcion_cate");
            entity.Property(e => e.FechaRegistroCate)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("fechaRegistro_cate");
        });

        modelBuilder.Entity<TbDetalleOrden>(entity =>
        {
            entity.HasKey(e => e.IdDetalle).HasName("PK__tb_detal__4F1332DEB566E385");

            entity.ToTable("tb_detalleOrden");

            entity.Property(e => e.IdDetalle).HasColumnName("id_detalle");
            entity.Property(e => e.CantidadDetalle).HasColumnName("cantidad_detalle");
            entity.Property(e => e.FechaDetalle)
                .HasColumnType("datetime")
                .HasColumnName("fechaDetalle");
            entity.Property(e => e.IdOrden).HasColumnName("id_orden");
            entity.Property(e => e.IdProducto).HasColumnName("id_producto");
            entity.Property(e => e.PrecioDetalle)
                .HasColumnType("decimal(10, 2)")
                .HasColumnName("precio_detalle");

            entity.HasOne(d => d.IdOrdenNavigation).WithMany(p => p.TbDetalleOrdens)
                .HasForeignKey(d => d.IdOrden)
                .HasConstraintName("FK__tb_detall__preci__4222D4EF");

            entity.HasOne(d => d.IdProductoNavigation).WithMany(p => p.TbDetalleOrdens)
                .HasForeignKey(d => d.IdProducto)
                .HasConstraintName("FK__tb_detall__id_pr__4316F928");
        });

        modelBuilder.Entity<TbDomicilio>(entity =>
        {
            entity.HasKey(e => e.IdDomi).HasName("PK__tb_domic__9D8B15D8770B0D17");

            entity.ToTable("tb_domicilio");

            entity.Property(e => e.IdDomi).HasColumnName("id_domi");
            entity.Property(e => e.DepartamentoDomi)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("departamento_domi");
            entity.Property(e => e.DistritoDomi)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("distrito_domi");
            entity.Property(e => e.IdUsu).HasColumnName("id_usu");
            entity.Property(e => e.PaisDomi)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("pais_domi");
            entity.Property(e => e.ProvinciaDomi)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("provincia_domi");

            entity.HasOne(d => d.IdUsuNavigation).WithMany(p => p.TbDomicilios)
                .HasForeignKey(d => d.IdUsu)
                .HasConstraintName("FK__tb_domici__id_us__37A5467C");
        });

        modelBuilder.Entity<TbMenu>(entity =>
        {
            entity.HasKey(e => e.IdMenu).HasName("PK__tb_menu__68A1D9DB0BAE1C25");

            entity.ToTable("tb_menu");

            entity.Property(e => e.IdMenu).HasColumnName("id_menu");
            entity.Property(e => e.DescribcionMenu)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("describcion_menu");
            entity.Property(e => e.UrlMenu)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("url_menu");
        });

        modelBuilder.Entity<TbMenuEmpresarial>(entity =>
        {
            entity.HasKey(e => e.IdMenuEmpre).HasName("PK__tb_menuE__A34E07D609535D8F");

            entity.ToTable("tb_menuEmpresarial");

            entity.Property(e => e.IdMenuEmpre).HasColumnName("id_menuEmpre");
            entity.Property(e => e.DescribcionMenuEmpre)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("describcion_menuEmpre");
            entity.Property(e => e.UrlMenuEmpre)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("url_menuEmpre");
        });

        modelBuilder.Entity<TbMetodoPago>(entity =>
        {
            entity.HasKey(e => e.IdPago).HasName("PK__tb_metod__0941B0744509EB9E");

            entity.ToTable("tb_metodoPago");

            entity.Property(e => e.IdPago).HasColumnName("id_pago");
            entity.Property(e => e.NombrePago)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("nombre_pago");
        });

        modelBuilder.Entity<TbOrden>(entity =>
        {
            entity.HasKey(e => e.IdOrden).HasName("PK__tb_orden__DD5B8F33E0DDDCB1");

            entity.ToTable("tb_orden");

            entity.Property(e => e.IdOrden).HasColumnName("id_orden");
            entity.Property(e => e.FechaOrden)
                .HasColumnType("datetime")
                .HasColumnName("fechaOrden");
            entity.Property(e => e.IdDomi).HasColumnName("id_domi");
            entity.Property(e => e.IdPago).HasColumnName("id_pago");
            entity.Property(e => e.IdUsu).HasColumnName("id_usu");
            entity.Property(e => e.Total)
                .HasColumnType("decimal(10, 2)")
                .HasColumnName("total");

            entity.HasOne(d => d.IdDomiNavigation).WithMany(p => p.TbOrdens)
                .HasForeignKey(d => d.IdDomi)
                .HasConstraintName("FK__tb_orden__id_dom__3F466844");

            entity.HasOne(d => d.IdPagoNavigation).WithMany(p => p.TbOrdens)
                .HasForeignKey(d => d.IdPago)
                .HasConstraintName("FK__tb_orden__id_pag__3E52440B");

            entity.HasOne(d => d.IdUsuNavigation).WithMany(p => p.TbOrdens)
                .HasForeignKey(d => d.IdUsu)
                .HasConstraintName("FK__tb_orden__id_usu__3D5E1FD2");
        });

        modelBuilder.Entity<TbPermiso>(entity =>
        {
            entity.HasKey(e => e.IdPermiso).HasName("PK__tb_permi__228F224F7478E8BE");

            entity.ToTable("tb_permisos");

            entity.Property(e => e.IdPermiso).HasColumnName("id_permiso");
            entity.Property(e => e.IdMenuEmpre).HasColumnName("id_menuEmpre");
            entity.Property(e => e.IdRol).HasColumnName("id_rol");

            entity.HasOne(d => d.IdMenuEmpreNavigation).WithMany(p => p.TbPermisos)
                .HasForeignKey(d => d.IdMenuEmpre)
                .HasConstraintName("FK_tb_permisos_tb_menuEmpresarial");

            entity.HasOne(d => d.IdRolNavigation).WithMany(p => p.TbPermisos)
                .HasForeignKey(d => d.IdRol)
                .HasConstraintName("FK__tb_permis__id_ro__571DF1D5");
        });

        modelBuilder.Entity<TbProducto>(entity =>
        {
            entity.HasKey(e => e.IdProducto).HasName("PK__tb_produ__FF341C0DBBE1083E");

            entity.ToTable("tb_producto");

            entity.Property(e => e.IdProducto).HasColumnName("id_producto");
            entity.Property(e => e.IdCategoria).HasColumnName("id_categoria");
            entity.Property(e => e.ImgProd)
                .HasMaxLength(300)
                .IsUnicode(false)
                .HasColumnName("img_prod");
            entity.Property(e => e.MarcaProd)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("marca_prod");
            entity.Property(e => e.NombreProd)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("nombre_prod");
            entity.Property(e => e.PrecioProd)
                .HasColumnType("decimal(10, 2)")
                .HasColumnName("precio_prod");
            entity.Property(e => e.StockProd).HasColumnName("stock_prod");

            entity.HasOne(d => d.IdCategoriaNavigation).WithMany(p => p.TbProductos)
                .HasForeignKey(d => d.IdCategoria)
                .HasConstraintName("FK_tb_producto_tb_categoriaProducto");
        });

        modelBuilder.Entity<TbRol>(entity =>
        {
            entity.HasKey(e => e.IdRol).HasName("PK__tb_rol__6ABCB5E0F830F1FD");

            entity.ToTable("tb_rol");

            entity.Property(e => e.IdRol).HasColumnName("id_rol");
            entity.Property(e => e.ActivarRol).HasColumnName("activar_rol");
            entity.Property(e => e.FechaRegistroRol)
                .HasDefaultValueSql("(getdate())")
                .HasColumnType("datetime")
                .HasColumnName("fechaRegistro_rol");
            entity.Property(e => e.NombreRol)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("nombre_rol");
        });

        modelBuilder.Entity<TbSubmenu>(entity =>
        {
            entity.HasKey(e => e.IdSubmenu).HasName("PK__tb_subme__A41C30182A4BFA13");

            entity.ToTable("tb_submenu");

            entity.Property(e => e.IdSubmenu).HasColumnName("id_submenu");
            entity.Property(e => e.DesSubmene)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("des_submene");
            entity.Property(e => e.IdMenu).HasColumnName("id_menu");
            entity.Property(e => e.UrlSubmenu)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("url_submenu");

            entity.HasOne(d => d.IdMenuNavigation).WithMany(p => p.TbSubmenus)
                .HasForeignKey(d => d.IdMenu)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK__tb_submen__id_me__7E37BEF6");
        });

        modelBuilder.Entity<TbSubmenuEmpresarial>(entity =>
        {
            entity.HasKey(e => e.IdSubmenuEmpre).HasName("PK__tb_subme__7B0E6E4496DD3EBE");

            entity.ToTable("tb_submenuEmpresarial");

            entity.Property(e => e.IdSubmenuEmpre).HasColumnName("id_submenuEmpre");
            entity.Property(e => e.DesSubmenuEmpre)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("des_submenuEmpre");
            entity.Property(e => e.IdMenuEmpre).HasColumnName("id_menuEmpre");
            entity.Property(e => e.UrlSubmenuEmpre)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("url_submenuEmpre");

            entity.HasOne(d => d.IdMenuEmpreNavigation).WithMany(p => p.TbSubmenuEmpresarials)
                .HasForeignKey(d => d.IdMenuEmpre)
                .HasConstraintName("FK__tb_submen__id_me__72C60C4A");
        });

        modelBuilder.Entity<TbUsuario>(entity =>
        {
            entity.HasKey(e => e.IdUsu).HasName("PK__tb_Usuar__6AE80FBB0942091A");

            entity.ToTable("tb_Usuario");

            entity.Property(e => e.IdUsu).HasColumnName("id_usu");
            entity.Property(e => e.ApellidoUsu)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("apellido_usu");
            entity.Property(e => e.EmailUsu)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("email_usu");
            entity.Property(e => e.EstadoUsu)
                .HasMaxLength(20)
                .IsUnicode(false)
                .HasColumnName("estado_usu");
            entity.Property(e => e.IdRol).HasColumnName("id_rol");
            entity.Property(e => e.NombreUsu)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("nombre_usu");
            entity.Property(e => e.NuevoUsuarioUsu).HasColumnName("nuevoUsuario_usu");
            entity.Property(e => e.PasswordUsu)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("password_usu");
            entity.Property(e => e.UsuarioUsu)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("usuario_usu");

            entity.HasOne(d => d.IdRolNavigation).WithMany(p => p.TbUsuarios)
                .HasForeignKey(d => d.IdRol)
                .HasConstraintName("FK_tb_Usuario_tb_rol");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
