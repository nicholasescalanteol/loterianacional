package org.loterianacional.springcloud.msvc.pagos.services;

import org.loterianacional.springcloud.msvc.pagos.models.entities.MetodoPago;
import org.loterianacional.springcloud.msvc.pagos.models.entities.TipoVenta;
import org.loterianacional.springcloud.msvc.pagos.repositories.TipoVentaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TipoVentaServiceImpl implements TipoVentaService{

    @Autowired
    private TipoVentaRepository repository;

    @Override
    public List<TipoVenta> listarTipoVenta() {
        List<Object[]> results = repository.listarTipoVenta();
        List<TipoVenta> tiposVenta = new ArrayList<>();

        for(Object [] result : results){
            TipoVenta tipoVenta = new TipoVenta();

            tipoVenta.setIdTipoVenta((Integer) result[0]);
            tipoVenta.setDescripcion((String) result[1]);

            tiposVenta.add(tipoVenta);
        }

        return tiposVenta;
    }

    @Override
    public List<TipoVenta> listarTipoVentaPorId(Integer idTipoVenta) {
        List<Object[]> results = repository.listarTipoVentaPorId(idTipoVenta);
        List<TipoVenta> tiposVenta = new ArrayList<>();

        for(Object [] result : results){
            TipoVenta tipoVenta = new TipoVenta();

            tipoVenta.setIdTipoVenta((Integer) result[0]);
            tipoVenta.setDescripcion((String) result[1]);

            tiposVenta.add(tipoVenta);
        }

        return tiposVenta;
    }
}
