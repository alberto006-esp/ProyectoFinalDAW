window.onload = iniciar;
function iniciar() {
    const inputs = document.querySelectorAll('input.cantidadArticulo');
    let preciosUnitarios = document.querySelectorAll('input.precioUnitario');
    /*inputs.array.forEach(element =>  {
     inputs.addEventListener('change',calcularTotal,true);
     });*/
    //let cantidadesAntesCambio = inputs;
    for (let x = 0; x < inputs.length; x++) {
       //inputs[x].addEventListener('load', calcularTotal, true);
        inputs[x].addEventListener('change', calcularTotal, true); 
    }
    function calcularTotal() {
        let cantidades = document.querySelectorAll('input.cantidadArticulo');
        let precios = document.querySelectorAll('input.precioFinal');
        let precioTotal = 0;
        let precio;
        let precioUnitario;
        let cantidad;
        let cantidadAntesCambio;
        let precioFinalPorProducto;
        for (let x = 0; x < cantidades.length; x++) {
            precio = Number(precios[x].value);
            cantidad = Number(cantidades[x].value);
            cantidadAntesCambio = Number(inputs[x].value);
            precioUnitario = Number(preciosUnitarios[x].value);;
            precioFinalPorProducto = precioUnitario * cantidad;
            precioFinalPorProducto = Math.round(precioFinalPorProducto * 100.0) / 100.0;
            document.getElementById("precioFinalProducto" + x).innerHTML = precioFinalPorProducto + "€";
            precioTotal += precioFinalPorProducto;
        }
        precioTotal = Math.round(precioTotal * 100.0) / 100.0;
        document.getElementById("precioTotal").innerHTML = precioTotal + "€";
    }

}