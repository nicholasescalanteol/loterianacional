package org.loterianacional.springcloud.msvc.juegos.models.entities;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
@Table(name="juego.pack")
public class Pack {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idPack")
    private Integer idPack;

    @Column(name = "descripcion")
    private String descripcion;

    @Column(name = "multiplicador")
    private Double multiplicador;

    @Column(name = "monto")
    private Double monto;

    @Column(name = "activo")
    private Boolean activo;

}
