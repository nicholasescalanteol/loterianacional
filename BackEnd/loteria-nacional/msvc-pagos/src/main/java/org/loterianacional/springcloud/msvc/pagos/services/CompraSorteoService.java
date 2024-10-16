package org.loterianacional.springcloud.msvc.pagos.services;

import org.loterianacional.springcloud.msvc.pagos.models.CompraSorteoUsuario;

import java.util.List;

public interface CompraSorteoService {

    List<CompraSorteoUsuario> listarCompraSorteoPorUsuario(Integer idUsuario);

}
