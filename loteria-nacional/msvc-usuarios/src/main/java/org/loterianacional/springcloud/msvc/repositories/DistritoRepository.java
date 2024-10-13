package org.loterianacional.springcloud.msvc.repositories;

import feign.Param;
import org.loterianacional.springcloud.msvc.models.entities.Distrito;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DistritoRepository extends JpaRepository<Distrito, String> {

    @Query(value = "EXEC dbo.spListarDistritoPorProvinciayDepartamento :idDepartamento, :idProvincia",nativeQuery = true)
    List<Object[]> listarDistritoPorId(@Param("idDepartamento") String idDepartamento, @Param("idProvincia") String idProvincia);

}
