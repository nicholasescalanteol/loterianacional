package org.loterianacional.springcloud.msvc.models.entities;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;

import java.util.Date;

@Entity
@Table(name="dbo.Usuario")
public class Usuario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idUsuario")
    private Integer idUsuario;

    //@NotEmpty(message = "El campo nombres es obligatorio")
    @Column(name = "nombres")
    private String nombres;
    //@NotEmpty(message = "El campo apellidos es obligatorio")
    @Column(name = "apellidos")
    private String apellidos;
    //@NotEmpty(message = "El campo dni es obligatorio")
    @Column(name = "dni")
    private String dni;
    //@NotEmpty(message = "El campo fecha de nacimiento es obligatorio")
    @Column(name = "fechaNacimiento")
    private Date fechaNacimiento;
    //@NotEmpty(message = "El campo tipo de documento es obligatorio")
    @Column(name = "idTipoDocumento")
    private Integer idTipoDocumento;
    //@NotEmpty(message = "El campo email es obligatorio")
    @Email
    @Column(name = "email")
    private String email;
    //@NotEmpty(message = "El campo direccion es obligatorio")
    @Column(name = "direccion")
    private String direccion;
    //@NotEmpty(message = "El campo departamento es obligatorio")
    @Column(name = "idDepartamento")
    private String idDepartamento;
    //@NotEmpty(message = "El campo provincia es obligatorio")
    @Column(name = "idProvincia")
    private String idProvincia;
    //@NotEmpty(message = "El campo distrito es obligatorio")
    @Column(name = "idDistrito")
    private String idDistrito;
    //@NotEmpty(message = "El campo codigo postal es obligatorio")
    @Column(name = "codigoPostal")
    private String codigoPostal;
    //@NotEmpty(message = "El campo contraseña es obligatorio")
    @Column(name = "contrasena")
    private String contrasena;
    //@NotEmpty(message = "El campo celular es obligatorio")
    @Column(name = "celular")
    private String celular;
    //@NotEmpty(message = "El campo tipo usuario es obligatorio")
    @Column(name = "idTipoUsuario")
    private Integer idTipoUsuario;
    //@NotEmpty(message = "El campo estado es obligatorio")
    @Column(name = "activo")
    private Boolean activo;

    //Constructores
    public Usuario(){}

    public Usuario(Integer idUsuario, String nombres, String apellidos, String dni, Date fechaNacimiento, Integer idTipoDocumento, String email, String direccion, String idDepartamento, String idProvincia, String idDistrito, String codigoPostal, String contrasena, String celular, Integer idTipoUsuario, Boolean activo) {
        this.idUsuario = idUsuario;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.dni = dni;
        this.fechaNacimiento = fechaNacimiento;
        this.idTipoDocumento = idTipoDocumento;
        this.email = email;
        this.direccion = direccion;
        this.idDepartamento = idDepartamento;
        this.idProvincia = idProvincia;
        this.idDistrito = idDistrito;
        this.codigoPostal = codigoPostal;
        this.contrasena = contrasena;
        this.celular = celular;
        this.idTipoUsuario = idTipoUsuario;
        this.activo = activo;
    }

    //Getter and Setter

    public Integer getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public Integer getIdTipoDocumento() {
        return idTipoDocumento;
    }

    public void setIdTipoDocumento(Integer idTipoDocumento) {
        this.idTipoDocumento = idTipoDocumento;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getIdDepartamento() {
        return idDepartamento;
    }

    public void setIdDepartamento(String idDepartamento) {
        this.idDepartamento = idDepartamento;
    }

    public String getIdProvincia() {
        return idProvincia;
    }

    public void setIdProvincia(String idProvincia) {
        this.idProvincia = idProvincia;
    }

    public String getIdDistrito() {
        return idDistrito;
    }

    public void setIdDistrito(String idDistrito) {
        this.idDistrito = idDistrito;
    }

    public String getCodigoPostal() {
        return codigoPostal;
    }

    public void setCodigoPostal(String codigoPostal) {
        this.codigoPostal = codigoPostal;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public Integer getIdTipoUsuario() {
        return idTipoUsuario;
    }

    public void setIdTipoUsuario(Integer idTipoUsuario) {
        this.idTipoUsuario = idTipoUsuario;
    }

    public Boolean getActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }
}
