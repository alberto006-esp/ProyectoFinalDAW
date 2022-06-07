/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Pedido;
import modelo.Producto;
import modelo.Usuario;

/**
 *
 * @author alber
 */
public class BDD {

    private static String usuario = "root";
    private static String password = "";
    private static String servidor = "localhost:3306";
    private static String bdd = "productos_electronicos";

    public static Connection crearConexion() {
        Connection cnn = null;
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://" + servidor + "/" + bdd;

        try {
            Class.forName(driver);
            cnn = DriverManager.getConnection(url, usuario, password);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(BDD.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BDD.class.getName()).log(Level.SEVERE, null, ex);
        }

        return cnn;
    }

    public static String buscarUsuario(String usuario) {
        String clave = "";
        Connection cnn = crearConexion();
        String sentenciaSQL = "SELECT usuario_password FROM usuario WHERE usuario_user='" + usuario + "'";
        try {
            Statement stm = cnn.createStatement();
            ResultSet rs = stm.executeQuery(sentenciaSQL);

            if (rs.next()) {
                clave = rs.getString("usuario_password");
            }
            cnn.close();
        } catch (SQLException ex) {
            Logger.getLogger(BDD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return clave;
    }

    public static void AltaUsuario(Usuario user) {
        try {
            Connection cnn = crearConexion();
            String sql = "INSERT INTO usuario (usuario_nombre,usuario_apellidos,usuario_tipo,usuario_email,usuario_user,usuario_password,usuario_direccion,usuario_telefono) VALUES('" + user.getNombre() + "','" + user.getApellidos() + "','" + user.getTipo() + "','" + user.getEmail() + "','" + user.getUsuario() + "','" + user.getPass() + "','" + user.getDireccion() + "','" + user.getTelefono() + "')";
            Statement stm = cnn.createStatement();
            stm.executeUpdate(sql);
            cnn.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }

    public static ArrayList<Producto> buscarProductos() {
        ArrayList<Producto> listaProductos = new ArrayList<>();
        Connection cnn = null;
        try {
            cnn = crearConexion();
            String sentemciaSQL = "SELECT producto_id,producto_nombre,categoria_nombre,producto_detalle,producto_precio,producto_descuento,producto_foto FROM producto P,categoria C WHERE P.categoria_id=C.categoria_id";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sentemciaSQL);
            listaProductos.clear();
            while (rs.next()) {
                Producto p = new Producto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDouble(5), rs.getDouble(6), rs.getString(7));
                listaProductos.add(p);
            }
            cnn.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listaProductos;
    }

    public static Producto buscarProducto(String nombreProducto) {
        Connection cnn = null;
        Producto p = null;
        try {
            cnn = crearConexion();
            String sentemciaSQL = "SELECT producto_id,producto_nombre,categoria_nombre,producto_detalle,producto_precio,producto_descuento,producto_foto FROM producto P INNER JOIN categoria C ON P.categoria_id=C.categoria_id WHERE producto_nombre='" + nombreProducto + "'";
            //String sql="SELECT producto_id,producto_nombre,categoria_nombre,producto_detalle,producto_precio,producto_descuento,producto_foto FROM producto P INNER JOIN categoria C ON P.categoria_id=C.categoria_id WHERE producto_nombre='AIRY TRUE WIRELESS'";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sentemciaSQL);
            if (rs.next()) {
                p = new Producto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDouble(5), rs.getDouble(6), rs.getString(7));
            }
            cnn.close();
        } catch (SQLException e) {

        }
        return p;
    }

    public static List<Producto> buscarProductosLike(String busqueda, String categoria) {
        List<Producto> listaBusqueda = new ArrayList<Producto>();
        Connection cnn = null;
        String sql = "";
        try {
            cnn = crearConexion();
            if (categoria.equals("all")) {
                sql = "SELECT producto_id,producto_nombre,categoria_nombre,producto_detalle,producto_precio,producto_descuento,producto_foto FROM producto P INNER JOIN categoria C ON P.categoria_id=C.categoria_id WHERE producto_nombre LIKE '%" + busqueda + "%'";
            } else {
                sql = "SELECT producto_id,producto_nombre,categoria_nombre,producto_detalle,producto_precio,producto_descuento,producto_foto FROM producto P INNER JOIN categoria C ON P.categoria_id=C.categoria_id WHERE producto_nombre LIKE '%" + busqueda + "%' AND categoria_nombre='" + categoria + "'";
            }
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            listaBusqueda.clear();
            while (rs.next()) {
                Producto p = new Producto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDouble(5), rs.getDouble(6), rs.getString(7));
                listaBusqueda.add(p);
            }
            cnn.close();
        } catch (SQLException e) {

        }
        return listaBusqueda;
    }

    public static int BuscarIdUsuario(String usuario) {
        Connection cnn = crearConexion();
        int id = 0;
        String sentenciaSQL = "SELECT usuario_id FROM usuario WHERE usuario_user='" + usuario + "'";
        try {
            Statement stm = cnn.createStatement();
            ResultSet rs = stm.executeQuery(sentenciaSQL);

            if (rs.next()) {
                id = rs.getInt("usuario_id");
            }
            cnn.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return id;
    }

    public static void TramitarPedido(int idUsuario, double costeTotal, String fechaPedido) {
        try {
            Connection cnn = crearConexion();
            String sql = "INSERT INTO pedido (pedido_fecha,usuario_id,pedido_total) VALUES('" + fechaPedido + "','" + idUsuario + "','" + costeTotal + "')";
            Statement stm = cnn.createStatement();
            stm.executeUpdate(sql);
            cnn.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }

    public static int BuscarIdPedido() {
        Connection cnn = crearConexion();
        int id = 0;
        try {
            String sentenciaSQL = "SELECT pedido_id FROM pedido";
            Statement stm = cnn.createStatement();
            ResultSet rs = stm.executeQuery(sentenciaSQL);
            if (rs.last()) {
                id = rs.getInt("pedido_id");
            }
            cnn.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return id;

    }

    public static void TramitarDetallePedido(int idPedido, List<Producto> listaCarrito) {
        try {
            Connection cnn = crearConexion();
            for (Producto pro : listaCarrito) {
                String sql = "INSERT INTO detallepedido (pedido_id,producto_id,detalle_cantidad) VALUES('" + idPedido + "','" + pro.getId() + "','" + pro.getCantidad() + "')";
                Statement stm = cnn.createStatement();
                stm.executeUpdate(sql);
            }
            cnn.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }

    public static List<Pedido> buscarPedidosFecha(String fechaMinima, String fechaMaxima) {
        List<Pedido> listaPedidosFecha = new ArrayList<Pedido>();
        Connection cnn = crearConexion();
        String nombreUsuario = "";
        try {
            String sentenciaSQL = "SELECT * FROM pedido WHERE pedido_fecha >='" + fechaMinima + "'AND pedido_fecha <= '" + fechaMaxima + "'";
            Statement stm = cnn.createStatement();
            ResultSet rs = stm.executeQuery(sentenciaSQL);
            while (rs.next()) {
                nombreUsuario = BDD.BuscarNombreUsuario(rs.getInt("usuario_id"));
                Pedido pedido = new Pedido(rs.getInt("pedido_id"), rs.getDate("pedido_fecha"), nombreUsuario, rs.getDouble("pedido_total"));
                listaPedidosFecha.add(pedido);
            }
            cnn.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return listaPedidosFecha;
    }

    public static List BuscarClientes() {
        List<Usuario> listaClientes = new ArrayList<Usuario>();
        Connection cnn = crearConexion();

        try {
            String sentenciaSQL = "SELECT * FROM usuario";
            Statement stm = cnn.createStatement();
            ResultSet rs = stm.executeQuery(sentenciaSQL);

            while (rs.next()) {
                Usuario usuario = new Usuario(rs.getString("usuario_nombre"), rs.getString("usuario_apellidos"), rs.getString("usuario_tipo"), rs.getString("usuario_email"), rs.getString("usuario_user"), rs.getString("usuario_password"), rs.getString("usuario_direccion"), rs.getInt("usuario_telefono"));
                listaClientes.add(usuario);
                //usuario_nombre,usuario_apellidos,usuario_tipo,usuario_email,usuario_user,usuario_password,usuario_direccion,usuario_telefono
            }
            cnn.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return listaClientes;
    }

    public static List<Pedido> buscarPedidosCliente(String nombreCliente) {
        List<Pedido> listaPedidosCliente = new ArrayList<Pedido>();
        Connection cnn = crearConexion();
        int idCliente = BDD.BuscarIdUsuario(nombreCliente);
        String nombreUsuario = "";
        try {
            String sentenciaSQL = "SELECT * FROM pedido WHERE usuario_id='" + idCliente + "'";
            Statement stm = cnn.createStatement();
            ResultSet rs = stm.executeQuery(sentenciaSQL);
            while (rs.next()) {
                nombreUsuario = BDD.BuscarNombreUsuario(rs.getInt("usuario_id"));
                Pedido pedido = new Pedido(rs.getInt("pedido_id"), rs.getDate("pedido_fecha"), nombreUsuario, rs.getDouble("pedido_total"));
                listaPedidosCliente.add(pedido);
            }
            cnn.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return listaPedidosCliente;

    }

    public static List<Pedido> buscarPedidosProducto(int idProducto) {
        List<Pedido> listaPedidosUnProducto = new ArrayList<Pedido>();
        try {
            Connection cnn = crearConexion();
            String sentenciaSQL = "SELECT * FROM pedido INNER JOIN detallepedido ON pedido.pedido_id=detallepedido.pedido_id WHERE detallepedido.producto_id=" + idProducto + " ORDER BY detallepedido.pedido_id";
            Statement stm = cnn.createStatement();
            ResultSet rs = stm.executeQuery(sentenciaSQL);
            while (rs.next()) {
                String cliente = BuscarNombreUsuario(rs.getInt("usuario_id"));
                String producto = BuscarNombreProducto(rs.getInt("producto_id"));
                double precio = BuscarPrecioProducto(producto);
                Pedido pedido = new Pedido(rs.getInt("pedido_id"), rs.getDate("pedido_fecha"), cliente, producto, rs.getInt("detalle_cantidad"), precio);
                listaPedidosUnProducto.add(pedido);
            }
            cnn.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return listaPedidosUnProducto;

    }

    public static String BuscarNombreUsuario(int idUsuario) {
        Connection cnn = crearConexion();
        String nombreUsuario = "";
        String sentenciaSQL = "SELECT usuario_user FROM usuario WHERE usuario_id='" + idUsuario + "'";
        try {
            Statement stm = cnn.createStatement();
            ResultSet rs = stm.executeQuery(sentenciaSQL);

            if (rs.next()) {
                nombreUsuario = rs.getString("usuario_user");
            }
            cnn.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return nombreUsuario;
    }

    public static String BuscarNombreProducto(int idProducto) {
        Connection cnn = null;
        String nombreProducto = "";

        try {
            cnn = crearConexion();
            String sentemciaSQL = "SELECT producto_nombre FROM producto WHERE producto_id='" + idProducto + "'";
            //String sql="SELECT producto_id,producto_nombre,categoria_nombre,producto_detalle,producto_precio,producto_descuento,producto_foto FROM producto P INNER JOIN categoria C ON P.categoria_id=C.categoria_id WHERE producto_nombre='AIRY TRUE WIRELESS'";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sentemciaSQL);
            if (rs.next()) {
                nombreProducto = rs.getString("producto_nombre");
            }
            cnn.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return nombreProducto;
    }

    private static double BuscarPrecioProducto(String nombreProducto) {
        double precio = 0;
        Connection cnn = null;

        try {
            cnn = crearConexion();
            String sentemciaSQL = "SELECT producto_precio FROM producto WHERE producto_nombre='" + nombreProducto + "'";
            //String sql="SELECT producto_id,producto_nombre,categoria_nombre,producto_detalle,producto_precio,producto_descuento,producto_foto FROM producto P INNER JOIN categoria C ON P.categoria_id=C.categoria_id WHERE producto_nombre='AIRY TRUE WIRELESS'";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sentemciaSQL);
            if (rs.next()) {
                precio = rs.getDouble("producto_precio");
            }
            cnn.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return precio;
    }

    public static List<Producto> buscarProductosPedido(int idPedido) {
        Connection cnn = null;
        List<Producto> listaProductos = new ArrayList<Producto>();

        String categoria = "";
        try {
            String sql = "SELECT * FROM detallepedido INNER JOIN pedido ON detallepedido.pedido_id=pedido.pedido_id INNER JOIN producto on detallepedido.producto_id=producto.producto_id WHERE detallepedido.pedido_id=" + idPedido + "";
            cnn = crearConexion();
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                categoria = BDD.buscarCategoria(rs.getInt("categoria_id"));
                Producto pro = new Producto(rs.getInt("pedido_id"), rs.getString("producto_nombre"), categoria, rs.getString("producto_detalle"), rs.getDouble("producto_precio"), rs.getDouble("producto_descuento"), rs.getString("producto_foto"), rs.getInt("detalle_cantidad"));
                listaProductos.add(pro);
            }
            cnn.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return listaProductos;

    }

    private static String buscarCategoria(int idCategoria) {
        String categoria = "";
        Connection cnn = null;
        cnn = crearConexion();
        try {
            String sql = "SELECT categoria_nombre from categoria where categoria_id='" + idCategoria + "'";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                categoria = rs.getString("categoria_nombre");
            }
            cnn.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return categoria;
    }

    public static ArrayList<Producto> buscarProductosRelacionados(String categoria, String nombreProducto) {
        ArrayList<Producto> listaProductos = new ArrayList<>();
        ArrayList<Producto> listaProductosRelacionadosAleatorios = new ArrayList<>();
        Connection cnn = null;
        String nombre = "";
        try {
            cnn = crearConexion();
            String sentemciaSQL = "SELECT producto_id,producto_nombre,categoria_nombre,producto_detalle,producto_precio,producto_descuento,producto_foto FROM producto P,categoria C WHERE P.categoria_id=C.categoria_id AND categoria_nombre='" + categoria + "'";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sentemciaSQL);
            listaProductos.clear();
            while (rs.next()) {
                Producto p = new Producto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDouble(5), rs.getDouble(6), rs.getString(7));
                nombre = p.getNombre();
                if (!nombre.equals(nombreProducto)) {//lo hacemos para evitar que aparezca en los productos relacionados el mismo producto que hemos seleccionado.
                    listaProductos.add(p);
                }
            }
            cnn.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        int numeroMaximo = listaProductos.size();
        int numeroMinimo = 0;
        int arrayIndiceAleatorio[] = new int[4];
        Arrays.fill(arrayIndiceAleatorio, -1);
        int indiceAleatorio = 0;
        int numeroArticulos = 4;
        boolean repetido = false;
        for (int x = 0; x < numeroArticulos; x++) {
            do {
                indiceAleatorio = (int) (Math.random() * (numeroMaximo - numeroMinimo) + numeroMinimo);
                for (int y = 0; y < arrayIndiceAleatorio.length; y++) {
                    if (indiceAleatorio == arrayIndiceAleatorio[y]) {
                        repetido = true;
                        break;
                    }
                }
            } while (repetido);
            repetido = false;
            arrayIndiceAleatorio[x] = indiceAleatorio;
            Producto pro = listaProductos.get(arrayIndiceAleatorio[x]);
            listaProductosRelacionadosAleatorios.add(pro);
        }

        return listaProductosRelacionadosAleatorios;
    }

    public static List<Producto> buscarProductosPorCategoria(String categoria) {
        List<Producto> listaProductosPorCategoria = new ArrayList<Producto>();
        Connection cnn = null;
        try {
            cnn = crearConexion();
            String sentemciaSQL = "SELECT producto_id,producto_nombre,categoria_nombre,producto_detalle,producto_precio,producto_descuento,producto_foto FROM producto P,categoria C WHERE P.categoria_id=C.categoria_id AND categoria_nombre='" + categoria + "'";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sentemciaSQL);
            //listaProductosPorCategoria.clear();
            while (rs.next()) {
                Producto p = new Producto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDouble(5), rs.getDouble(6), rs.getString(7));
                listaProductosPorCategoria.add(p);
            }
            cnn.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }

        return listaProductosPorCategoria;
    }

    public static int[] buscarIdProductosMasVendidos() {
        int idProductosMasVendidos[] = new int[6];
        Connection cnn = null;
        int cont = 0;
        try {
            cnn = crearConexion();
            String sql = "SELECT producto_id, SUM(detalle_cantidad) AS cantidadTotal FROM detallepedido GROUP BY producto_id ORDER BY SUM(detalle_cantidad) DESC LIMIT 6";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                idProductosMasVendidos[cont] = rs.getInt("producto_id");
                cont++;
            }
            cnn.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return idProductosMasVendidos;
    }

    public static List<Producto> buscarProductosMasVendidos(int[] idProductosMasVendidos) {
        List<Producto> listaProductosMasVendidos = new ArrayList<Producto>();
        Connection cnn = null;
        try {
            cnn = crearConexion();
            for (int x = 0; x < idProductosMasVendidos.length; x++) {
                String sql = "SELECT producto_id,producto_nombre,categoria_nombre,producto_detalle,producto_precio,producto_descuento,producto_foto FROM producto P,categoria C WHERE P.categoria_id=C.categoria_id AND producto_id='" + idProductosMasVendidos[x] + "'";
                Statement st = cnn.createStatement();
                ResultSet rs = st.executeQuery(sql);
                if (rs.next()) {
                    Producto p = new Producto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDouble(5), rs.getDouble(6), rs.getString(7));
                    listaProductosMasVendidos.add(p);
                }
            }
            cnn.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listaProductosMasVendidos;

    }

    public static List<Producto> buscarProductosPorPrecio(double precioMinimo, double precioMaximo) {
        List<Producto> listaBusqueda = new ArrayList<Producto>();
        Connection cnn = null;
        try {
            cnn = crearConexion();
            String sql = "SELECT producto_id,producto_nombre,categoria_nombre,producto_detalle,producto_precio,producto_descuento,producto_foto FROM producto P,categoria C WHERE P.categoria_id=C.categoria_id AND producto_precio>='" + precioMinimo + "' AND producto_precio<='" + precioMaximo + "'";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                Producto p = new Producto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDouble(5), rs.getDouble(6), rs.getString(7));
                listaBusqueda.add(p);
            }
            cnn.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listaBusqueda;
    }

    public static Usuario buscarDatosUsuario(String nombreUsuario) {
        String clave = null;
        Connection cnn = crearConexion();
        Usuario usu = null;
        try {
            String sentenciaSQL = "SELECT * FROM usuario WHERE usuario_user='" + nombreUsuario + "'";
            Statement stm = cnn.createStatement();
            ResultSet rs = stm.executeQuery(sentenciaSQL);

            if (rs.next()) {
                usu = new Usuario(rs.getString("usuario_nombre"), rs.getString("usuario_apellidos"), rs.getString("usuario_tipo"), rs.getString("usuario_email"), rs.getString("usuario_user"), rs.getString("usuario_password"), rs.getString("usuario_direccion"), rs.getInt("usuario_telefono"));
            }
            cnn.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return usu;
    }

    public static List<Producto> buscarProductosEnOferta() {
        List<Producto> listaProductosEnOferta = new ArrayList<Producto>();
        Connection cnn = null;
        try {
            cnn = crearConexion();
            String sentemciaSQL = "SELECT producto_id,producto_nombre,categoria_nombre,producto_detalle,producto_precio,producto_descuento,producto_foto FROM producto P,categoria C WHERE P.categoria_id=C.categoria_id AND producto_descuento>0";
            Statement st = cnn.createStatement();
            ResultSet rs = st.executeQuery(sentemciaSQL);
            //listaProductosPorCategoria.clear();
            while (rs.next()) {
                Producto p = new Producto(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDouble(5), rs.getDouble(6), rs.getString(7));
                listaProductosEnOferta.add(p);
            }
            cnn.close();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return listaProductosEnOferta;
    }

    public static String buscarTipoUsuario(String usuario) {
        String tipoUsuario = "";
        Connection cnn = crearConexion();
        String sentenciaSQL = "SELECT usuario_tipo FROM usuario WHERE usuario_user='" + usuario + "'";
        try {
            Statement stm = cnn.createStatement();
            ResultSet rs = stm.executeQuery(sentenciaSQL);

            if (rs.next()) {
                tipoUsuario = rs.getString("usuario_tipo");
            }
            cnn.close();
        } catch (SQLException ex) {
             System.out.println(ex.getMessage());
        }
        return tipoUsuario;
    }

    public static void Modificar(Usuario usu, String nombreUsuario) {
        Connection cnn = crearConexion();
        String sql = "UPDATE usuario SET usuario_nombre='" + usu.getNombre() + "', usuario_apellidos='" + usu.getApellidos() + "', usuario_email='" + usu.getEmail() + "', usuario_user='" + usu.getUsuario() + "', usuario_password='" + usu.getPass() + "', usuario_direccion='" + usu.getDireccion() + "', usuario_telefono='" + usu.getTelefono() + "' WHERE usuario_user='" + nombreUsuario + "'";
        Statement stm;
        try {
            stm = cnn.createStatement();
            stm.executeUpdate(sql);
            cnn.close();
        } catch (SQLException ex) {
             System.out.println(ex.getMessage());
        }
    }

}
