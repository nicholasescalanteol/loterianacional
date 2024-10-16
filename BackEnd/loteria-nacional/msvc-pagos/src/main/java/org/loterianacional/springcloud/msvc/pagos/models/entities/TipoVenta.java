package org.loterianacional.springcloud.msvc.pagos.models.entities;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
@Table(name = "pago.metodoPago")
public class TipoVenta {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idTipoVenta")
    private Integer idTipoVenta;

    @Column(name = "descripcion")
    private String descripcion;

}
