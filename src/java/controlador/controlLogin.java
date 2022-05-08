/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import Db.BDD;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author alber
 */
public class controlLogin extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet controlLogin</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet controlLogin at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        RequestDispatcher rd;
        String usuario=request.getParameter("usuario");
        String pass=request.getParameter("pass");
        String clave=BDD.buscarUsuario(usuario);
        
        if (clave!=null&& clave.equals(pass)) {
            HttpSession sesionantigua=request.getSession();
            sesionantigua.invalidate();
            HttpSession sesion=request.getSession();
            sesion.setAttribute("usuario", usuario);
            if (usuario.equals("admin")) {
             rd=request.getRequestDispatcher("/storeAdmin.jsp");
             rd.forward(request, response); 
            } else {
             rd=request.getRequestDispatcher("/store.jsp");
             rd.forward(request, response);   
            }
            
            //getServletContext().getRequestDispatcher("/Pedido.jsp").forward(request, response);forma de hacerlo en una linea
        } else {
            String error="Los datos introducidos son incorrectos.";
            request.setAttribute("error", error);
            rd=request.getRequestDispatcher("/errorLogin.jsp");
            rd.forward(request, response);
        }
    }
    

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
