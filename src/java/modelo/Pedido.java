/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.Date;

/**
 *
 * @author alber
 */
public class Pedido {
    private int idPedido;
    private java.sql.Date fechaPedido;
    private int idUsuario;
    private String nombreUsuario;
    private String nombreProducto;
    private int cantidad;
    private double pedidoTotal;
    private double precio;

    public Pedido(int idPedido, Date fechaPedido, String nombreUsuario, double pedidoTotal) {
        this.idPedido = idPedido;
        this.fechaPedido = fechaPedido;
        this.nombreUsuario = nombreUsuario;
        this.pedidoTotal = pedidoTotal;
    }

    public Pedido(int idPedido, Date fechaPedido, String nombreUsuario, String nombreProducto, int cantidad, double precio) {
        this.idPedido = idPedido;
        this.fechaPedido = fechaPedido;
        this.nombreUsuario = nombreUsuario;
        this.nombreProducto = nombreProducto;
        this.cantidad = cantidad;
        this.precio = precio;
    }

    public int getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public Date getFechaPedido() {
        return fechaPedido;
    }

    public void setFechaPedido(Date fechaPedido) {
        this.fechaPedido = fechaPedido;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public double getPedidoTotal() {
        return pedidoTotal;
    }

    public void setPedidoTotal(double pedidoTotal) {
        this.pedidoTotal = pedidoTotal;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }
    
    @Override
    public String toString() {
        return "Pedido{" + "idPedido=" + idPedido + ", fechaPedido=" + fechaPedido + ", idUsuario=" + idUsuario + ", pedidoTotal=" + pedidoTotal + '}';
    }
    
}
