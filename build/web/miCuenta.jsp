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
                        <li><i class="fa fa-map-marker"></i>Cl. Banda Playa, 65, 11540 Sanlúcar de Barrameda, Cádiz</li>
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
                                    <img src="img/logo11.png" width="220px" height="60px" alt="">
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
                                        <option value="portatiles">Portátiles</option>
                                        <option value="smartphones">Smartphones</option>
                                        <option value="camaras">Cámaras</option>
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
                        <li><a href="controlCategoria?categoria=portatiles">Portátiles</a></li>
                        <li><a href="controlCategoria?categoria=smartphones">Smartphones</a></li>
                        <li><a href="controlCategoria?categoria=camaras">Cámaras</a></li>
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
                <!-- row -->
                <div class="row">

                    <div class="col-md-7">
                        <!-- Billing Details -->
                        <div class="billing-details">

                            <% String nombreUsuario = (String) sesion.getAttribute("usuario");

                                Usuario usu = BDD.buscarDatosUsuario(nombreUsuario);
                                ServletContext contexto = getServletContext();
                                String mensajeModificar = (String) contexto.getAttribute("mensajeModificar");%>
                            <div class="section-title">
                                <h3 class="title">Modificar datos personales</h3>
                            </div>
                            <%if (mensajeModificar != null) {%>
                            <div class="container">
                                <div class="section">
                                    <div style="background-color: #D10024; text-align: center">
                                        <h3 style="color: white"><%=mensajeModificar%></h3>
                                    </div> 
                                </div>  
                            </div>
                            <%contexto.removeAttribute("mensajeModificar");
                                }%>
                            <form action="controlModificarDatosPersonales" method="post">
                                <div class="container">
                                    <div class="row">
                                        <div class="col">
                                            <div class="form-group">
                                                <label for="nombre">Nombre:</label>
                                                <input class="input" name="nombre" type="text" value="<%=usu.getNombre()%>" pattern="[A-ZÑña-záéíóúÁÉÍÓÚ\s]{1,15}" required >
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="form-group">
                                                <label for="apellidos">Apellidos:</label>
                                                <input class="input" name="apellidos" type="text" value="<%= usu.getApellidos()%>" pattern="[A-ZÑña-záéíóúÁÉÍÓÚ\s]{1,15}" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <div class="form-group">
                                                <label for="usuario">Usuario: <strong style="font-style: italic;font-size: x-small">(El nombre del usuario debe tener al menos 8 caracteres y un máximo de 16)</strong></label>
                                                <input class="input" name="usuario" type="text" value="<%= usu.getUsuario()%>" pattern="\S{8,16}" required>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="form-group">
                                                <label for="email">Email:</label>
                                                <input class="input" name="email" type="email" value="<%= usu.getEmail()%>" pattern="[a-zA-Z0-9!#$%&'*_+-]([\.]?[a-zA-Z0-9!#$%&'*_+-])+@[a-zA-Z0-9]([^@&%$\/()=?¿!.,:;]|\d)+[a-zA-Z0-9][\.][a-zA-Z]{2,4}([\.][a-zA-Z]{2})?"  required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <div class="form-group">
                                                <label for="pass">Contraseña: <strong style="font-style: italic;font-size: x-small">(la contraseña debe tener al menos 8 caracteres, un número, una mayúscula y un carácter especial)</strong></label>
                                                <input class="input" name="pass" type="password" pattern="(?=.*\d)(?=.*[!#$%&'()*+,-./:;<=>?@[\]^_`{|}~¡!¿])(?=.*[A-Z])(?=.*[a-z])\S{8,16}" required>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="form-group">
                                                <label for="RePass">Repetir contraseña:</label>
                                                <input class="input" name="RePass" type="password" pattern="(?=.*\d)(?=.*[!#$%&'()*+,-./:;<=>?@[\]^_`{|}~¡!¿])(?=.*[A-Z])(?=.*[a-z])\S{8,16}" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <div class="form-group">
                                                <label for="direccion">Dirección:</label>
                                                <input class="input" name="direccion" value="<%= usu.getDireccion()%>" type="text" required>
                                            </div>
                                        </div>
                                        <div class="col">
                                            <div class="form-group">
                                                <label for="telefono">Teléfono:</label>
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
                                </div>
                            </form>
                        </div>
                        <!-- /Billing Details -->

                        <!-- Shiping Details -->

                        <!-- /Shiping Details -->

                        <!-- Order notes -->
                        <!-- /Order notes -->
                    </div>
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
                            <p>Fundada en 1980, somos una empresa familiar que empezó como una tienda pequeña de productos electrónicos en Sevila y que con la entrada de las nuevas tecnologías y la venta online nos expandimos a la mayor parte de España.</p>
                            <ul class="header-links">
                                <li><i class="fa fa-map-marker"></i>Cl. Banda Playa, 65, 11540 Sanlúcar de Barrameda, Cádiz</li>
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

