package org.loterianacional.springcloud.msvc.juegos.repositories;

import feign.Param;
import jakarta.persistence.criteria.CriteriaBuilder;
import org.loterianacional.springcloud.msvc.juegos.models.entities.TicketSorteo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TicketSorteoRepository extends JpaRepository<TicketSorteo, Integer> {


    @Query(value = "EXEC juego.spListarTicketSorteoPorCompraSorteo :idCompraSorteo",nativeQuery = true)
    List<Object[]> listarTicketSorteoPorCompraSorteo(@Param("idCompraSorteo") Integer idCompraSorteo);


}
