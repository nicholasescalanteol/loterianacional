package org.loterianacional.springcloud.msvc.juegos.services;

import org.loterianacional.springcloud.msvc.juegos.models.TicketSorteoCompra;
import org.loterianacional.springcloud.msvc.juegos.models.TicketSorteoFisico;
import org.loterianacional.springcloud.msvc.juegos.models.TicketSorteoVirtual;
import org.loterianacional.springcloud.msvc.juegos.models.entities.TicketSorteo;
import org.loterianacional.springcloud.msvc.juegos.repositories.TicketSorteoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class TicketSorteoServiceImpl implements TicketSorteoService{

    @Autowired
    private TicketSorteoRepository repository;

    @Override
    @Transactional
    public void insertarTicketSorteoVirtual(TicketSorteoVirtual ticketSorteo) {
        repository.insertarTicketSorteoVirtual(ticketSorteo.getLimiteInferior(), ticketSorteo.getCantidadTickets(), ticketSorteo.getIdCompraSorteo());
    }

    @Override
    @Transactional
    public void insertarTicketSorteoFisico(TicketSorteoFisico ticketSorteo) {
        repository.insertarTicketSorteoFisico(ticketSorteo.getNumeroTicketInicial(), ticketSorteo.getCantidadTickets(), ticketSorteo.getIdCompraSorteo());
    }


    @Override
    public List<TicketSorteoCompra> listarTicketSorteoPorCompraSorteo(Integer idCompraSorteo) {
        List<Object[]> results = repository.listarTicketSorteoPorCompraSorteo(idCompraSorteo);
        List<TicketSorteoCompra> ticketsSorteo = new ArrayList<>();

        for (Object[] result : results) {
            TicketSorteoCompra ticketSorteo = new TicketSorteoCompra();

            ticketSorteo.setIdTicketSorteo((Integer) result[0]);
            ticketSorteo.setNumeroTicket((Integer) result[1]);
            ticketSorteo.setFecha((Date) result[2]);
            ticketSorteo.setIdTipoResultado((Integer) result[3]);
            ticketSorteo.setResultado((String) result[4]);

            ticketsSorteo.add(ticketSorteo);

        }

        return ticketsSorteo;
    }
}
