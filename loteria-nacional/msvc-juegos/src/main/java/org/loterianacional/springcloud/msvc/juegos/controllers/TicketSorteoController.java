package org.loterianacional.springcloud.msvc.juegos.controllers;

import org.loterianacional.springcloud.msvc.juegos.models.entities.Sorteo;
import org.loterianacional.springcloud.msvc.juegos.models.entities.TicketSorteo;
import org.loterianacional.springcloud.msvc.juegos.services.TicketSorteoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
@RequestMapping("/api/juegos/sorteo/ticket")
public class TicketSorteoController {

    @Autowired
    private TicketSorteoService service;

    @GetMapping("/")
    public List<TicketSorteo> listarTicketSorteo(){
        return service.listarTicketSorteo();
    }


    @GetMapping("/{id}")
    public ResponseEntity<?> listarTicketSorteoPorId(@PathVariable Integer idTicketSorteo){
        List<TicketSorteo> ticketSorteoPorId = service.listarTicketSorteoPorId(idTicketSorteo);
        if(ticketSorteoPorId.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(ticketSorteoPorId.get(0));
    }

    @GetMapping("/usuario/{dni}")
    public ResponseEntity<?> listarTicketSorteoPorDni(@PathVariable String dni){
        List<TicketSorteo> ticketPorDni = service.listarTicketSorteoPorDni(dni);
        if(ticketPorDni.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(ticketPorDni.get(0));
    }

}
