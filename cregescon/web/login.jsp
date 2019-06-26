<%-- 
    Document   : login
    Created on : 25-jun-2019, 15:42:54
    Author     : Darkness
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="pe.edu.unmsm.sistemas.entitys.Usuario"%>
<%@page import="pe.edu.unmsm.sistemas.util.Conexion"%>
<%@page import="pe.edu.unmsm.sistemas.util.ParametrosSistema"%>
<%@page import="java.sql.ResultSet"%>
<%
    Conexion con = Conexion.getConexion(ParametrosSistema.DRIVER, ParametrosSistema.URL, ParametrosSistema.CONECTION_USER, ParametrosSistema.CONECTION_PASS);
    System.out.println(con);
//Consulta para obtener los productos
    String sql = "SELECT * FROM seg_usuario";
    ResultSet res = con.ejecutarQuery(sql);
    HttpSession s = request.getSession(false);
    s.setAttribute("conect",con);
    Usuario usuario = (Usuario) s.getAttribute("usuario");
    System.out.println("usuario:" + usuario);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Pagina de Inicio</title>

        <!-- Custom fonts for this template-->
        <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
    </head>
    <body class="bg-gradient-primary">
        <div class="container">

            <!-- Outer Row -->
            <div class="row justify-content-center">

                <div class="col-xl-10 col-lg-12 col-md-9">

                    <div class="card o-hidden border-0 shadow-lg my-5">
                        <div class="card-body p-0">
                            <!-- Nested Row within Card Body -->
                            <div class="row">
                                <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                                <div class="col-lg-6">
                                    <div class="p-5">
                                        <div class="text-center">
                                            <h1 class="h4 text-gray-900 mb-4">Bienvenido de nuevo!</h1>
                                        </div>
                                        <form class="user" id="my_form" action="/cregescon/login.do">
                                            <div class="form-group">
                                                <input type="text" class="form-control form-control-user" name="username" aria-describedby="userHelp" placeholder="Ingrese su nombre de usuario...">
                                            </div>
                                            <div class="form-group">
                                                <input type="password" class="form-control form-control-user" name="pass" placeholder="Contraseña...">
                                            </div>
                                            <div class="form-group">
                                                <div class="custom-control custom-checkbox small">
                                                    <input type="checkbox" class="custom-control-input" id="customCheck">
                                                    <label class="custom-control-label" for="customCheck">Recordarme</label>
                                                </div>
                                            </div>
                                            <a href="javascript:{}" class="btn btn-primary btn-user btn-block" onclick="document.getElementById('my_form').submit();">
                                                Iniciar Sesion
                                            </a>
                                            <hr>
                                            <a href="index.jsp" class="btn btn-google btn-user btn-block">
                                                <i class="fab fa-google fa-fw"></i> Iniciar Sesión con Google
                                            </a>
                                            <a href="index.jsp" class="btn btn-facebook btn-user btn-block">
                                                <i class="fab fa-facebook-f fa-fw"></i> Iniciar Sesión con Facebook
                                            </a>
                                        </form>
                                        <hr>
                                        <div class="text-center">
                                            <a class="small" href="forgot_password.jsp">¿Olvidaste tu contraseña?</a>
                                        </div>
                                        <div class="text-center">
                                            <a class="small" href="register.jsp">¡Crear una cuenta!</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>

        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="resources/vendor/jquery/jquery.min.js"></script>
        <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="resources/js/sb-admin-2.min.js"></script>
    </body>
</html>
