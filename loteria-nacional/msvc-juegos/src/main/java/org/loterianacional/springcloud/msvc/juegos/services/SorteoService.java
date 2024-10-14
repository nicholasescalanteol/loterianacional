package org.loterianacional.springcloud.msvc.juegos.services;

import org.loterianacional.springcloud.msvc.juegos.models.entities.Sorteo;

import java.util.List;

public interface SorteoService {
    List<Sorteo> listarSorteos();
    List<Sorteo> listarSorteoPorId(Integer idSorteo);

}
