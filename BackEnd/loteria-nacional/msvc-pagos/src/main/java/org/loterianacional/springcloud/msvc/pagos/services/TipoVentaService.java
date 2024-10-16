package org.loterianacional.springcloud.msvc.pagos.services;

import org.loterianacional.springcloud.msvc.pagos.models.entities.TipoVenta;

import java.util.List;

public interface TipoVentaService {

    List<TipoVenta> listarTipoVenta();

    List<TipoVenta> listarTipoVentaPorId(Integer idTipoVenta);

}
