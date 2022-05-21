<%-- 
    Document   : vistaProducto
    Created on : 14 ene. 2022, 21:03:27
    Author     : alber
--%>

<%@page import="Db.BDD"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Producto"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <!--<meta http-equiv="X-UA-Compatible" content="IE=edge">-->
        <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Electro Master store</title>

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

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
        <%

            HttpSession sesion = request.getSession();

            String usuario = (String) sesion.getAttribute("usuario");

            /*if (usuario == null) {

                 RequestDispatcher rd;
                 ServletContext contexto = getServletContext();
                 rd = contexto.getRequestDispatcher("/index.html");
                 rd.forward(request, response);
             }*/
            if (usuario == null)
                usuario = "invitado";
        %>
        <header>
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
                        <li><a href="controlCerrarSesion"><i class="fa fa-sign-out"></i>Cerrar Sesion</a></li>
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
                                        <i class="fa fa-shopping-cart"></i>
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
                                                        <img src="img/<%=pro.getFoto()%>" alt="">
                                                    </div>
                                                    <div class="product-body">
                                                        <h3 class="product-name"><a href="controlVistaProducto?nombreProducto=<%=pro.getNombre()%>"><%=pro.getNombre()%></a></h3>
                                                        <h4 class="product-price"><span class="qty"><%=pro.getCantidad()%> X</span><%=precioFinal%>€</h4>
                                                    </div>

                                                    <input hidden="true" type="text" name="borrarArtCarrito" value="<%=pro.getNombre()%>">
                                                    <button type="submit" class="delete"><i class="fa fa-close"></i></button>
                                                </div>
                                            </form>
                                            <%      cantidadTotal += pro.getCantidad();
                                                    precioTotal = precioFinal * pro.getCantidad();
                                                    costeTotal += precioTotal;
                                               }%>
                                        </div>
                                        <%}%>
                                        <div class="cart-summary">
                                            <small><%=cantidadTotal%> Articulos seleccionados</small>
                                            <h5>SUBTOTAL: <%=costeTotal%>€</h5>
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
        <%
            Producto pro = (Producto) contexto.getAttribute("productoVistaProducto");
        %>
        <!-- BREADCRUMB -->
        <div id="breadcrumb" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <ul class="breadcrumb-tree">
                            <li>Home</a></li>
                            <li>Categorias</a></li>
                            <li><%= pro.getCategoria()%></li>
                            <li class="active"><%= pro.getNombre()%></li>
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
                    <!-- Product main img -->
                    <div class="col-md-5 col-md-push-2">
                        <div id="product-main-img">
                            <div class="product-preview">
                                <img src="img/<%=pro.getFoto()%>" alt="">
                            </div>

                            <div class="product-preview">
                                <img src="img/<%=pro.getFoto()%>" alt="">
                            </div>

                            <div class="product-preview">
                                <img src="img/<%=pro.getFoto()%>" alt="">
                            </div>

                            <div class="product-preview">
                                <img src="img/<%=pro.getFoto()%>" alt="">
                            </div>
                        </div>
                    </div>
                    <!-- /Product main img -->

                    <!-- Product thumb imgs -->
                    <div class="col-md-2  col-md-pull-5">
                        <div id="product-imgs">
                            <div class="product-preview">
                                <img src="img/<%=pro.getFoto()%>" alt="">
                            </div>

                            <div class="product-preview">
                                <img src="img/<%=pro.getFoto()%>" alt="">
                            </div>

                            <div class="product-preview">
                                <img src="img/<%=pro.getFoto()%>" alt="">
                            </div>

                            <div class="product-preview">
                                <img src="img/<%=pro.getFoto()%>" alt="">
                            </div>
                        </div>
                    </div>
                    <!-- /Product thumb imgs -->

                    <!-- Product details -->
                    <div class="col-md-5">
                        <div class="product-details">
                            <h2 class="product-name"><%=pro.getNombre()%></h2>
                            <div>
                                <%if (pro.getDescuento() > 0) {
                                        double descuento = pro.getDescuento();
                                        double precio = pro.getPrecio();
                                        double precioFinal = precio - (descuento * precio);%>
                                <h3 class="product-price"><%=precioFinal%>€ <del class="product-old-price"><%= pro.getPrecio()%>€</del></h3>
                                <%} else {%>
                                <h3 class="product-price"><%=pro.getPrecio()%>0€</h3>
                                <%}%>
                                <span class="product-available">En Stock</span>
                            </div>
                            <p><%= pro.getDetalle()%></p>
                            <br>
                            <div class="add-to-cart">
                                <form action="AddCarrito" method="post">
                                    <div class="qty-label">
                                        Cantidad
                                        <div class="input-number">
                                            <input type="number" name="cantidad" value="1" min="1">
                                            <span class="qty-up">+</span>
                                            <span class="qty-down">-</span>
                                        </div>
                                    </div>

                                    <input hidden="true" type="text" name="nombreProducto" value="<%=pro.getNombre()%>">
                                    <%String URL = request.getRequestURI();//lo metemos en una variable y lo hacemos atributo para mandarlo y asi saber de donde viene la peticion en el Servlet.
                                        contexto.setAttribute("URL", URL);
                                    %>
                                    <button type="submit" id="anadirCarrito" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Añadir al carrito</button>
                                </form>
                            </div>

                            <ul class="product-links">
                                <li>Category:</li>
                                <li><%= pro.getCategoria()%></li>

                            </ul>

                            <ul class="product-links">
                                <li>Share:</li>
                                <li><a href="https://es-es.facebook.com/"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="https://twitter.com/?lang=es"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="https://www.instagram.com/"><i class="fa fa-instagram"></i></a></li>
                                <li><a href="https://www.google.com/intl/es/gmail/about/"><i class="fa fa-envelope"></i></a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /Product details -->

                    <!-- Product tab -->

                    <!-- /product tab -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- Section -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <div class="col-md-12">
                        <div class="section-title text-center">
                            <h3 class="title">Productos relacionados</h3>
                        </div>
                    </div>

                    <!-- product -->
                    <%  String categoria = pro.getCategoria();
                        String nombreProducto = pro.getNombre();
                        List<Producto> listaProductosRelacionados = BDD.buscarProductosRelacionados(categoria, nombreProducto);//Buscamos productos relacionados con la misma categoria del producto elegido. 
                        for (Producto producto : listaProductosRelacionados) {

                    %>
                    <div class="col-md-3 col-xs-6">
                        <div class="product">
                            <form action="AddCarrito" method="post">
                                <div class="product-img">
                                    <img src="img/<%=producto.getFoto()%>" width="100px" height="225px" alt="">
                                    <div class="product-label">
                                        <% if (producto.getDescuento() > 0) {
                                                double doublePorcentaje = producto.getDescuento() * 100;
                                                int porcentaje = (int) doublePorcentaje;
                                        %>
                                        <span class="sale">-<%=porcentaje%>%</span>
                                        <%} else {%>
                                        <span class="new">NUEVO</span>
                                        <%}%>
                                    </div>
                                </div>
                                <div class="product-body">
                                    <p class="product-category"><%=producto.getCategoria()%></p>
                                    <h3 class="product-name"><a href="controlVistaProducto?nombreProducto=<%=producto.getNombre()%>"><%=producto.getNombre()%></a></h3>
                                        <% if (producto.getDescuento() > 0) {
                                                    double descuento = producto.getDescuento();
                                                    double precio = producto.getPrecio();
                                                    double precioFinal = precio - (descuento * precio);%>
                                    <h4 class="product-price"><%=precioFinal%>0€<del class="product-old-price"><%=precio%>0€</del></h4>   
                                    <%} else {%>
                                    <h4 class="product-price"><%=producto.getPrecio()%>0€</h4>
                                    <%}%>
                                    <input hidden="true" type="text" name="nombreProducto" value="<%=producto.getNombre()%>">
                                </div>
                                <div class="add-to-cart">
                                    <button type="submit" id="anadirCarrito" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Añadir al carrito</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <%}%>

                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /Section -->

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
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> ELECTRO MASTER S.L todos los derechos reservados.
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

    </body>
</html>

