package org.loterianacional.springcloud.msvc.services;

import org.loterianacional.springcloud.msvc.models.entities.Departamento;
import org.loterianacional.springcloud.msvc.models.entities.TipoDocumento;
import org.loterianacional.springcloud.msvc.repositories.TipoDocumentoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class TipoDocumentoServiceImpl implements TipoDocumentoService{

    @Autowired
    private TipoDocumentoRepository repository;

    @Override
    public List<TipoDocumento> listarTipoDocumento() {

        List<Object[]> results = repository.listarTipoDocumento();
        List<TipoDocumento> tipoDocumentos = new ArrayList<>();

        for(Object [] result : results){
            TipoDocumento tipoDocumento = new TipoDocumento();

            tipoDocumento.setIdTipoDocumento((Integer) result[0]);
            tipoDocumento.setDescripcion((String) result[1]);

            tipoDocumentos.add(tipoDocumento);
        }

        return tipoDocumentos;

    }
}
