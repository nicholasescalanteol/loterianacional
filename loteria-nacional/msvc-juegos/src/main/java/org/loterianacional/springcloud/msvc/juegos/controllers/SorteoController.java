package org.loterianacional.springcloud.msvc.juegos.controllers;

import org.loterianacional.springcloud.msvc.juegos.models.entities.Sorteo;
import org.loterianacional.springcloud.msvc.juegos.services.SorteoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/juegos/sorteo")
public class SorteoController {

    @Autowired
    private SorteoService service;

    @GetMapping("/")
    public List<Sorteo> listarSorteos(){
        return service.listarSorteos();
    }


    @GetMapping("/{id}")
    public ResponseEntity<?> listarSorteoPorId(@PathVariable Integer idSorteo){
        List<Sorteo> sorteoPorId = service.listarSorteoPorId(idSorteo);
        if(sorteoPorId.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(sorteoPorId.get(0));
    }

}
