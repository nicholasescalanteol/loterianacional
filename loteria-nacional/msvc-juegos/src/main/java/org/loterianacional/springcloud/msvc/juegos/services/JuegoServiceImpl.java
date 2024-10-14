package org.loterianacional.springcloud.msvc.juegos.services;

import org.loterianacional.springcloud.msvc.juegos.models.entities.Juego;
import org.loterianacional.springcloud.msvc.juegos.repositories.JuegoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class JuegoServiceImpl implements  JuegoService{

    @Autowired
    private JuegoRepository repository;

    @Override
    public List<Juego> listarJuegos() {
        List<Object[]> results = repository.listarJuegos();
        List<Juego> juegos = new ArrayList<>();

        for (Object[] result : results) {
            Juego juego = new Juego();

            juego.setIdJuego((Integer) result[0]);
            juego.setNombre((String) result[1]);
            juego.setDescripcion((String) result[2]);

            juegos.add(juego);
        }

        return juegos;
    }

    @Override
    public List<Juego> listarJuegoPorId(Integer idJuego) {
        List<Object[]> results = repository.listarJuegoPorId(idJuego);
        List<Juego> juegos = new ArrayList<>();

        for (Object[] result : results) {
            Juego juego = new Juego();

            juego.setIdJuego((Integer) result[0]);
            juego.setNombre((String) result[1]);
            juego.setDescripcion((String) result[2]);

            juegos.add(juego);
        }

        return juegos;
    }
}
