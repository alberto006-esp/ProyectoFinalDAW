window.onload=iniciar;
function iniciar() {
    const inputs=document.querySelectorAll('input.cantidadArticulo');
    /*inputs.array.forEach(element =>  {
        inputs.addEventListener('change',calcularTotal,true);
    });*/
    for (let x = 0; x < inputs.length; x++) {
        inputs[x].addEventListener('change',calcularTotal,true);
        
    }
    function calcularTotal() {
        let cantidades=document.querySelectorAll('input.cantidadArticulo');
        let precios=document.querySelectorAll('input.precioFinal');
        let precioTotal=0;
        let precio;
        let cantidad;
        for (let x = 0; x < cantidades.length; x++) {
           precio=Number(precios[x].value);cantidad=Number(cantidades[x].value);
           precioTotal+=precio*cantidad;
        }
        precioTotal = Math.round(precioTotal * 100.0) / 100.0;
        document.getElementById("precioTotal").innerHTML=precioTotal+"€";
    }

}