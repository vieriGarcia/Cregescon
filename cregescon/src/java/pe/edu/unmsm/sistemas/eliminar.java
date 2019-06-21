/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.unmsm.sistemas;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.unmsm.sistemas.util.Carrito;
import pe.edu.unmsm.sistemas.util.Item;

/**
 *
 * @author LaboratorioFISI
 */
public class eliminar extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession s = request.getSession(false);
        Carrito carrito =(Carrito)s.getAttribute("carrito");
        if(carrito == null){
            System.out.println("Construye carrito");
            s.setAttribute("carrito", new Carrito());
            carrito =(Carrito)s.getAttribute("carrito");
        }   
        // crear el item
        Item item = new Item();
        item.setiProduct_id(Integer.valueOf(request.getParameter("id")));
        //Eliminar el item del carrito 
        carrito.eliminarItemCarrito(item);
        //ahora hacemos perdurar el carrito en la sesion
        s.setAttribute("carrito", carrito);
        System.out.println(carrito.toString());
        response.sendRedirect(request.getContextPath()+"/#carrito/index.jsp");
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
