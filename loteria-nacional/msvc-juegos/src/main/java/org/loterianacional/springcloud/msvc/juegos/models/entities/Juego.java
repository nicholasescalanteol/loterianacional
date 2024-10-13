package org.loterianacional.springcloud.msvc.juegos.models.entities;

import jakarta.persistence.*;

@Entity
@Table(name="dbo.Juego")
public class Juego {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idJuego")
    private Integer idJuego;
    @Column(name = "nombre")
    private String nombre;
    @Column(name = "descripcion")
    private String descripcion;

    public Juego(){}
    public Juego(Integer idJuego, String nombre, String descripcion) {
        this.idJuego = idJuego;
        this.nombre = nombre;
        this.descripcion = descripcion;
    }

    public Integer getIdJuego() {
        return idJuego;
    }

    public void setIdJuego(Integer idJuego) {
        this.idJuego = idJuego;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
