package org.loterianacional.springcloud.msvc.juegos.repositories;

import feign.Param;
import org.loterianacional.springcloud.msvc.juegos.models.entities.Sorteo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SorteoRepository extends JpaRepository<Sorteo, Integer> {

    @Query(value = "EXEC dbo.spListarSorteos",nativeQuery = true)
    List<Object[]> listarSorteos();
    @Query(value = "EXEC dbo.spListarSorteoPorId :idSorteo",nativeQuery = true)
    List<Object[]> listarSorteoPorId(@Param("idSorteo") Integer idSorteo);

}
