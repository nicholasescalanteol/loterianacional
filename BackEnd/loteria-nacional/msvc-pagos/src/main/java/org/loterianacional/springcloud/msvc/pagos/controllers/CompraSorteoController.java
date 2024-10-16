package org.loterianacional.springcloud.msvc.pagos.controllers;

import org.loterianacional.springcloud.msvc.pagos.models.CompraSorteoUsuario;
import org.loterianacional.springcloud.msvc.pagos.services.CompraSorteoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/pagos/compraSorteo")
public class CompraSorteoController {

    @Autowired
    private CompraSorteoService service;

    @GetMapping("/sorteos")
    public ResponseEntity<?> listarCompraSorteoPorUsuario(@RequestParam("idUsuario")  Integer idUsuario) {
        List<CompraSorteoUsuario> estadoPago = service.listarCompraSorteoPorUsuario(idUsuario);
        if (estadoPago.isEmpty()) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(estadoPago);
    }

}
