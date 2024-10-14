package org.loterianacional.springcloud.msvc.controllers;

import org.loterianacional.springcloud.msvc.models.entities.TipoDocumento;
import org.loterianacional.springcloud.msvc.services.TipoDocumentoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.util.List;

@RestController
@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/api/tipoDocumento")
public class TipoDocumentoController {

    @Autowired
    private TipoDocumentoService service;

    @GetMapping("/")
    public List<TipoDocumento> listarTipoDocumento(){
        return service.listarTipoDocumento();
    }

}
