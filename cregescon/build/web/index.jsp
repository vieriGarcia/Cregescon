<%-- 
    Document   : index
    Created on : 19-jun-2019, 20:21:21
    Author     : Vieri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Cregescon</title>
        <!-- Custom fonts for this template-->
        <link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
        <!-- Custom styles for this template-->
        <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
    </head>
    <body>
        <!-- Page Wrapper -->
        <div id="wrapper">
            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">Cregescon <sup>2</sup></div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Cregescon</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">
                <!-- Inicio creacion de item en sidebar: DEFINICIÓN DE CAMPAÑA -->
                <!-- Inicio encabezado de item  -->
                <div class="sidebar-heading">
                    Definición de Campañas
                </div> 
                <!-- Fin encabezado de item  -->
                <li class="nav-item">
                    <a class="nav-link" href="tables.html">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Definir Campaña</span></a>
                </li>
                <!-- Fin creacion de item en sidebar -->
                <!-- Divider -->
                <hr class="sidebar-divider">
                <!-- Inicio creacion de item en sidebar: GESTION DE CAMPAÑA -->
                <!-- Inicio encabezado de item  -->
                <div class="sidebar-heading">
                    Gestión de campaña
                </div> 
                <!-- Fin encabezado de item  -->
                <li class="nav-item">
                    <a class="nav-link" href="tables.html">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Gestionar Campaña</span></a>
                </li>
                <!-- Fin creacion de item en sidebar -->

                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Inicio creacion de item en sidebar: REPOSITORIO DE CAMPAÑA -->
                <!-- Inicio encabezado de item  -->
                <div class="sidebar-heading">
                    Repositorio de campañas
                </div> 
                <!-- Fin encabezado de item  -->
                <li class="nav-item">
                    <a class="nav-link" href="tables.html">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Ver repositorio</span></a>
                </li>
                <!-- Fin creacion de item en sidebar -->

                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Inicio creacion de item en sidebar: SEGURIDAD -->
                <!-- Inicio encabezado de item  -->
                <div class="sidebar-heading">
                    Seguridad
                </div>
                <!-- Fin encabezado de item  -->
                
                <li class="nav-item">
                    <%String id="parametros";%>
                    <a class="nav-link" href="/cregescon/sidebar.do?string=<%=id%>">
                        <i class="fas fa-fw fa-chart-area"></i>
                        <span>Usuarios</span></a>
                </li>
                <!-- Inicio de opcion de menú colapasdo en item  -->
                <li class="nav-item">
                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
                        <i class="fas fa-fw fa-wrench"></i>
                        <span>Perfiles</span>
                    </a>
                    <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                        <div class="bg-white py-2 collapse-inner rounded">
                            <!--<h6 class="collapse-header">Módulos de seguridad:</h6>-->
                            <a class="collapse-item" href="utilities-color.html">Mis perfiles</a>
                            <a class="collapse-item" href="utilities-border.html">Asignar permisos</a>
                            <a class="collapse-item" href="utilities-border.html">Asignar permisos</a>
                        </div>
                    </div>
                </li>
                <!-- Fin de opcion de menú colapasdo en item  -->
                
                <!-- Separador -->
                <hr class="sidebar-divider d-none d-md-block">
                <!-- Fin creacion de item en sidebar -->

                <!-- Boton para esconder sidebar -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>
            </ul>
            <!-- End of Sidebar -->
            <div class="col-xl-10 col-lg-12 col-md-9">
            <%
                String strMenu = (String) request.getAttribute("sidebarOption");
                if (strMenu == null || strMenu.equalsIgnoreCase("")) {
            %><%@include file ="parametros.jsp"%><%
            } else if (strMenu.equals("parametros")) {
            %><%@include file="login.jsp"%><%
                }
            %>
            </div>
        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="resources/vendor/jquery/jquery.min.js"></script>
        <script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="resources/js/sb-admin-2.min.js"></script>

        <!-- Page level plugins -->
        <script src="resources/vendor/chart.js/Chart.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="resources/js/demo/chart-area-demo.js"></script>
        <script src="resources/js/demo/chart-pie-demo.js"></script>
    </body>
</html>

