package org.loterianacional.springcloud.msvc.pagos.services;

import org.loterianacional.springcloud.msvc.pagos.models.CompraSorteoUsuario;
import org.loterianacional.springcloud.msvc.pagos.models.entities.CompraSorteo;

import java.util.List;

public interface CompraSorteoService {

    List<CompraSorteoUsuario> listarCompraSorteoPorUsuario(Integer idUsuario);

    List<CompraSorteoUsuario> listarCompraSorteoPorSorteo(Integer idSorteo);

    void insertarCompraSorteo(CompraSorteo compraSorteo);

    void eliminarCompraSorteo(Integer idCompraSorteo);

}
