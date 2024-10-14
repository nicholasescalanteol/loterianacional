package org.loterianacional.springcloud.msvc.juegos.models.entities;

import jakarta.persistence.*;

@Entity
@Table(name="dbo.TicketSorteo")
public class TicketSorteo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idTicketSorteo")
    private Integer idTicketSorteo;

    @Column(name = "idSorteo")
    private Integer idSorteo;

    @Column(name = "idTipoUsuario")
    private Integer idTipoUsuario;

    @Column(name = "idUsuario")
    private Integer idUsuario;

    @Column(name = "dni")
    private String dni;

    public TicketSorteo(){}
    public TicketSorteo(Integer idTicketSorteo, Integer idSorteo, Integer idTipoUsuario, Integer idUsuario, String dni) {
        this.idTicketSorteo = idTicketSorteo;
        this.idSorteo = idSorteo;
        this.idTipoUsuario = idTipoUsuario;
        this.idUsuario = idUsuario;
        this.dni = dni;
    }

    public Integer getIdTicketSorteo() {
        return idTicketSorteo;
    }

    public void setIdTicketSorteo(Integer idTicketSorteo) {
        this.idTicketSorteo = idTicketSorteo;
    }

    public Integer getIdSorteo() {
        return idSorteo;
    }

    public void setIdSorteo(Integer idSorteo) {
        this.idSorteo = idSorteo;
    }

    public Integer getIdTipoUsuario() {
        return idTipoUsuario;
    }

    public void setIdTipoUsuario(Integer idTipoUsuario) {
        this.idTipoUsuario = idTipoUsuario;
    }

    public Integer getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(Integer idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }
}
