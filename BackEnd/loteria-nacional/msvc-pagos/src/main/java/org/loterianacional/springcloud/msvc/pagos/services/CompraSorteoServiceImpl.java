package org.loterianacional.springcloud.msvc.pagos.services;

import org.loterianacional.springcloud.msvc.pagos.models.CompraSorteoUsuario;
import org.loterianacional.springcloud.msvc.pagos.repositories.CompraSorteoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class CompraSorteoServiceImpl implements CompraSorteoService {

    @Autowired
    private CompraSorteoRepository repository;

    @Override
    public List<CompraSorteoUsuario> listarCompraSorteoPorUsuario(Integer idUsuario) {

        List<Object[]> results = repository.listarCompraSorteoPorUsuario(idUsuario);
        List<CompraSorteoUsuario> comprasSorteoUsuario= new ArrayList<>();

        for (Object[] result : results){
            CompraSorteoUsuario compraSorteoUsuario = new CompraSorteoUsuario();
            compraSorteoUsuario.setIdCompraSorteo((Integer) result[0]);
            compraSorteoUsuario.setJuego((String) result[1]);
            compraSorteoUsuario.setFechaSorteo((Date) result[2]);
            compraSorteoUsuario.setFechaCompra((Date) result[3]);
            compraSorteoUsuario.setCatidadTickets((Integer) result[4]);
            compraSorteoUsuario.setEstadoPago((String) result[5]);
            compraSorteoUsuario.setPremio((String) result[6]);
            compraSorteoUsuario.setMonto(((BigDecimal) result[7]).doubleValue());
            comprasSorteoUsuario.add(compraSorteoUsuario);
        }

        return comprasSorteoUsuario;
    }

}
