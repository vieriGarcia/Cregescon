/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.unmsm.sistemas.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
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
public class login extends HttpServlet {

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
        String sql = "SELECT * FROM seg_usuario";
        ResultSet res = con.ejecutarQuery(sql);
        //List<Usuario> res = (ArrayList<Usuario>) request.getAttribute("listaUsuarios");
        Usuario user = new Usuario();
        user.setUsername(request.getParameter("username"));
        user.setPassword(request.getParameter("pass"));
        s.setAttribute("username", user.getUsername());
        s.setAttribute("password", user.getPassword());
        System.out.println(user.getUsername() + user.getPassword());
        boolean flag = false;
        try {
            while (res.next()) {
                if (res.getString("v_usuario").equalsIgnoreCase(user.getUsername()) && res.getString("v_contrasenia").equalsIgnoreCase(user.getPassword())) {
                    System.out.println(res.getString("v_usuario") + res.getString("v_contrasenia"));
                    flag = true;
                    break;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(login.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (flag) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        } else {
            PrintWriter out = response.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Usuario o contraseña invalida.');");
            out.println("location.href = \"login.jsp\";");
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
