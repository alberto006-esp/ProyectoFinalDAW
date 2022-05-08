/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author alber
 */
public class Usuario {
    String nombre;
    String apellidos;
    String tipo;
    String email;
    String usuario;
    String pass;
    String direccion;
    int telefono;

    public Usuario(String nombre, String apellidos, String tipo, String email, String usuario, String pass, String direccion, int telefono) {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.tipo = tipo;
        this.email = email;
        this.usuario = usuario;
        this.pass = pass;
        this.direccion = direccion;
        this.telefono = telefono;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    @Override
    public String toString() {
        return "Usuario{" + "nombre=" + nombre + ", apellidos=" + apellidos + ", tipo=" + tipo + ", email=" + email + ", usuario=" + usuario + ", pass=" + pass + ", direccion=" + direccion + ", telefono=" + telefono + '}';
    }
    
}
