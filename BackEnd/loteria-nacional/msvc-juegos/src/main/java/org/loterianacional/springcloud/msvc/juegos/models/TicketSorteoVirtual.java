package org.loterianacional.springcloud.msvc.juegos.models;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class TicketSorteoVirtual {

    private Integer limiteInferior;
    private Integer cantidadTickets;
    private Integer idCompraSorteo;

}
