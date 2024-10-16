package org.loterianacional.springcloud.msvc.pagos.controllers;

import org.loterianacional.springcloud.msvc.pagos.models.entities.TipoVenta;
import org.loterianacional.springcloud.msvc.pagos.services.TipoVentaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/pagos/tipoVenta")
public class TipoVentaController {

    @Autowired
    private TipoVentaService service;

    @GetMapping("/")
    public List<TipoVenta> listarTipoVenta(){
        return service.listarTipoVenta();
    }

    @GetMapping("/{idTipoVenta}")
    public ResponseEntity<?> listarTipoVentaPorId(@PathVariable Integer idTipoVenta) {
        List<TipoVenta> tipoVenta = service.listarTipoVentaPorId(idTipoVenta);
        if (tipoVenta.isEmpty()) {
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(tipoVenta);
    }

}
