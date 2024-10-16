package org.loterianacional.springcloud.msvc.juegos.controllers;

import org.loterianacional.springcloud.msvc.juegos.models.TicketSorteoCompra;
import org.loterianacional.springcloud.msvc.juegos.models.entities.Sorteo;
import org.loterianacional.springcloud.msvc.juegos.models.entities.TicketSorteo;
import org.loterianacional.springcloud.msvc.juegos.services.TicketSorteoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/api/juegos/sorteo/ticket")
public class TicketSorteoController {

    @Autowired
    private TicketSorteoService service;

    @GetMapping("/compraSorteo")
    public ResponseEntity<?> listarTicketSorteoPorCompraSorteo(@RequestParam("idCompraSorteo")  Integer idCompraSorteo){
        List<TicketSorteoCompra> ticketPorCompra = service.listarTicketSorteoPorCompraSorteo(idCompraSorteo);
        if(ticketPorCompra.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(ticketPorCompra);
    }

    /*
    @GetMapping("/usuario")
    public ResponseEntity<?> listarTicketSorteoPorDni(@RequestParam("dni")  String dni){
        List<TicketSorteo> ticketPorDni = service.listarTicketSorteoPorDni(dni);
        if(ticketPorDni.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(ticketPorDni);
    }
    */

}
