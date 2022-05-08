<%-- 
    Document   : errorRegistro
    Created on : 31 dic. 2021, 14:40:56
    Author     : alber
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Raleway|Ubuntu" rel="stylesheet">

        <!-- Estilos -->
        <link rel="stylesheet" href="css/style2_1.css">

        <title>Formulario Login y Registro de Usuarios</title>
        <style>
            .contenido-tab > div:first-child {
                display: none;
            }
        </style>
    </head>
    <body>

        <!-- Formularios -->
        <div class="contenedor-formularios">
            <!-- Links de los formularios -->
            <ul class="contenedor-tabs">
                <li class="tab tab-primera"><a href="#iniciar-sesion">Iniciar Sesión</a></li>
                <li class="tab tab-segunda active"><a href="#registrarse">Registrarse</a></li>
            </ul>

            <!-- Contenido de los Formularios -->
            <div class="contenido-tab">
                <!-- Iniciar Sesion -->
                <div id="iniciar-sesion">
                    <h1>Iniciar Sesión</h1>
                    <form action="controlLogin" method="post">
                        <div class="contenedor-input">
                            <label>
                                Usuario <span class="req">*</span>
                            </label>
                            <input name="usuario" type="text" required>
                        </div>

                        <div class="contenedor-input">
                            <label>
                                Contraseña <span class="req">*</span>
                            </label>
                            <input name="pass" type="password" required>
                        </div>
                        <input type="submit" class="button button-block" value="Iniciar Sesión">
                    </form>
                </div>

                <!-- Registrarse -->
                <div id="registrarse">
                    <h1>Registrarse</h1>
                    <form action="controlRegistro" method="post">
                        <div class="fila-arriba">
                            <div class="contenedor-input">
                                <label>
                                    Nombre <span class="req">*</span>
                                </label>
                                <input name="nombre" type="text" pattern="[A-ZÑña-záéíóúÁÉÍÓÚ\s]{1,15}" required >
                            </div>

                            <div class="contenedor-input">
                                <label>
                                    Apellidos <span class="req">*</span>
                                </label>
                                <input name="apellidos" type="text" pattern="[A-ZÑña-záéíóúÁÉÍÓÚ\s]{1,15}" required>
                            </div>
                        </div>
                        <div class="contenedor-input">
                            <label>
                                Usuario <span class="req">*</span>
                            </label>
                            <input name="usuario" type="text" pattern="\S{8,16}" required>
                        </div>
                        <div class="contenedor-input">
                            <label>
                                Email <span class="req">*</span>
                            </label>
                            <input name="email" type="email" pattern="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?" required>
                        </div>
                        <div class="contenedor-input">
                            <label>
                                Contraseña <span class="req">*</span>
                            </label>
                            <input name="pass" type="password" pattern="(?=.*\d)(?=.*[!#$%&'()*+,-./:;<=>?@[\]^_`{|}~¡!¿])(?=.*[A-Z])(?=.*[a-z])\S{8,16}" required>
                        </div>

                        <div class="contenedor-input">
                            <label>
                                Repetir Contraseña <span class="req">*</span>
                            </label>
                            <input name="RePass" type="password" pattern="(?=.*\d)(?=.*[!#$%&'()*+,-./:;<=>?@[\]^_`{|}~¡!¿])(?=.*[A-Z])(?=.*[a-z])\S{8,16}" required>
                        </div>
                        <div class="contenedor-input">
                            <label>
                                Dirección <span class="req">*</span>
                            </label>
                            <input name="direccion" type="text" required>
                        </div>
                        <div class="contenedor-input">
                            <label>
                                teléfono <span class="req">*</span>
                            </label>
                            <input name="teléfono" type="text" pattern="[\d]{9}" required>
                        </div>
                        <%
                        String error = (String) request.getAttribute("errorReg");%>
                        <p style="color: white; background-color: #D10024; margin-bottom: 2%; padding: 2px; border-radius: 5px"><%=error%></p>
                        <input type="submit" class="button button-block" value="Registrarse">
                    </form>
                </div>
            </div>
        </div>

        <script src="js/jquery.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>
<!-- partial -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script><script  src="js/script.js"></script>

</body>
</html>
