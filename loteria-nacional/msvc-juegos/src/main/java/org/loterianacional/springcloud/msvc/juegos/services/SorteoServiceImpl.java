package org.loterianacional.springcloud.msvc.juegos.services;

import org.loterianacional.springcloud.msvc.juegos.models.entities.Sorteo;
import org.loterianacional.springcloud.msvc.juegos.repositories.SorteoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

@Service
public class SorteoServiceImpl implements  SorteoService{


    @Autowired
    private SorteoRepository repository;

    @Override
    public List<Sorteo> listarSorteos() {
        List<Object[]> results = repository.listarSorteos();
        List<Sorteo> sorteos = new ArrayList<>();

        for (Object[] result : results) {
            Sorteo sorteo = new Sorteo();

            sorteo.setIdSorteo((Integer) result[0]);
            sorteo.setIdJuego((Integer) result[1]);
            sorteo.setFechaSorteo((Date) result[2]);
            sorteo.setTicketGanador((String) result[3]);
            sorteo.setActivo((Boolean) result[4]);

            sorteos.add(sorteo);
        }

        return sorteos;
    }

    @Override
    public List<Sorteo> listarSorteoPorId(Integer idSorteo) {
        List<Object[]> results = repository.listarSorteoPorId(idSorteo);
        List<Sorteo> sorteos = new ArrayList<>();

        for (Object[] result : results) {
            Sorteo sorteo = new Sorteo();

            sorteo.setIdSorteo((Integer) result[0]);
            sorteo.setIdJuego((Integer) result[1]);
            sorteo.setFechaSorteo((Date) result[2]);
            sorteo.setTicketGanador((String) result[3]);
            sorteo.setActivo((Boolean) result[4]);

            sorteos.add(sorteo);
        }

        return sorteos;
    }
}
