package org.loterianacional.springcloud.msvc.pagos.models;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;

import java.util.Date;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class CompraSorteoUsuario {

    private Integer idCompraSorteo;
    private String juego;

    private Date fechaSorteo;

    private Date fechaCompra;
    private Integer catidadTickets;
    private String estadoPago;
    private String premio;
    private Double monto;

}
