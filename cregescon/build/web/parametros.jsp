<%-- 
    Document   : parametros
    Created on : 25-jun-2019, 17:21:53
    Author     : Darkness
--%>
<%@page import="pe.edu.unmsm.sistemas.util.Conexion"%>
<%@page import="pe.edu.unmsm.sistemas.util.ParametrosSistema"%>
<%@page import="java.sql.ResultSet"%>
<%
    //Conexion con = Conexion.getConexion(ParametrosSistema.DRIVER, ParametrosSistema.URL, ParametrosSistema.CONECTION_USER, ParametrosSistema.CONECTION_PASS);
    System.out.println(con);
//Consulta para obtener los productos
    /*String */sql = "SELECT * FROM mae_parametros_sistema";
    /*ResultSet */res = con.ejecutarQuery(sql);
    HttpSession s = request.getSession(false);
    //Usuario usuario =(Usuario)s.getAttribute("usuario");
    //System.out.println("usuario:"+usuario);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina Parametros</title>
    </head>
    <body>
        <div class="col-xl-12 col-lg-7">
            <div class="card shadow mb-10">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-9">
                    <center><h6 class="m-0 font-weight-bold text-primary">          Parametros del Sistema</h6></center>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th><center>Parametro</center></th>
                            <th><center>Descripción</center></th>
                            <th><center>Tipo de Dato</center></th>
                            <th><center>Valor</center></th>
                            <th><center>Editar</center></th>
                            </tr>
                            </thead>
                            <tbody>
                                <% String parV="testing"; while (res.next()) {%> 
                                <tr>
                                    <td><center><%=res.getString("V_PARAMETRO")%></center></td>
                            <td><center><%=res.getString("V_DESCRIPCION")%></center></td>
                            <td><center><%=res.getString("V_TIPO_DATO")%></center></td>
                            <td><center><%=res.getString("V_VALOR")%></center></td>
                            <td>
                            <center><button id="edit" onclick='editar_modal("<%=res.getString("V_PARAMETRO")%>")' class="btn btn-light a-btn-slide-text" data-toggle="modal" data-target="#miModal"><img src="resources/img/edit.png">Editar</button></center>
                            <a href="/cregescon/parametros.do?par=<%=res.getString("V_VALOR")%>"></a>
                            <script>
                                function editar_modal(parametro){
                                    //$('#myModal').modal('show');
                                    
                                    alert(parametro);
                                }
                            </script>
                            </td>
                            </tr>
                            <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="miModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title" id="myModalLabel">Edicion en Modal.</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Texto del modal
                        <%=parV%>
                        <%=request.getAttribute("nameParameter")%>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
