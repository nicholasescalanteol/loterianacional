package org.loterianacional.springcloud.msvc.juegos.services;

import org.loterianacional.springcloud.msvc.juegos.models.CompraSorteoUsuario;
import org.loterianacional.springcloud.msvc.juegos.models.entities.Sorteo;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface SorteoService {
    List<Sorteo> listarSorteos();
    List<Sorteo> listarSorteoPorId(Integer idSorteo);

    //MSVC Pagos
    List<CompraSorteoUsuario> listarCompraSorteoPorUsuario_MsvcPago(Integer idUsuario);
    List<CompraSorteoUsuario> listarCompraSorteoPorUsuario_MsvcPago_Client(Integer idUsuario);

}
