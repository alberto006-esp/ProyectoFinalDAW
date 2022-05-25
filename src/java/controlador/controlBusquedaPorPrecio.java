/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import Db.BDD;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class controlBusquedaPorPrecio extends HttpServlet {

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
            out.println("<title>Servlet controlBusquedaPorPrecio</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet controlBusquedaPorPrecio at " + request.getContextPath() + "</h1>");
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
        ServletContext contexto = getServletContext();
        double precioMinimo = 0;
        String cadenaPrecioMinimo = request.getParameter("precioMinimo");
        precioMinimo = Double.parseDouble(cadenaPrecioMinimo);
        double precioMaximo = 0;
        String cadenaPrecioMaximo = request.getParameter("precioMaximo");
        precioMaximo = Double.parseDouble(cadenaPrecioMaximo);
        //recogemos la lista de productos que nos aparece en la store para asi filtrar por la lista de productos.
        List<Producto> lista = (List<Producto>) contexto.getAttribute("listaProductosStore");
        List<Producto> listaFiltroPrecio = new ArrayList<>();
        double descuento = 0;
        double precio=0;
        double precioFinal=0;
        for (Producto producto : lista) {
            descuento = producto.getDescuento() * producto.getPrecio();
            precio=producto.getPrecio();
            precioFinal=precio - descuento;
            if (precioFinal >= precioMinimo && precioFinal <= precioMaximo) {
                listaFiltroPrecio.add(producto);
            }

        }
        contexto.setAttribute("listaFiltroPrecio", listaFiltroPrecio);
        rd = request.getRequestDispatcher("/storeFiltroPrecio.jsp");
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
