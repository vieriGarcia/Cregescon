/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.unmsm.sistemas.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Darkness
 */
public class parametros extends HttpServlet{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession s = request.getSession(false);
        s.setAttribute("nameParameter",request.getParameter("par"));
        System.out.println("Yo he pasado por el servlet"+request.getParameter("par"));
        response.sendRedirect(request.getContextPath() + "/#miModal/index.jsp");
    }
}
