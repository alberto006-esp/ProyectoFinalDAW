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

        <title>Electro Master Mi Cuenta</title>

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
                                <!-- Cart -->
                                <%  ServletContext contexto = getServletContext();
                                    List<Producto> listaCarrito = (List) contexto.getAttribute("listaCarrito");
                                    double costeTotal = 0;
                                    int cantidadTotal = 0;
                                    if (listaCarrito == null) {
                                        listaCarrito = new ArrayList<Producto>();
                                    }
                                    int cantidadCarrito = 0;
                                    for (int x = 0; x < listaCarrito.size(); x++) {
                                        cantidadCarrito += listaCarrito.get(x).getCantidad();
                                    }
                                %>   
                                <div class="dropdown">
                                    <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                        <i class="bi bi-cart3"></i>
                                        <span>Carrito</span>
                                        <div class="qty"><%=cantidadCarrito%></div>
                                    </a>
                                    <div class="cart-dropdown">
                                        <%if (listaCarrito.isEmpty()) {%>
                                        <div class="cart-list">
                                            <h3 class="product-name">CARRITO VACIO</h3>
                                        </div>
                                        <%} else {%>
                                        <div class="cart-list">

                                            <%  double precioFinal = 0;
                                                double precioTotal = 0;
                                                for (Producto pro : listaCarrito) {
                                                    precioFinal = pro.getPrecio() - (pro.getDescuento() * pro.getPrecio());
                                            %>
                                            <form action="BorrarArtCarrito" method="post">
                                                <div class="product-widget">
                                                    <div class="product-img">
                                                        <img src="img/<%=pro.getFoto()%>" alt="Imagen no disponible">
                                                    </div>
                                                    <div class="product-body">
                                                        <h3 class="product-name"><a href="controlVistaProducto?nombreProducto=<%=pro.getNombre()%>"><%=pro.getNombre()%></a></h3>
                                                        <h4 class="product-price"><span class="qty"><%=pro.getCantidad()%> X</span><%=precioFinal%>???</h4>
                                                    </div>

                                                    <input hidden="true" type="text" name="borrarArtCarrito" value="<%=pro.getNombre()%>">
                                                    <button type="submit" class="delete"><i class="fa fa-close"></i></button>
                                                </div>
                                            </form>
                                            <%      cantidadTotal += pro.getCantidad();
                                                    precioTotal = precioFinal * pro.getCantidad();
                                                    costeTotal += precioTotal;

                                                }
                                            %>
                                        </div>
                                        <%}%>
                                        <div class="cart-summary">
                                            <small><%=cantidadTotal%> Articulos seleccionados</small>
                                            <%
                                                costeTotal = Math.round(costeTotal * 100.0) / 100.0;
                                                // String result = String .format("%.2f");
                                            %>
                                            <h5>TOTAL: <%=costeTotal%>???</h5>
                                        </div>
                                        <div class="cart-btns">

                                            <a href="carrito.jsp">Ver Carrito</a>
                                        </div>
                                    </div>
                                </div>

                                <!-- /Cart -->
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
                        <h3 class="breadcrumb-header">Mi Cuenta</h3>
                        <ul class="breadcrumb-tree">
                            <li>Home</li>
                            <li class="active">Mi Cuenta</li>
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
                <!-- Billing Details -->
                <div class="billing-details">
                    <div class="container">
                        <% String nombreUsuario = (String) sesion.getAttribute("usuario");

                            Usuario usu = BDD.buscarDatosUsuario(nombreUsuario);
                            String mensajeModificar = (String) contexto.getAttribute("mensajeModificar");%>
                        <div class="row">
                            <div class="section-title">
                                <h3 class="title">Modificar datos personales</h3>
                            </div>
                        </div>
                        <%if (mensajeModificar != null) {%>
                        <div class="row">
                            <div class="form-group">
                                <div class="alert alert-danger text-center" role="alert">
                                    <%= mensajeModificar%>
                                </div>
                            </div>  
                        </div>
                        <%contexto.removeAttribute("mensajeModificar");
                            }%>
                        <form action="controlModificarDatosPersonales" method="post">

                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="nombre">Nombre:</label>
                                        <input class="input" name="nombre" type="text" value="<%=usu.getNombre()%>" pattern="[A-Z????a-z????????????????????\s]{1,15}" required >
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label for="apellidos">Apellidos:</label>
                                        <input class="input" name="apellidos" type="text" value="<%= usu.getApellidos()%>" pattern="[A-Z????a-z????????????????????\s]{1,15}" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="usuario">Usuario: <strong style="font-style: italic;font-size: x-small">(El nombre del usuario debe tener al menos 8 caracteres y un m??ximo de 16)</strong></label>
                                        <input class="input" name="usuario" type="text" value="<%= usu.getUsuario()%>" pattern="\S{8,16}" required>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label for="email">Email:</label>
                                        <input class="input" name="email" type="email" value="<%= usu.getEmail()%>" pattern="[a-zA-Z0-9!#$%&'*_+-]([\.]?[a-zA-Z0-9!#$%&'*_+-])+@[a-zA-Z0-9]([^@&%$\/()=???!.,:;]|\d)+[a-zA-Z0-9][\.][a-zA-Z]{2,4}([\.][a-zA-Z]{2})?"  required>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="pass">Contrase??a: <strong style="font-style: italic;font-size: x-small">(la contrase??a debe tener al menos 8 caracteres, un n??mero, una may??scula y un car??cter especial)</strong></label>
                                        <input class="input" name="pass" type="password" pattern="(?=.*\d)(?=.*[!#$%&'()*+,-./:;<=>?@[\]^_`{|}~??!??])(?=.*[A-Z])(?=.*[a-z])\S{8,16}" required>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label for="RePass">Repetir contrase??a:</label>
                                        <input class="input" name="RePass" type="password" pattern="(?=.*\d)(?=.*[!#$%&'()*+,-./:;<=>?@[\]^_`{|}~??!??])(?=.*[A-Z])(?=.*[a-z])\S{8,16}" required>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <label for="direccion">Direcci??n:</label>
                                        <input class="input" name="direccion" value="<%= usu.getDireccion()%>" type="text" required>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="form-group">
                                        <label for="telefono">Tel??fono:</label>
                                        <input class="input" name="telefono" type="text" value="<%= usu.getTelefono()%>" pattern="[\d]{9}" required>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <input class="primary-btn order-submit" style="width: 50%" name="modificar" value="Modificar" type="submit">
                                <% String URL = (String) contexto.getAttribute("URL");
                                    if (URL.equals("/ProyectoProductosTecnologicos/storeBusqueda.jsp")) {%>
                                <a href="storeBusqueda.jsp" class="primary-btn order-submit" style="width: 49%">Volver</a>
                                <%}
                                    if (URL.equals("/ProyectoProductosTecnologicos/store.jsp")) { %>
                                <a href="store.jsp" class="primary-btn order-submit" style="width: 49%">Volver</a>
                                <% }
                                    if (URL.equals("/ProyectoProductosTecnologicos/storePorCategoria.jsp")) { %>
                                <a href="storePorCategoria.jsp" class="primary-btn order-submit" style="width: 49%">Volver</a>
                                <% }%>
                            </div>

                        </form>
                    </div>        
                </div>
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

