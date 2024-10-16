package org.loterianacional.springcloud.msvc.juegos.repositories;

import feign.Param;
import org.loterianacional.springcloud.msvc.juegos.models.entities.Juego;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JuegoRepository extends JpaRepository<Juego,Integer> {

    @Query(value = "EXEC juego.spListarJuegos",nativeQuery = true)
    List<Object[]> listarJuegos();

    @Query(value = "EXEC juego.spListarJuegoPorId :idJuego",nativeQuery = true)
    List<Object[]> listarJuegoPorId(@Param("idJuego") Integer idJuego);

}
