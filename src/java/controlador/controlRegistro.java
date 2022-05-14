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
import modelo.Usuario;

/**
 *
 * @author alber
 */
public class controlRegistro extends HttpServlet {

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
            out.println("<title>Servlet controlRegistro</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet controlRegistro at " + request.getContextPath() + "</h1>");
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
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String usuario = request.getParameter("usuario");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String RePass = request.getParameter("RePass");
        String direccion = request.getParameter("direccion");
        String telfString = request.getParameter("telefono");
        int telefono = Integer.parseInt(telfString);
        String tipo = "user";
        //String generatedSecuredPasswordHash = BCrypt.hashpw(pass, BCrypt.gensalt(12));
        String generatedSecuredPasswordHash = BCrypt.hashpw(pass, BCrypt.gensalt(12));
        if (!pass.equals(RePass)) {
            String errorReg = "Las contraseñas no coinciden.";
            request.setAttribute("errorReg", errorReg);
            rd = request.getRequestDispatcher("/errorRegistro.jsp");
            rd.forward(request, response);
        } else {

            String encontrado = BDD.buscarUsuario(usuario);
            if (!encontrado.equals("")) {
                String errorReg = "El usuario introducido ya esta registrado.";
                request.setAttribute("errorReg", errorReg);
                rd = request.getRequestDispatcher("/errorRegistro.jsp");
                rd.forward(request, response);
            } else {
                Usuario user = new Usuario(nombre, apellidos, tipo, email, usuario, generatedSecuredPasswordHash, direccion, telefono);
                BDD.AltaUsuario(user);
                String error = "Usuario añadido correctamente, introduzca su usuario y contraseña.";//Uso el error del login para mostrar que se ha añadido el usuario y ya se puede logear.
                request.setAttribute("error", error);
                rd = request.getRequestDispatcher("/errorLogin.jsp");
                rd.forward(request, response);
            }
        }
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
