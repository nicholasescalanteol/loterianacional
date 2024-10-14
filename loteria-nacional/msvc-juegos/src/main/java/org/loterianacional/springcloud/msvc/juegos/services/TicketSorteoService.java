package org.loterianacional.springcloud.msvc.juegos.services;

import org.loterianacional.springcloud.msvc.juegos.models.entities.TicketSorteo;

import java.util.List;

public interface TicketSorteoService {

    List<TicketSorteo> listarTicketSorteo();
    List<TicketSorteo> listarTicketSorteoPorId(Integer idTicketSorteo);
    List<TicketSorteo> listarTicketSorteoPorDni(String dni);

}
