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
public class AddCarrito extends HttpServlet {
    List<Producto> listaCarrito= new ArrayList<Producto>();
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
            out.println("<title>Servlet AddCarrito</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCarrito at " + request.getContextPath() + "</h1>");
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
        ServletContext contexto=getServletContext();
        String nombreProducto=request.getParameter("nombreProducto");
        String URL=(String) contexto.getAttribute("URL");
        int cantidad=1;
        if (URL.equals("/ProyectoProductosTecnologicos/vistaProducto.jsp")) {
            cantidad=Integer.parseInt(request.getParameter("cantidad"));
        }
        int cantidadAntigua=0;//usaremos esta cantidad cuando ya exista el articulo en el carrito para asi poder aumentar su cantidad en uno.
        Producto p=BDD.buscarProducto(nombreProducto);
        Producto pro=new Producto(p.getId(), p.getNombre(), p.getCategoria(), p.getDetalle(), p.getPrecio(), p.getDescuento(), p.getFoto(), cantidad);
        boolean contiene=false;
        
            
            for (int x = 0; x < listaCarrito.size(); x++) {
                if (listaCarrito.get(x).getNombre().equals(pro.getNombre())) {
                    cantidadAntigua=listaCarrito.get(x).getCantidad();
                    cantidadAntigua+=cantidad;
                    pro= new Producto(p.getId(), p.getNombre(), p.getCategoria(), p.getDetalle(), p.getPrecio(), p.getDescuento(), p.getFoto(), cantidadAntigua);
                    listaCarrito.set(x, pro);
                    contiene=true;
                    break;
                }
            }
        if (!contiene) {
            listaCarrito.add(pro);
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
