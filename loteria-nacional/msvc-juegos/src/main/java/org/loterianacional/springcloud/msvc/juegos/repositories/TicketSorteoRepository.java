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

    @Query(value = "EXEC dbo.spListarTicketSorteos",nativeQuery = true)
    List<Object[]> listarTicketSorteo();

    @Query(value = "EXEC dbo.spListarTicketSorteoPorId :idTicketSorteo",nativeQuery = true)
    List<Object[]> listarTicketSorteoPorId(@Param("dni") Integer idTicketSorteo);

    @Query(value = "EXEC dbo.spListarTicketSorteoPorDni :dni",nativeQuery = true)
    List<Object[]> listarTicketSorteoPorDni(@Param("dni") String dni);

}
