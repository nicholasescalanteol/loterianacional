package org.loterianacional.springcloud.msvc.juegos.services;

import feign.FeignException;
import org.loterianacional.springcloud.msvc.juegos.clients.PagoClientRest;
import org.loterianacional.springcloud.msvc.juegos.models.CompraSorteoUsuario;
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

    @Autowired
    private TicketSorteoService ticketSorteoService;

    @Autowired
    private PagoClientRest client;

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

    public List<CompraSorteoUsuario> listarCompraSorteoPorUsuario_MsvcPago(Integer idUsuario) {
        List<CompraSorteoUsuario> results = listarCompraSorteoPorUsuario_MsvcPago_Client(idUsuario);
        List<CompraSorteoUsuario> sorteos = new ArrayList<>();

        for(CompraSorteoUsuario result : results){
            CompraSorteoUsuario sorteo = new CompraSorteoUsuario();

            sorteo.setIdCompraSorteo(result.getIdCompraSorteo());
            sorteo.setJuego(result.getJuego());
            sorteo.setFechaSorteo(result.getFechaSorteo());
            sorteo.setFechaCompra(result.getFechaCompra());
            sorteo.setCatidadTickets(result.getCatidadTickets());
            sorteo.setEstadoPago(result.getEstadoPago());
            sorteo.setPremio(result.getPremio());
            sorteo.setMonto(result.getMonto());
            sorteo.setTickets(ticketSorteoService.listarTicketSorteoPorCompraSorteo(result.getIdCompraSorteo()));

            sorteos.add(sorteo);
        }
        return sorteos;
    }

    @Override
    public List<CompraSorteoUsuario> listarCompraSorteoPorUsuario_MsvcPago_Client(Integer idUsuario) {
        try {
            return client.listarCompraSorteoPorUsuario(idUsuario);
        } catch (FeignException e) {
            return client.listarCompraSorteoPorUsuarioFallback(idUsuario, e);
        }
    }

}
