/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import Db.BDD;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Producto;

/**
 *
 * @author alber
 */
public class BorrarArtCarrito extends HttpServlet {

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
            out.println("<title>Servlet BorrarArtCarrito</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BorrarArtCarrito at " + request.getContextPath() + "</h1>");
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
        String nombreProducto=request.getParameter("borrarArtCarrito");
        Producto p=BDD.buscarProducto(nombreProducto);
        ServletContext contexto=getServletContext();
        String URL=(String) contexto.getAttribute("URL");
        List<Producto>listaCarrito=(List<Producto>)contexto.getAttribute("listaCarrito");
        for (Producto producto : listaCarrito) { 
            if (producto.getNombre().equals(p.getNombre())) {
                listaCarrito.remove(producto);
                break;
            }
        }
        contexto.setAttribute("listaCarrito", listaCarrito);
        if (URL.equals("/ProyectoProductosTecnologicos/store.jsp")) {
            rd = request.getRequestDispatcher("/store.jsp");
            rd.forward(request, response); 
        }
        if (URL.equals("/ProyectoProductosTecnologicos/storeBusqueda.jsp")) {
            rd = request.getRequestDispatcher("/storeBusqueda.jsp");
            rd.forward(request, response); 
        }
        if (URL.equals("/ProyectoProductosTecnologicos/vistaProducto.jsp")) {
            rd = request.getRequestDispatcher("/vistaProducto.jsp");
            rd.forward(request, response); 
        }
         if (URL.equals("/ProyectoProductosTecnologicos/storePorCategoria.jsp")) {
            rd = request.getRequestDispatcher("/storePorCategoria.jsp");
            rd.forward(request, response); 
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
