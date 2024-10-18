package org.loterianacional.springcloud.msvc.juegos.services;

import org.loterianacional.springcloud.msvc.juegos.models.CompraSorteoUsuario;
import org.loterianacional.springcloud.msvc.juegos.models.entities.Sorteo;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface SorteoService {

    void insertarSorteo(Sorteo sorteo);

    void actualizarSorteo(Integer idSorteo, Sorteo sorteo);

    void actualizarTicketGanadorSorteo(Integer idSorteo, Sorteo sorteo);

    void eliminarSorteo(Integer idSorteo);
    List<Sorteo> listarSorteos();
    List<Sorteo> listarSorteoPorId(Integer idSorteo);

    List<Sorteo> listarSorteoPorJuego(Integer idJuego);

    //MSVC Pagos
    List<CompraSorteoUsuario> listarCompraSorteoPorUsuario_MsvcPago(Integer idUsuario);
    List<CompraSorteoUsuario> listarCompraSorteoPorUsuario_MsvcPago_Client(Integer idUsuario);

}
