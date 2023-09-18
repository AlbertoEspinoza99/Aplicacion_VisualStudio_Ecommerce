using Microsoft.EntityFrameworkCore;
using proyecto2023.Models;
using proyecto2023.Servicios.Contrato;
using proyecto2023.Servicios.Implementacion;

using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;





//FIN esto es para los reportes 

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

builder.Services.AddDbContext<ProyectoServiciosWeb2023Context>(options => {
    options.UseSqlServer(builder.Configuration.GetConnectionString("cadenaSQL"));
 });

builder.Services.AddScoped<IUsuarioService,UsuarioService>();

builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
.AddCookie(options =>
{

    options.LoginPath = "/Inicio/IniciarSesion";
    options.ExpireTimeSpan = TimeSpan.FromMinutes(20);

});

builder.Services.AddControllersWithViews(options =>
{
    options.Filters.Add(

        new ResponseCacheAttribute
        {
            NoStore = true,
            Location=ResponseCacheLocation.None,
        }


        );


});


//Session

builder.Services.AddHttpContextAccessor();

builder.Services.AddSession(options =>
{

    options.IdleTimeout = TimeSpan.FromSeconds(120);
    options.Cookie.HttpOnly= true;
    options.Cookie.IsEssential=true;


});







var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseSession();

app.UseAuthentication();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Menu}/{action=MenuPorUsuario}/{id?}");

app.Run();
