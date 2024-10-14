package org.loterianacional.springcloud.msvc.repositories;

import org.loterianacional.springcloud.msvc.models.entities.TipoDocumento;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TipoDocumentoRepository extends JpaRepository<TipoDocumento, Integer> {

    @Query(value = "EXEC dbo.spListarTipoDocumento",nativeQuery = true)
    List<Object[]> listarTipoDocumento();

}
