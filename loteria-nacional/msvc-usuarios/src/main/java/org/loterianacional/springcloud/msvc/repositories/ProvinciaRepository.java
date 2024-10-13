package org.loterianacional.springcloud.msvc.repositories;

import feign.Param;
import org.loterianacional.springcloud.msvc.models.entities.Provincia;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProvinciaRepository extends JpaRepository<Provincia, String> {

    @Query(value = "EXEC dbo.spListarProvinciasPorDepartamento :idDepartamento",nativeQuery = true)
    List<Object[]> listarProvinciaPorId(@Param("idDepartamento") String idDepartamento);

}
