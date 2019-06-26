<%-- 
    Document   : index
    Created on : 19-jun-2019, 20:21:21
    Author     : Vieri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="pe.edu.unmsm.sistemas.util.Conexion"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="pe.edu.unmsm.sistemas.util.ParametrosSistema"%>
<%@page import="java.sql.ResultSet"%>
<!-- Custom styles for this page -->
  <% 
    Conexion con= Conexion.getConexion(ParametrosSistema.DRIVER, ParametrosSistema.URL,ParametrosSistema.CONECTION_USER,ParametrosSistema.CONECTION_PASS);
    //Consulta para obtener los productos
    String sql="";
    ResultSet res= null;
%>
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
        <link href="resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    </head>
    <body id="page-top">
        <div id="wrapper">
        <%@include file ="componentes/sidebar.jspf"%>
        <div id="content-wrapper" class="d-flex flex-column">
             <!-- Main Content -->
            <div id="content">
                <%@include file ="componentes/topbar.jspf"%>
                <%@include file ="parametros.jsp"%>
            </div>
            <!-- End of Main Content -->
            <!-- Footer -->
            <footer class="sticky-footer bg-white">
              <div class="container my-auto">
                <div class="copyright text-center my-auto">
                  <span>Copyright &copy; Your Website 2019</span>
                </div>
              </div>
            </footer>
            <!-- End of Footer -->
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
        <script src="resources/vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="resources/js/demo/chart-area-demo.js"></script>
        <script src="resources/js/demo/chart-pie-demo.js"></script>
        <script src="resources/js/demo/datatables-demo.js"></script>
    </body>
</html>

