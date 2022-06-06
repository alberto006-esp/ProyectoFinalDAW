<%-- 
    Document   : newjsp
    Created on : 9 ene. 2022, 18:40:35
    Author     : alber
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Electro Master Modo Administrador</title>

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
        <header>
            <!-- TOP HEADER -->
             <%
            
            HttpSession sesion=request.getSession();
    
     String usuario=(String) sesion.getAttribute("usuario");

    if(usuario == null){

        RequestDispatcher rd;
        ServletContext contexto = getServletContext();
        rd= contexto.getRequestDispatcher("/index.html");
        rd.forward(request, response);
        }
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
                            
                        <li><i class="fa fa-user-o"></i> <%=sesion.getAttribute("usuario")%></li>
                        <li><a href="controlCerrarSesion"><i class="fa fa-sign-out"></i>Cerrar Sesion</a></li>
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
                                <a href="storeAdmin.jsp" class="logo">
                                    <img src="img/logo11.png" width="220px" height="60px" alt="">
                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->

                        <!-- SEARCH BAR -->
                        <!-- /SEARCH BAR -->

                        <!-- ACCOUNT -->
                        
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
                        <li><a href="storeAdmin.jsp">Home</a></li>
                        <li><a href="pedidosFecha.jsp">Pedidos por fecha</a></li>
                        <li><a href="pedidosPorProductos.jsp">Productos</a></li>
                        <li><a href="pedidosPorClientes.jsp">Clientes</a></li>
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
                        <h3 class="breadcrumb-header">Bienvenido al modo administrador de la página</h3>
                        <br><br>
                        <h5 class="breadcrumb-header">Elige una de las opciones para mostrar los listados</h5>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /BREADCRUMB -->
        
        <div class="container">
                <!-- responsive-nav -->
                <div id="responsive-nav">
                    <!-- NAV -->
                    <ul class="main-nav nav navbar-nav">
                        <li><a href="pedidosFecha.jsp">Pedidos por fecha</a></li>
                        <li><a href="pedidosPorProductos.jsp">Productos en la base de datos</a></li>
                        <li><a href="pedidosPorClientes.jsp">Clientes</a></li>
                    </ul>
                    <!-- /NAV -->
                </div>
                <!-- /responsive-nav -->
            </div>
        
        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <img class="img-responsive" src="img/oficina.jpg" alt="Imagen no disponible" style=""/>
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- FOOTER -->
        <footer id="footer">
            <!-- bottom footer --><!--class="fixed-bottom"-->
            <div id="bottom-footer" class="section" style="margin-top: 20.5%">
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

