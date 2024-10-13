package org.loterianacional.springcloud.msvc.controllers;

import jakarta.validation.Valid;
import org.loterianacional.springcloud.msvc.models.entities.Usuario;
import org.loterianacional.springcloud.msvc.services.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin(origins = "http://localhost:3000")
@RequestMapping("/api/usuarios")
public class UsuarioController {

    @Autowired
    private UsuarioService service;

    @PostMapping("/registroDeUsuario")
    public ResponseEntity<?> insertarUsuario (@Valid @RequestBody Usuario usuario){
        service.insertarUsuario(usuario);
        return ResponseEntity.ok("Se registró al usuario.");
    }

    @PutMapping("/actualizacionDeUsuario/{dni}")
    public ResponseEntity<?> actualizarUsuario (@PathVariable String dni, @RequestBody Usuario usuario){
        service.actualizarUsuario(dni,usuario);
        return ResponseEntity.ok("Se actualizó al usuario.");
    }

    @DeleteMapping("/eliminacionDeUsuario/{dni}")
    public ResponseEntity<?> actualizarUsuario (@PathVariable String dni){
        service.eliminarUsuario(dni);
        return ResponseEntity.ok("Se eliminó al usuario.");
    }

    @GetMapping("/")
    public List<Usuario> listarUsuarios(){
        return service.listarUsuarios();
    }


    @GetMapping("/{dni}")
    public ResponseEntity<?> listarUsuarioPorDni(@PathVariable String dni){
        List<Usuario> usuarioPorDni = service.listarUsuarioPorDni(dni);
        if(usuarioPorDni.isEmpty()){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(usuarioPorDni.get(0));
    }

}
