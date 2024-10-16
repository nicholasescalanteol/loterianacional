package org.loterianacional.springcloud.msvc.juegos.services;

import org.loterianacional.springcloud.msvc.juegos.models.entities.Juego;

import java.util.List;

public interface JuegoService {

    List<Juego> listarJuegos();
    List<Juego> listarJuegoPorId(Integer idJuego);

}
