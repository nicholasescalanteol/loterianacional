package org.loterianacional.springcloud.msvc.juegos.models.entities;

import jakarta.persistence.*;

import java.util.Date;

@Entity
@Table(name="dbo.Sorteo")
public class Sorteo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idSorteo")
    private Integer idSorteo;

    @Column(name = "idJuego")
    private Integer idJuego;

    @Column(name = "fechaSorteo")
    private Date fechaSorteo;

    @Column(name = "ticketGanador")
    private String ticketGanador;

    @Column(name = "activo")
    private Boolean activo;

    public Sorteo(){}
    public Sorteo(Integer idSorteo, Integer idJuego, Date fechaSorteo, String ticketGanador, Boolean activo) {
        this.idSorteo = idSorteo;
        this.idJuego = idJuego;
        this.fechaSorteo = fechaSorteo;
        this.ticketGanador = ticketGanador;
        this.activo = activo;
    }

    public Integer getIdSorteo() {
        return idSorteo;
    }

    public void setIdSorteo(Integer idSorteo) {
        this.idSorteo = idSorteo;
    }

    public Integer getIdJuego() {
        return idJuego;
    }

    public void setIdJuego(Integer idJuego) {
        this.idJuego = idJuego;
    }

    public Date getFechaSorteo() {
        return fechaSorteo;
    }

    public void setFechaSorteo(Date fechaSorteo) {
        this.fechaSorteo = fechaSorteo;
    }

    public String getTicketGanador() {
        return ticketGanador;
    }

    public void setTicketGanador(String ticketGanador) {
        this.ticketGanador = ticketGanador;
    }

    public Boolean getActivo() {
        return activo;
    }

    public void setActivo(Boolean activo) {
        this.activo = activo;
    }
}
