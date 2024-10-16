package org.loterianacional.springcloud.msvc.pagos.repositories;

import feign.Param;
import org.loterianacional.springcloud.msvc.pagos.models.entities.TipoVenta;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TipoVentaRepository extends JpaRepository<TipoVenta, Integer> {


    @Query(value = "EXEC pago.spListarTipoVenta",nativeQuery = true)
    List<Object[]> listarTipoVenta();

    @Query(value = "EXEC pago.spListarTipoVentaPorId :idTipoVenta",nativeQuery = true)
    List<Object[]> listarTipoVentaPorId(@Param("idTipoVenta") Integer idTipoVenta);

}
