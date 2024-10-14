package org.loterianacional.springcloud.msvc.repositories;

import org.loterianacional.springcloud.msvc.models.entities.TipoUsuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TipoUsuarioRepository extends JpaRepository<TipoUsuario, Integer> {

    @Query(value = "EXEC dbo.spTraerTipoUsuario",nativeQuery = true)
    List<Object[]> listarTipoUsuario();

}
