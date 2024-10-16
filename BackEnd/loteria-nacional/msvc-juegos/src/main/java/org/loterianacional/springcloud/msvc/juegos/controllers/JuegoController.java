package org.loterianacional.springcloud.msvc.juegos.controllers;

import org.loterianacional.springcloud.msvc.juegos.models.entities.Juego;
import org.loterianacional.springcloud.msvc.juegos.services.JuegoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/juegos")
public class JuegoController {

    @Autowired
    private JuegoService service;

    @GetMapping("/")
    public List<Juego> listarJuegos(){
        return service.listarJuegos();
    }


    @GetMapping("/{idJuego}")
    public ResponseEntity<?> listarJuegoPorId(@PathVariable Integer idJuego){
        List<Juego> juegoPorId = service.listarJuegoPorId(idJuego);
        if(juegoPorId.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(juegoPorId.get(0));
    }

}
