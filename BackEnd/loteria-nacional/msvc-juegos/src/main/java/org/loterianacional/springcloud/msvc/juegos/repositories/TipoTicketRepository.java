package org.loterianacional.springcloud.msvc.juegos.repositories;

import org.loterianacional.springcloud.msvc.juegos.models.entities.TipoTicket;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TipoTicketRepository extends JpaRepository<TipoTicket,Integer> {

    @Query(value = "EXEC juego.spListarTipoTicket",nativeQuery = true)
    List<Object[]> listarTipoTicket();

}
