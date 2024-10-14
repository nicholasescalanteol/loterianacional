package org.loterianacional.springcloud.msvc.repositories;

import feign.Param;
import org.loterianacional.springcloud.msvc.models.entities.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Integer> {

    @Modifying
    @Query(value = "EXEC spCrearUsuarioNuevo :nombres, :apellidos, :dni, :fechaNacimiento, :idTipoDocumento, :email, :direccion, :idDepartamento, :idProvincia, :idDistrito, :codigoPostal, :contrasena, :celular, :idTipoUsuario",nativeQuery = true)
    void insertarUsuario(@Param("nombres") String nombres,
                                   @Param("apellidos") String apellidos,
                                   @Param("dni") String dni,
                                   @Param("fechaNacimiento") Date fechaNacimiento,
                                   @Param("idTipoDocumento") Integer idTipoDocumento,
                                   @Param("email") String email,
                                   @Param("direccion") String direccion,
                                   @Param("idDepartamento") String idDepartamento,
                                   @Param("idProvincia") String idProvincia,
                                   @Param("idDistrito") String idDistrito,
                                   @Param("codigoPostal") String codigoPostal,
                                   @Param("contrasena") String contrasena,
                                   @Param("celular") String celular,
                                   @Param("idTipoUsuario") Integer idTipoUsuario
                                   );

    @Modifying
    @Query(value = "EXEC spActualizarUsuario :dni, :nombres, :apellidos, :fechaNacimiento, :idTipoDocumento, :email, :direccion, :idDepartamento, :idProvincia, :idDistrito, :codigoPostal, :contrasena, :celular, :idTipoUsuario",nativeQuery = true)
    void actualizarUsuario(@Param("dni") String dni,
                            @Param("nombres") String nombres,
                            @Param("apellidos") String apellidos,
                            @Param("fechaNacimiento") Date fechaNacimiento,
                            @Param("idTipoDocumento") Integer idTipoDocumento,
                            @Param("email") String email,
                            @Param("direccion") String direccion,
                            @Param("idDepartamento") String idDepartamento,
                            @Param("idProvincia") String idProvincia,
                            @Param("idDistrito") String idDistrito,
                            @Param("codigoPostal") String codigoPostal,
                            @Param("contrasena") String contrasena,
                            @Param("celular") String celular,
                            @Param("idTipoUsuario") Integer idTipoUsuario
    );

    @Modifying
    @Query(value = "EXEC spDesactivarUsuario :dni",nativeQuery = true)
    void eliminarUsuario(@Param("dni") String dni);

    @Query(value = "EXEC dbo.spListarUsuario",nativeQuery = true)
    List<Object[]> listarUsuarios();

    @Query(value = "EXEC dbo.spListarUsuarioPorDni :dni",nativeQuery = true)
    List<Object[]> listarUsuarioPorDni(@Param("dni") String dni);

}
