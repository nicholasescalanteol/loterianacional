package org.loterianacional.springcloud.msvc.juegos.services;

import org.loterianacional.springcloud.msvc.juegos.models.entities.TicketSorteo;
import org.loterianacional.springcloud.msvc.juegos.repositories.TicketSorteoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TicketSorteoServiceImpl implements TicketSorteoService{

    @Autowired
    private TicketSorteoRepository repository;

    @Override
    public List<TicketSorteo> listarTicketSorteo() {
        List<Object[]> results = repository.listarTicketSorteo();
        List<TicketSorteo> ticketsSorteo = new ArrayList<>();

        for (Object[] result : results) {
            TicketSorteo ticketSorteo = new TicketSorteo();

            ticketSorteo.setIdTicketSorteo((Integer) result[0]);
            ticketSorteo.setIdSorteo((Integer) result[1]);
            ticketSorteo.setIdTipoUsuario((Integer) result[2]);
            ticketSorteo.setIdUsuario((Integer) result[3]);
            ticketSorteo.setDni((String) result[4]);

            ticketsSorteo.add(ticketSorteo);

        }

        return ticketsSorteo;
    }

    @Override
    public List<TicketSorteo> listarTicketSorteoPorId(Integer idTicketSorteo) {
        List<Object[]> results = repository.listarTicketSorteoPorId(idTicketSorteo);
        List<TicketSorteo> ticketsSorteo = new ArrayList<>();

        for (Object[] result : results) {
            TicketSorteo ticketSorteo = new TicketSorteo();

            ticketSorteo.setIdTicketSorteo((Integer) result[0]);
            ticketSorteo.setIdSorteo((Integer) result[1]);
            ticketSorteo.setIdTipoUsuario((Integer) result[2]);
            ticketSorteo.setIdUsuario((Integer) result[3]);
            ticketSorteo.setDni((String) result[4]);

            ticketsSorteo.add(ticketSorteo);

        }

        return ticketsSorteo;
    }

    @Override
    public List<TicketSorteo> listarTicketSorteoPorDni(String dni) {
        List<Object[]> results = repository.listarTicketSorteoPorDni(dni);
        List<TicketSorteo> ticketsSorteo = new ArrayList<>();

        for (Object[] result : results) {
            TicketSorteo ticketSorteo = new TicketSorteo();

            ticketSorteo.setIdTicketSorteo((Integer) result[0]);
            ticketSorteo.setIdSorteo((Integer) result[1]);
            ticketSorteo.setIdTipoUsuario((Integer) result[2]);
            ticketSorteo.setIdUsuario((Integer) result[3]);
            ticketSorteo.setDni((String) result[4]);

            ticketsSorteo.add(ticketSorteo);

        }

        return ticketsSorteo;
    }
}
