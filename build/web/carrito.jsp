<%-- 
    Document   : carrito
    Created on : 5 ene. 2022, 15:35:31
    Author     : alber
--%>

<%@page import="Db.BDD"%>
<%@page import="modelo.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Electro Master Carrito</title>

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min_1.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>
        <!-- HEADER -->
        <header>
            <%

                HttpSession sesion = request.getSession();

                String usuario = (String) sesion.getAttribute("usuario");

                /*if(usuario == null){

       RequestDispatcher rd;
       ServletContext contexto = getServletContext();
       rd= contexto.getRequestDispatcher("/index.html");
       rd.forward(request, response);
       }*/
                if (usuario == null)
                    usuario = "invitado";
            %>
            <!-- TOP HEADER -->
            <div id="top-header">
                <div class="container">
                    <ul class="header-links pull-left" style="color: white">
                        <li><i class="fa fa-phone"></i> 956-36-85-16</li>
                        <li><i class="fa fa-envelope-o"></i> electro_master@gmail.com</a></li>
                        <li><i class="fa fa-map-marker"></i>Cl. Banda Playa, 65, 11540 Sanl??car de Barrameda, C??diz</li>
                    </ul>
                    <ul class="header-links pull-right" style="color: white">
                        <li><i class="fa fa-euro"></i> Euros</li>

                        <li><i class="fa fa-user-o"></i> <%=usuario%></li>
                            <%if (usuario.equals("invitado")) {%>
                        <li><a href="index.html"><i class="fa fa-sign-out"></i>Iniciar Sesion/Registrarse</a></li>        
                            <%} else {%>
                        <li><a href="controlCerrarSesion"><i class="fa fa-sign-in"></i>Cerrar Sesion</a></li>
                        <%}%>
                    </ul>
                </div>
            </div>
            <!-- /TOP HEADER -->

            <!-- MAIN HEADER -->
            <div id="header">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <!-- LOGO -->
                        <div class="col-md-3">
                            <div class="header-logo">
                                <a href="store.jsp" class="logo">
                                    <img src="img/logo11.png" width="220px" height="60px" alt="Imagen no disponible">
                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->

                        <!-- SEARCH BAR -->
                        <div class="col-md-6">
                            <div class="header-search">
                                <form action="controlBusqueda" method="post">
                                    <select name="selectCategorias" class="input-select">
                                        <option value="all">Todos los productos</option>
                                        <option value="portatiles">Port??tiles</option>
                                        <option value="smartphones">Smartphones</option>
                                        <option value="camaras">C??maras</option>
                                        <option value="tablets">Tablets</option>
                                        <option value="auriculares">Auriculares</option>
                                    </select>
                                    <input type="text" name="busquedaProductos" class="input" placeholder="Busca aqui">
                                    <button type="submit" class="search-btn">Buscar</button>
                                </form>
                            </div>
                        </div>
                        <!-- /SEARCH BAR -->

                        <!-- ACCOUNT -->
                        <div class="col-md-3 clearfix">
                            <div class="header-ctn">
                               <% if (!usuario.equals("invitado")) {%>
                                <div class="dropdown">
                                    <a href="miCuenta.jsp">
                                        <!--<i class="bi bi-person"></i>-->
                                        <svg xmlns="http://www.w3.or<!--g/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
                                        <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
                                        </svg><br>
                                        <span>Mi cuenta</span>
                                    </a>
                                </div>
                                <%}%>
                                <!-- Menu Toogle -->
                                <div class="menu-toggle">
                                    <a href="#">
                                        <i class="fa fa-bars"></i>
                                        <span>Menu</span>
                                    </a>
                                </div>
                                <!-- /Menu Toogle -->
                            </div>
                        </div>
                        <!-- /ACCOUNT -->
                    </div>
                    <!-- row -->
                </div>
                <!-- container -->
            </div>
            <!-- /MAIN HEADER -->
        </header>
        <!-- /HEADER -->

        <!-- NAVIGATION -->
        <nav id="navigation">
            <!-- container -->
            <div class="container">
                <!-- responsive-nav -->
                <div id="responsive-nav">
                    <!-- NAV -->
                    <ul class="main-nav nav navbar-nav">
                        <li><a href="store.jsp">Home</a></li>
                        <li><a href="controlOfertas">Ofertas</a></li>
                        <li><a href="controlCategoria?categoria=portatiles">Port??tiles</a></li>
                        <li><a href="controlCategoria?categoria=smartphones">Smartphones</a></li>
                        <li><a href="controlCategoria?categoria=camaras">C??maras</a></li>
                        <li><a href="controlCategoria?categoria=tablets">Tablets</a></li>
                        <li><a href="controlCategoria?categoria=auriculares">Auriculares</a></li>
                    </ul>
                    <!-- /NAV -->
                </div>
                <!-- /responsive-nav -->
            </div>
            <!-- /container -->
        </nav>
        <!-- /NAVIGATION -->

        <!-- BREADCRUMB -->
        <div id="breadcrumb" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <h3 class="breadcrumb-header">Carrito</h3>
                        <ul class="breadcrumb-tree">
                            <li>Home</li>
                            <li class="active">Carrito</li>
                        </ul>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /BREADCRUMB -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <div class="col-md-7">
                        <!-- Billing Details -->
                        <div class="billing-details">

                            <% String nombreUsuario = (String) sesion.getAttribute("usuario");
                                if (nombreUsuario != null) {
                                    Usuario usu = BDD.buscarDatosUsuario(nombreUsuario);
                            %>
                            <div class="section-title">
                                <h3 class="title">Datos usuario</h3>
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" name="first-name" value="<%=usu.getNombre()%>" readonly="true">
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" name="last-name" value="<%= usu.getApellidos()%>" readonly="true">
                            </div>
                            <div class="form-group">
                                <input class="input" type="email" name="email" value="<%= usu.getEmail()%>" readonly="true">
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" name="address" value="<%= usu.getDireccion()%>" readonly="true">
                            </div>
                            <div class="form-group">
                                <input class="input" type="tel" name="tel" value="<%= usu.getTelefono()%>" readonly="true">
                            </div>
                            <%} else {%>
                            <div class="section-title">
                                <h3 class="title">Registrarse</h3>
                                <p>??A??n no te has registrado? Introduce tus datos para unirte a la familia <b>ELECTRO MASTER</b>.</p>
                            </div>
                            <form action="controlRegistro" method="post">
                                <div class="form-group">
                                    <label for="nombre">Nombre:</label>
                                    <input class="input" name="nombre" type="text" pattern="[A-Z????a-z????????????????????\s]{1,15}" required >
                                </div>
                                <div class="form-group">
                                    <label for="apellidos">Apellidos:</label>
                                    <input class="input" name="apellidos" type="text" pattern="[A-Z????a-z????????????????????\s]{1,15}" required>
                                </div>
                                <div class="form-group">
                                    <label for="usuario">Usuario:</label>
                                    <input class="input" name="usuario" type="text" pattern="\S{8,16}" required>
                                </div>
                                <div class="form-group">
                                    <label for="email">Email:</label>
                                    <input class="input" name="email" type="email" pattern="[a-zA-Z0-9!#$%&'*_+-]([\.]?[a-zA-Z0-9!#$%&'*_+-])+@[a-zA-Z0-9]([^@&%$\/()=???!.,:;]|\d)+[a-zA-Z0-9][\.][a-zA-Z]{2,4}([\.][a-zA-Z]{2})?"  required>
                                </div>
                                <div class="form-group">
                                    <label for="pass">Contrase??a: <strong style="font-style: italic;font-size: x-small">(la contrase??a debe tener al menos 8 caracteres, un n??mero, una may??scula y un car??cter especial)</strong></label>
                                    <input class="input" name="pass" type="password" pattern="(?=.*\d)(?=.*[!#$%&'()*+,-./:;<=>?@[\]^_`{|}~??!??])(?=.*[A-Z])(?=.*[a-z])\S{8,16}" required>
                                </div>
                                <div class="form-group">
                                    <label for="RePass"> Repetir contrase??a:</label>
                                    <input class="input" name="RePass" type="password" pattern="(?=.*\d)(?=.*[!#$%&'()*+,-./:;<=>?@[\]^_`{|}~??!??])(?=.*[A-Z])(?=.*[a-z])\S{8,16}" required>
                                </div>
                                <div class="form-group">
                                    <label for="direccion">Direcci??n:</label>
                                    <input class="input" name="direccion" type="text" required>
                                </div>
                                <div class="form-group">
                                    <label for="telefono">Tel??fono:</label>
                                    <input class="input" name="telefono" type="text" pattern="[\d]{9}" required>
                                </div>
                                <div class="form-group">
                                    <input class="primary-btn order-submit" style="width: 50%" name="registrarse" value="Registrarse" type="submit"><a href="index.html" style="width: 50%" class="primary-btn order-submit">Iniciar Sesi??n</a>
                                </div>
                            </form>
                            <%}%>
                        </div>
                        <!-- /Billing Details -->

                        <!-- Shiping Details -->

                        <!-- /Shiping Details -->

                        <!-- Order notes -->
                        <!-- /Order notes -->
                    </div>
                    <%  ServletContext contexto = getServletContext();
                        List<Producto> listaCarrito = (List<Producto>) contexto.getAttribute("listaCarrito");
                        if (listaCarrito == null) {//si entramos al carrito sin a??adir ni borrar ningun alrticulo me saltaba un error pq la lista no estaba vacia sino que era 
                            listaCarrito = new ArrayList<Producto>();//null puesto que no se crea el atributo listaCarrito si no entramos en los controladores de a??adir o borrar.
                        }
                    %>

                    <!-- Order Details -->
                    <form action="controlPedidos" method="post">
                        <div class="col-md-5 order-details">
                            <div class="section-title text-center">
                                <h3 class="title">Tu Carrito</h3>
                            </div>
                            <div class="order-summary">

                                <%  double precioUnitario = 0;
                                    double precioFinal = 0;
                                    double precioTotal = 0;
                                    if (listaCarrito.isEmpty()) {%>
                                <p class="product-name"><strong>CARRITO VACIO</strong></p> 
                                <% } else {%>
                                <div class="order-col">
                                    <div><strong>PRODUCTOS</strong></div>
                                    <div><strong>PRECIO</strong></div>
                                </div>
                                <div class="order-products">
                                    <%  int arrayCantidades[] = new int[listaCarrito.size()];
                                        String arrayNombres[] = new String[listaCarrito.size()];
                                        int cont = 0;
                                        for (Producto pro : listaCarrito) {
                                            precioUnitario = pro.getPrecio() - (pro.getPrecio() * pro.getDescuento());
                                            precioFinal = (pro.getPrecio() - (pro.getPrecio() * pro.getDescuento())) * pro.getCantidad();
                                            precioFinal=Math.round(precioFinal*100.0)/100.0;
                                            precioTotal += precioFinal;

                                    %>

                                    <div class="order-col">
                                        <!--<button type="submit" class="delete"><i class="fa fa-close"></i></button>-->
                                        <div><a href="borrarArtCarritoFinal?nombreProductoBorrar=<%=pro.getNombre()%>" class="delete" style="margin-right: 2%"><i class="fa fa-close"></i></a><input type="number" class="cantidadArticulo" name="<%=pro.getNombre()%>" value="<%=pro.getCantidad()%>" size="3" min="1"> <%=pro.getNombre()%></div>
                                        <div><h5 id="precioFinalProducto<%=cont%>" style="margin-left: 40%"><%=precioFinal%>???</h5></div>
                                        <input type="number" hidden="true" name="name" class="precioFinal" value="<%=precioFinal%>">
                                        <input type="number" hidden="true" name="precioUnitario" class="precioUnitario" value="<%=precioUnitario%>">
                                    </div>
                                    <%
                                            arrayCantidades[cont] = pro.getCantidad();//hay que arreglar el envio del parametro de arrayCantidades.
                                            arrayNombres[cont] = pro.getNombre();
                                            cont++;
                                        }%>
                                </div>

                                <div class="order-col">

                                    <div>Gastos de Env??o</div>                              
                                    <div><strong>GRATIS</strong></div>     
                                </div>
                                <%}%>    
                                <div class="order-col">
                                    <div><strong>TOTAL</strong></div>
                                    <% precioTotal = Math.round(precioTotal * 100.0) / 100.0;%>
                                    <div><strong id="precioTotal" class="order-total"><%=precioTotal%>???</strong></div>
                                </div>

                            </div>
                            <div class="payment-method">
                                <div class="input-radio">
                                    <input type="radio" name="payment" id="payment-1" checked="true">
                                    <label for="payment-1">
                                        <span></span>
                                        Transferencia Bancaria
                                    </label>
                                    <div class="caption">
                                        <p>El pago se realizar?? a trav??s de una cuenta bancaria.</p>
                                    </div>
                                </div>
                                <div class="input-radio">
                                    <input type="radio" name="payment" id="payment-2">
                                    <label for="payment-2">
                                        <span></span>
                                        Tarjeta
                                    </label>
                                    <div class="caption">
                                        <p>El pago se realizar?? con una tarjeta aportada por el usuario.</p>
                                    </div>
                                </div>
                                <div class="input-radio">
                                    <input type="radio" name="payment" id="payment-3">
                                    <label for="payment-3">
                                        <span></span>
                                        Paypal
                                    </label>
                                    <div class="caption">
                                        <p>El pago se realizar?? con una cuenta Paypal.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="input-checkbox">
                                <input type="checkbox" id="terms" checked="true" required="true" title="Debes aceptar los t??rminos y condiciones" data-error="Debes aceptar los t??rminos y condiciones">
                                <label for="terms">
                                    <span></span>
                                    <p>He le??do y acepto los t??rminos y condiciones.</p>
                                </label>
                            </div>
                            <%if (listaCarrito.isEmpty()) {%>       
                            <%} else {
                                if (usuario.equals("invitado")) {%>
                                <h3 class="alert-danger"><b>??Debes iniciar sesi??n para poder realizar el pedido!</b></h3>
                                <%} else {
                            %>
                            <input type="submit" class="primary-btn order-submit" style="width: 100%" value="Realizar Pedido">
                            <% }
                                }%>


                            <% String URL = (String) contexto.getAttribute("URL");
                                if (URL.equals("/ProyectoProductosTecnologicos/storeBusqueda.jsp")) {%>
                            <a href="storeBusqueda.jsp" class="primary-btn order-submit">Seguir Comprando</a>
                            <%}
                                if (URL.equals("/ProyectoProductosTecnologicos/store.jsp")) { %>
                            <a href="store.jsp" class="primary-btn order-submit">Seguir Comprando</a>
                            <% }
                                if (URL.equals("/ProyectoProductosTecnologicos/storePorCategoria.jsp")) { %>
                            <a href="storePorCategoria.jsp" class="primary-btn order-submit">Seguir Comprando</a>
                            <% }%>

                        </div>
                    </form>
                    <!-- /Order Details -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- NEWSLETTER -->
        <div id="newsletter" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="newsletter">

                            <ul class="newsletter-follow">
                                <li>
                                    <a href="https://es-es.facebook.com/"><i class="fa fa-facebook"></i></a>
                                </li>
                                <li>
                                    <a href="https://twitter.com/?lang=es"><i class="fa fa-twitter"></i></a>
                                </li>
                                <li>
                                    <a href="https://www.instagram.com/"><i class="fa fa-instagram"></i></a>
                                </li>
                                <li>
                                    <a href="https://www.google.com/intl/es/gmail/about/"><i class="fa fa-envelope"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /NEWSLETTER -->

        <!-- FOOTER -->
        <footer id="footer">
            <!-- top footer -->
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="footer">
                            <h3 class="footer-title">Sobre Nosotros</h3>
                            <h4 class=" footer-title">Electro Master S.A.</h4>
                            <p>Fundada en 1980, somos una empresa familiar que empez?? como una tienda peque??a de productos electr??nicos en Sevila y que con la entrada de las nuevas tecnolog??as y la venta online nos expandimos a la mayor parte de Espa??a.</p>
                            <ul class="header-links">
                                <li><i class="fa fa-map-marker"></i>Cl. Banda Playa, 65, 11540 Sanl??car de Barrameda, C??diz</li>
                                <li><i class="fa fa-phone"></i> 956-36-85-16</li>
                                <li><i class="fa fa-envelope-o"></i> electro_master@gmail.com</li>
                            </ul>
                        </div>
                        <%@include file="APIMAPSearchBox.html" %>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /top footer -->

            <!-- bottom footer -->
            <div id="bottom-footer" class="section">
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <ul class="footer-payments">
                                <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                                <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                            </ul>
                            <span class="copyright">
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script>ELECTRO MASTER S.L todos los derechos reservados.
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </span>
                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /bottom footer -->
        </footer>
        <!-- /FOOTER -->

        <!-- jQuery Plugins -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>
        <script src="js/CalcularTotalCarrito.js"></script>
    </body>
</html>

