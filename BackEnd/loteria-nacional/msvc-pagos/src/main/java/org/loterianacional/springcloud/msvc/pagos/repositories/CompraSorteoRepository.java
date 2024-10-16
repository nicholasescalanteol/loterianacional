package org.loterianacional.springcloud.msvc.pagos.repositories;

import org.loterianacional.springcloud.msvc.pagos.models.entities.CompraSorteo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CompraSorteoRepository extends JpaRepository<CompraSorteo, Integer> {

    @Query(value = "EXEC pago.spListarCompraSorteoPorUsuario :idUsuario",nativeQuery = true)
    List<Object[]> listarCompraSorteoPorUsuario(@Param("idUsuario") Integer idUsuario);

}
