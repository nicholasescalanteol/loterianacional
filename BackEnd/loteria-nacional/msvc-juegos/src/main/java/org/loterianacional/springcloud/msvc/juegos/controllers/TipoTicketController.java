package org.loterianacional.springcloud.msvc.juegos.controllers;

import org.loterianacional.springcloud.msvc.juegos.models.entities.Juego;
import org.loterianacional.springcloud.msvc.juegos.models.entities.TipoTicket;
import org.loterianacional.springcloud.msvc.juegos.services.TipoTicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/juegos/sorteo/tipoTicket")
public class TipoTicketController {

    @Autowired
    private TipoTicketService service;

    @GetMapping("/")
    public List<TipoTicket> listarTipoTicket(){
        return service.listarTipoTicket();
    }

}
