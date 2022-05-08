<%-- 
    Document   : pedidosUnProducto
    Created on : 11 ene. 2022, 15:52:21
    Author     : alber
--%>

<%@page import="modelo.Pedido"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="Db.BDD"%>
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
                        <li><i class="fa fa-map-marker"></i> Calle Labarta nº36</li>
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
                        <h3 class="breadcrumb-header">Lista de Pedidos del producto </h3>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /BREADCRUMB -->

        <!-- SECTION -->
        <!-- /SECTION -->
        <%  ServletContext contexto = getServletContext();
            List<Pedido> listaPedidosunProducto=(List<Pedido>) contexto.getAttribute("listaPedidosUnProducto");
            boolean mostrar=false;
            if (listaPedidosunProducto == null) {
                listaPedidosunProducto = new ArrayList<Pedido>();
            }else{
                mostrar=true;
            }
            if (mostrar) {
            if (listaPedidosunProducto.isEmpty()) {%>
                <div class="container">
                 <div class="section">
                 <div style="background-color: #D10024; text-align: center">
                     <h3 style="color: white">No existe ningún pedido de ese producto</h3>
                 </div> 
                 </div>  
            </div>
            <%} else {%>
            <div class="container">
                 <div class="section">
            <table class="table">
                <thead class="table-condensed bg-danger">
                    <tr>
                        <th scope="col">Producto</th>
                        <th scope="col">Usuario</th>
                        <th scope="col">Id Pedido</th>
                        <th scope="col">Fecha Pedido</th>
                        <th scope="col">Cantidad</th>
                        <th scope="col">Precio</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Pedido pedido : listaPedidosunProducto) {
                              
                    %>
                        
                    <tr>
                        <th scope="row"><%=pedido.getNombreProducto()%></th>
                        <td><%=pedido.getNombreUsuario()%></td>
                        <td><%=pedido.getIdPedido()%></td>
                        <td><%=pedido.getFechaPedido()%></td>                        
                        <td><%=pedido.getCantidad()%></td>
                        <td><%=pedido.getPrecio()%>€</td>
                    </tr>
                   <%
                       }%> 
                </tbody>
            </table>
                        <form action="pedidosPorProductos.jsp">
                          <input type="submit" name="volver" value="volver" class="btn btn-danger center-block">
                      </form>
            </div>
                </div>
        <%}
        }%>
        <!-- NEWSLETTER -->
        <!-- /NEWSLETTER -->

        <!-- FOOTER -->
        <footer id="footer">
            <!-- top footer 
            <div class="section">-->
            <!-- container 
            <div class="container">-->
            <!-- row 
            <div class="row">
                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">About Us</h3>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut.</p>
                        <ul class="footer-links">
                            <li><a href="#"><i class="fa fa-map-marker"></i>1734 Stonecoal Road</a></li>
                            <li><a href="#"><i class="fa fa-phone"></i>+021-95-51-84</a></li>
                            <li><a href="#"><i class="fa fa-envelope-o"></i>email@email.com</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Categories</h3>
                        <ul class="footer-links">
                            <li><a href="#">Hot deals</a></li>
                            <li><a href="#">Laptops</a></li>
                            <li><a href="#">Smartphones</a></li>
                            <li><a href="#">Cameras</a></li>
                            <li><a href="#">Accessories</a></li>
                        </ul>
                    </div>
                </div>

                <div class="clearfix visible-xs"></div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Information</h3>
                        <ul class="footer-links">
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Orders and Returns</a></li>
                            <li><a href="#">Terms & Conditions</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Service</h3>
                        <ul class="footer-links">
                            <li><a href="#">My Account</a></li>
                            <li><a href="#">View Cart</a></li>
                            <li><a href="#">Wishlist</a></li>
                            <li><a href="#">Track My Order</a></li>
                            <li><a href="#">Help</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /row 
        </div>-->
            <!-- /container 
        </div>-->
            <!-- /top footer -->

            <!-- bottom footer -->
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
