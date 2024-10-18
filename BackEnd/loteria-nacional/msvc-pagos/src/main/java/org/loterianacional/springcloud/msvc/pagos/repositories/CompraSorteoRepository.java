package org.loterianacional.springcloud.msvc.pagos.repositories;

import org.loterianacional.springcloud.msvc.pagos.models.entities.CompraSorteo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

@Repository
public interface CompraSorteoRepository extends JpaRepository<CompraSorteo, Integer> {

    @Query(value = "EXEC pago.spListarCompraSorteoPorUsuario :idUsuario",nativeQuery = true)
    List<Object[]> listarCompraSorteoPorUsuario(@Param("idUsuario") Integer idUsuario);

    @Query(value = "EXEC pago.spListarCompraSorteoPorSorteo :idSorteo",nativeQuery = true)
    List<Object[]> listarCompraSorteoPorSorteo(@Param("idSorteo") Integer idSorteo);

    @Modifying
    @Query(value = "EXEC pago.spCrearNuevaCompraSorteo " +
            ":idSorteo, " +
            ":idUsuario, " +
            ":idTipoUsuario, " +
            ":cantidadInicial, " +
            ":cantidadFinal, " +
            ":idTipoTicket, " +
            ":monto, " +
            ":idMetodoPago, " +
            ":idPack, " +
            ":idCodigoPromocional, " +
            ":idTipoDocumento, " +
            ":dni, " +
            ":telefono, " +
            ":email ",nativeQuery = true)
    void insertarCompraSorteo(@Param("idSorteo") Integer idSorteo,
                              @Param("idUsuario") Integer idUsuario,
                              @Param("idTipoUsuario") Integer idTipoUsuario,
                              @Param("cantidadInicial") Integer cantidadInicial,
                              @Param("cantidadFinal") Integer cantidadFinal,
                              @Param("idTipoTicket") Integer idTipoTicket,
                              @Param("monto") BigDecimal monto,
                              @Param("idMetodoPago") Integer idMetodoPago,
                              @Param("idPack") Integer idPack,
                              @Param("idCodigoPromocional") Integer idCodigoPromocional,
                              @Param("idTipoDocumento") Integer idTipoDocumento,
                              @Param("dni") String  dni,
                              @Param("telefono") String telefono,
                              @Param("email") String email
    );

    @Modifying
    @Query(value = "EXEC pago.spDesactivarCompraSorteo " +
            ":idCompraSorteo ",nativeQuery = true)
    void eliminarCompraSorteo(@Param("idCompraSorteo") Integer idCompraSorteo);

}
