package org.loterianacional.springcloud.msvc.juegos.services;

import org.loterianacional.springcloud.msvc.juegos.models.TicketSorteoCompra;
import org.loterianacional.springcloud.msvc.juegos.models.TicketSorteoFisico;
import org.loterianacional.springcloud.msvc.juegos.models.TicketSorteoVirtual;
import org.loterianacional.springcloud.msvc.juegos.models.entities.TicketSorteo;

import java.util.List;

public interface TicketSorteoService {

    void insertarTicketSorteoVirtual(TicketSorteoVirtual ticketSorteo);
    void insertarTicketSorteoFisico(TicketSorteoFisico ticketSorteo);
    List<TicketSorteoCompra> listarTicketSorteoPorCompraSorteo(Integer idCompraSorteo);


}
