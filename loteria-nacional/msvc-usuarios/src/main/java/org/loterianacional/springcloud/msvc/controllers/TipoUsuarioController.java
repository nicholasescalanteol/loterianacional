package org.loterianacional.springcloud.msvc.controllers;

import org.loterianacional.springcloud.msvc.models.entities.TipoUsuario;
import org.loterianacional.springcloud.msvc.services.TipoUsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.CrossOrigin;

import java.util.List;

@RestController
@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/api/tipoUsuario")
public class TipoUsuarioController {

    @Autowired
    private TipoUsuarioService service;

    @GetMapping("/")
    public List<TipoUsuario> listarTipoUsuario(){
        return service.listarTipoUsuario();
    }

}
