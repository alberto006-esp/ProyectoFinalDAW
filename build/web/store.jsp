<%-- 
    Document   : store
    Created on : 30 dic. 2021, 16:35:39
    Author     : alber
--%>

<%@page import="modelo.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Db.BDD"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Electro Master Store</title>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Slab&subset=latin,greek' rel='stylesheet' type='text/css'>
        <!--<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">-->
        <link href="css/main.css" rel="stylesheet" type="text/css" />
        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
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
        <script src="js/jquery-1.3.2.js"></script>
    </head>
    <body>
        <!-- HEADER -->
        <header>
            <!-- TOP HEADER -->
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
                        <li><a href="index.html"><i class="fa fa-sign-in"></i>Iniciar Sesion/Registrarse</a></li>        
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
                                    if (!usuario.equals("invitado")) {%>
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
                                            <h5>TOTAL: <%=costeTotal%>€</h5>
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

        <!-- BREADCRUMB -->
        <div id="breadcrumb" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <ul class="breadcrumb-tree">
                            <li>Home</a></li>
                            <li>Categorias</li>
                            <li class="active">Todos los productos</li>
                        </ul>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /BREADCRUMB -->
        <%
            String mensajePedido = (String) contexto.getAttribute("mensajePedido");
            if (mensajePedido != null) {%>
        <div class="container">
            <div class="section">
                <div class="form-group">
                    <div class="alert alert-danger" role="alert">
                        <%= mensajePedido %>
                    </div>
                </div> 
            </div>  
        </div>
        <%contexto.removeAttribute("mensajePedido");
            }%>

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- ASIDE -->
                    <div id="aside" class="col-md-3">
                        <!-- aside Widget -->

                        <!-- /aside Widget -->

                        <!-- aside Widget -->
                        <%List<Producto> listaProductos = BDD.buscarProductos();
                            contexto.setAttribute("listaProductosStore", listaProductos);
                        %>
                        <div class="aside">
                            <h3 class="aside-title">Filtrar por precio</h3>
                            <div class="price-filter">
                                <form action="controlBusquedaPorPrecio" method="post">
                                    <div id="price-slider"></div>
                                    <div class="input-number price-min">
                                        <input id="price-min" name="precioMinimo" type="number">
                                        <span class="qty-up">+</span>
                                        <span class="qty-down">-</span>
                                    </div>
                                    <span>-</span>
                                    <div class="input-number price-max">
                                        <input id="price-max" name="precioMaximo" type="number">
                                        <span class="qty-up">+</span>
                                        <span class="qty-down">-</span>
                                    </div>
                                    <input type="submit" name="buscar por precio" value="buscar por precio" class="primary-btn order-submit" style="margin-top: 10%"t>
                                </form>
                            </div>
                        </div>
                        <!-- /aside Widget -->

                        <!-- aside Widget -->

                        <!-- /aside Widget -->

                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Top Ventas</h3>
                            <% int idProductosMasVendidos[] = BDD.buscarIdProductosMasVendidos();
                                List<Producto> listaProductosMasVendidos = BDD.buscarProductosMasVendidos(idProductosMasVendidos);
                                for (Producto p : listaProductosMasVendidos) {


                            %>
                            <div class="product-widget">
                                <div class="product-img">
                                    <img src="img/<%=p.getFoto()%>" alt="">
                                </div>
                                <div class="product-body">
                                    <p class="product-category"><%=p.getCategoria()%></p>
                                    <h3 class="product-name"><a href="controlVistaProducto?nombreProducto=<%=p.getNombre()%>"><%=p.getNombre()%></a></h3>
                                        <% if (p.getDescuento() > 0) {
                                                double descuento = p.getDescuento();
                                                double precio = p.getPrecio();
                                                double precioFinal = precio - (descuento * precio);%>
                                    <h4 class="product-price"><%=precioFinal%>€<del class="product-old-price"><%=precio%>€</del></h4> 
                                    <%} else {%>
                                    <h4 class="product-price"><%=p.getPrecio()%>€</h4>
                                    <%}%>
                                </div>
                            </div>
                            <%}%>   
                        </div>
                        <!-- /aside Widget -->
                    </div>
                    <!-- /ASIDE -->

                    <!-- STORE -->
                    <div id="store" class="col-md-9">
                        <!-- store top filter -->
                        <!--<div class="store-filter clearfix">
                            <div class="store-sort">
                                <label>
                                    Show:
                                    <select class="input-select">
                                        <option value="0">20</option>
                                        <option value="1">50</option>
                                    </select>
                                </label>
                            </div>                            
                        </div>
                        <!-- /store top filter -->

                        <!-- store products -->

                        <div class="row">
                            <div id="paginacion">
                                <%
                                    int cont = 0;
                                    for (Producto p : listaProductos) {
                                        cont++;
                                %>
                                <!-- product -->
                                <div class="col-md-4 col-xs-6 ">
                                    <div class="product">
                                        <form action="AddCarrito" method="post">
                                            <div class="product-img">
                                                <img src="img/<%=p.getFoto()%>" width="100px" height="225px" alt="">
                                                <div class="product-label">
                                                    <% if (p.getDescuento() > 0) {
                                                            double doublePorcentaje = p.getDescuento() * 100;
                                                            int porcentaje = (int) doublePorcentaje;
                                                    %>
                                                    <span class="sale">-<%=porcentaje%>%</span>
                                                    <%} else {%>
                                                    <span class="new">NUEVO</span>
                                                    <%}%>
                                                </div>
                                            </div>
                                            <div class="product-body">
                                                <p class="product-category"><%=p.getCategoria()%></p>
                                                <h3 class="product-name"><a href="controlVistaProducto?nombreProducto=<%=p.getNombre()%>"><%=p.getNombre()%></a></h3>
                                                    <% if (p.getDescuento() > 0) {
                                                            double descuento = p.getDescuento();
                                                            double precio = p.getPrecio();
                                                            double precioFinal = precio - (descuento * precio);%>
                                                <h4 class="product-price"><%=precioFinal%>€<del class="product-old-price"><%=precio%>€</del></h4>   
                                                <%} else {%>
                                                <h4 class="product-price"><%=p.getPrecio()%>€</h4>
                                                <%}%>
                                                <input hidden="true" type="text" name="nombreProducto" value="<%=p.getNombre()%>">
                                            </div>
                                            <div class="add-to-cart">

                                                <button type="submit" id="anadirCarrito" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Añadir al carrito</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <!-- /product -->

                                <%}%>
                                <%String URL = request.getRequestURI();//lo metemos en una variable y lo hacemos atributo para mandarlo y asi saber de donde viene la peticion en el Servlet.
                                    contexto.setAttribute("URL", URL);
                                %>
                            </div>
                            <!-- /store products -->

                            <!-- store bottom filter -->
                            <!--<div class="store-filter clearfix">
                                <span class="store-qty">Showing 20-100 products</span>
                                <ul class="store-pagination">
                                    <li class="active">1</li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">4</a></li>
                                    <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                                </ul>
                            </div>-->
                            <!-- /store bottom filter -->
                        </div>   
                    </div>
                    <!-- /STORE -->
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

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script type="text/javascript" src="js/jQuery.paginate.js"></script>
        <script>
                                    $('#paginacion').paginate({
                                        items_per_page: 9
                                    });
        </script>
    </body>
</html>
