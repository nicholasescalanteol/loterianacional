package org.loterianacional.springcloud.msvc.juegos.services;

import org.loterianacional.springcloud.msvc.juegos.models.TicketSorteoCompra;
import org.loterianacional.springcloud.msvc.juegos.models.entities.TicketSorteo;

import java.util.List;

public interface TicketSorteoService {

    List<TicketSorteoCompra> listarTicketSorteoPorCompraSorteo(Integer idCompraSorteo);

}
