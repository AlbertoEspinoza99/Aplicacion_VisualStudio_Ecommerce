$(function () {

    $("#incremento").on("click", function (event) {

        event.preventDefault();
        var ProductoId = $(this).parent().parent().find("input").val();
        var cantidad = 1;


        $.ajax(

            {

                url: "@Url.Action("AgregarCarrito","Carrito")",
                data: { idProducto: ProductoId, cantidad: cantidad },
                type: "post",
                success: function (response) {
                    window.location.href = "@Url.Action("AgregarCarrito","Carrito")";
                },
                error: function (err, error) {
                    alert(error);
                }


            }

        );



    });




});