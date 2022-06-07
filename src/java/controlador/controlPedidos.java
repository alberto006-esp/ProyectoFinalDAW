  /*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import Db.BDD;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Producto;

/**
 *
 * @author alber
 */
@WebServlet(name = "controlPedidos", urlPatterns = {"/controlPedidos"})
public class controlPedidos extends HttpServlet {

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
            out.println("<title>Servlet controlPedidos</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet controlPedidos at " + request.getContextPath() + "</h1>");
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
        List<Producto> listaCarrito=(List<Producto>) contexto.getAttribute("listaCarrito");
        int cantidades[]=new int[listaCarrito.size()];//coincidira con el indice del arrayList y contendra las nuevas cantidades si se han modificado en el carrito
        String nombre="";
        int cantidad=0;
        double costeTotal=0;
        double precioFinal=0;
        
        for (int x = 0; x < listaCarrito.size(); x++) {
            nombre=listaCarrito.get(x).getNombre();
            cantidad=listaCarrito.get(x).getCantidad();
            cantidades[x]=Integer.parseInt(request.getParameter(nombre));//El nombre del articulo coincidira con el nombre del parametro que viene de la vista
            if (cantidades[x]!=cantidad) {
                Producto pro=new Producto(listaCarrito.get(x).getId(), nombre, listaCarrito.get(x).getCategoria(), listaCarrito.get(x).getDetalle(), listaCarrito.get(x).getPrecio(), listaCarrito.get(x).getDescuento(), listaCarrito.get(x).getFoto(), cantidades[x]);
                listaCarrito.set(x, pro);
            }
        }
        for (Producto pro : listaCarrito) {
            precioFinal=(pro.getPrecio()-(pro.getDescuento()*pro.getPrecio()))*pro.getCantidad();
            costeTotal+=precioFinal;
        }
        HttpSession sesion = request.getSession();
        String usuario=String.valueOf(sesion.getAttribute("usuario"));
        int idUsuario=BDD.BuscarIdUsuario(usuario);
        long fecha;
        fecha = sesion.getCreationTime();
        Date f = new Date(fecha);
        SimpleDateFormat formato = new SimpleDateFormat("yyyy/MM/dd");
        String fechaPedido=formato.format(f);
        BDD.TramitarPedido(idUsuario,costeTotal,fechaPedido);
        int idPedido=BDD.BuscarIdPedido();
        
        BDD.TramitarDetallePedido(idPedido, listaCarrito);
        contexto.removeAttribute("listaCarrito");
        String mensajePedido="¡PEDIDO REALIZADO CON ÉXITO!";
        contexto.setAttribute("mensajePedido", mensajePedido);
        rd = request.getRequestDispatcher("/store.jsp");
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
