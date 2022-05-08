/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author alber
 */
public class Producto {
    int id;
    String nombre;
    String categoria;
    String detalle;
    double precio;
    double descuento;
    String foto;
    int cantidad;

    public Producto(int id, String nombre, String categoria, String detalle, double precio, double descuento, String foto) {
        this.id = id;
        this.nombre = nombre;
        this.categoria = categoria;
        this.detalle = detalle;
        this.precio = precio;
        this.descuento = descuento;
        this.foto = foto;
    }
    
    public Producto(int id, String nombre, String categoria, String detalle, double precio, double descuento, String foto, int cantidad) {
        this.id = id;
        this.nombre = nombre;
        this.categoria = categoria;
        this.detalle = detalle;
        this.precio = precio;
        this.descuento = descuento;
        this.foto = foto;
        this.cantidad = cantidad;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public double getDescuento() {
        return descuento;
    }

    public void setDescuento(double descuento) {
        this.descuento = descuento;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 29 * hash + this.id;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Producto other = (Producto) obj;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }
    
    
    //EL To String no tiene metido el atributo cantidad
    @Override
    public String toString() {
        return "Producto{" + "id=" + id + ", nombre=" + nombre + ", categoria=" + categoria + ", detalle=" + detalle + ", precio=" + precio + ", descuento=" + descuento + ", foto=" + foto + '}';
    }
    
}
