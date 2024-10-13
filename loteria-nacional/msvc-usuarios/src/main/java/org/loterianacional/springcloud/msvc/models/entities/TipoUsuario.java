package org.loterianacional.springcloud.msvc.models.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "dbo.tipoUsuario")
public class TipoUsuario {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idTipoUsuario")
    private Integer idTipoUsuario;
    @Column(name = "descripcion")
    private String descripcion;


    public TipoUsuario(){}
    public TipoUsuario(Integer idTipoUsuario, String descripcion) {
        this.idTipoUsuario = idTipoUsuario;
        this.descripcion = descripcion;
    }

    public Integer getIdTipoUsuario() {
        return idTipoUsuario;
    }

    public void setIdTipoUsuario(Integer idTipoUsuario) {
        this.idTipoUsuario = idTipoUsuario;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
