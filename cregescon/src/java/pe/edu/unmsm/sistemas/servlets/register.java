/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.unmsm.sistemas.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.unmsm.sistemas.entitys.Usuario;
import pe.edu.unmsm.sistemas.util.Conexion;
import pe.edu.unmsm.sistemas.util.ParametrosSistema;

/**
 *
 * @author Darkness
 */
@WebServlet(name = "register", urlPatterns = {"/register.do"})
public class register extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession s = request.getSession(false);
        Conexion con = Conexion.getConexion(ParametrosSistema.DRIVER, ParametrosSistema.URL, ParametrosSistema.CONECTION_USER, ParametrosSistema.CONECTION_PASS);

        //List<Usuario> res = (ArrayList<Usuario>) request.getAttribute("listaUsuarios");
        Usuario user = new Usuario();
        user.setUsername(request.getParameter("username"));
        user.setPassword(request.getParameter("psswrd"));
        user.setApellidoM(request.getParameter("am"));
        user.setApellidoP(request.getParameter("ap"));
        user.setNombre(request.getParameter("name"));
        String sql = "INSERT INTO seg_usuario(v_usuario,v_contrasenia,v_nombres,v_ap_paterno,v_ap_materno) VALUES (?,?,?,?,?)";
        PreparedStatement ps = null;
        try {
            ps = con.getPreparedStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getNombre());
            ps.setString(4, user.getApellidoP());
            ps.setString(5, user.getApellidoM());

        } catch (SQLException ex) {
            Logger.getLogger(register.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(request.getParameter("psswrd"));
        PrintWriter out = response.getWriter();
        if (request.getParameter("psswrd").equalsIgnoreCase(request.getParameter("confirms"))) {
            int t = 0;
            try {
                t = ps.executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(register.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (t != 0) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Ingreso correcto, pulse Aceptar para redireccionar.');");
                out.println("location.href = \"login.jsp\";");
                out.println("</script>");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Algo Fallo, reintente.');");
                out.println("location.href = \"register.jsp\";");
                out.println("</script>");
            }

        } else {

            out.println("<script type=\"text/javascript\">");
            out.println("alert('La contraseña no coincide.');");
            out.println("location.href = \"register.jsp\";");
            out.println("</script>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
