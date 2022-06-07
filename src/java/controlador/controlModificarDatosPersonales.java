/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import Db.BDD;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Usuario;

/**
 *
 * @author alber
 */
public class controlModificarDatosPersonales extends HttpServlet {

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
            out.println("<title>Servlet controlModificarDatosPersonales</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet controlModificarDatosPersonales at " + request.getContextPath() + "</h1>");
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
        ServletContext contexto=getServletContext();
        HttpSession sesion = request.getSession();
        String nombreUsuario = (String) sesion.getAttribute("usuario");
        RequestDispatcher rd;
        String nombre=request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String usuario = request.getParameter("usuario");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String RePass = request.getParameter("RePass");
        String direccion = request.getParameter("direccion");
        int telefono =Integer.parseInt(request.getParameter("telefono"));
        String tipo = "user";
        if (pass.equals(RePass)) {
            String generatedSecuredPasswordHash = BCrypt.hashpw(pass, BCrypt.gensalt(12));
            Usuario usu = new Usuario(nombre, apellidos, tipo, email, usuario, generatedSecuredPasswordHash, direccion, telefono);
            BDD.Modificar(usu, nombreUsuario);
            String mensajeModificar="Datos modificados con éxito.";
            contexto.setAttribute("mensajeModificar", mensajeModificar);
        } else {
            String mensajeModificar="Las contraseñas no coinciden.";
            contexto.setAttribute("mensajeModificar", mensajeModificar);
        }
        rd = request.getRequestDispatcher("/miCuenta.jsp");
        rd.forward(request, response); 
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
