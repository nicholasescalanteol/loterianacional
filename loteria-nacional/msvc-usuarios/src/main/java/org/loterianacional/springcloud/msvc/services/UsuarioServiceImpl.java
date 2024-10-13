package org.loterianacional.springcloud.msvc.services;

import org.loterianacional.springcloud.msvc.models.entities.Usuario;
import org.loterianacional.springcloud.msvc.repositories.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.ArrayList;
import java.util.Date;

@Service
public class UsuarioServiceImpl implements UsuarioService{

    @Autowired
    private UsuarioRepository repository;

    @Override
    @Transactional
    public void insertarUsuario(Usuario usuario) {
        repository.insertarUsuario(
                usuario.getNombres(),
                usuario.getApellidos(),
                usuario.getDni(),
                usuario.getFechaNacimiento(),
                usuario.getIdTipoDocumento(),
                usuario.getEmail(),
                usuario.getDireccion(),
                usuario.getIdDepartamento(),
                usuario.getIdProvincia(),
                usuario.getIdDistrito(),
                usuario.getCodigoPostal(),
                usuario.getContrasena(),
                usuario.getCelular(),
                usuario.getIdTipoDocumento()
        );
    }

    @Override
    @Transactional
    public void actualizarUsuario(String dni, Usuario usuario) {
        repository.actualizarUsuario(dni,
                usuario.getNombres(),
                usuario.getApellidos(),
                usuario.getFechaNacimiento(),
                usuario.getIdTipoDocumento(),
                usuario.getEmail(),
                usuario.getDireccion(),
                usuario.getIdDepartamento(),
                usuario.getIdProvincia(),
                usuario.getIdDistrito(),
                usuario.getCodigoPostal(),
                usuario.getContrasena(),
                usuario.getCelular(),
                usuario.getIdTipoDocumento()
        );
    }

    @Override
    @Transactional
    public void eliminarUsuario(String dni) {
        repository.eliminarUsuario(dni);
    }

    @Override
    public List<Usuario> listarUsuarios() {
        List<Object[]> results = repository.listarUsuarios();
        List<Usuario> usuarios = new ArrayList<>();

        for (Object[] result : results) {
            Usuario usuario = new Usuario();

            usuario.setIdUsuario((Integer) result[0]);
            usuario.setNombres((String) result[1]);
            usuario.setApellidos((String) result[2]);
            usuario.setDni((String) result[3]);
            usuario.setFechaNacimiento((Date) result[4]);
            usuario.setIdTipoDocumento((Integer) result[5]);
            usuario.setEmail((String) result[6]);
            usuario.setDireccion((String) result[7]);
            usuario.setIdDepartamento((String) result[8]);
            usuario.setIdProvincia((String) result[9]);
            usuario.setIdDistrito((String) result[10]);
            usuario.setCodigoPostal((String) result[11]);
            usuario.setContrasena((String) result[12]);
            usuario.setCelular((String) result[13]);
            usuario.setIdTipoUsuario((Integer) result[14]);
            usuario.setActivo((Boolean) result[15]);

            usuarios.add(usuario);
        }

        return usuarios;
    }

    @Override
    public List<Usuario> listarUsuarioPorDni(String dni) {
        List<Object[]> results = repository.listarUsuarioPorDni(dni);
        List<Usuario> usuarioR = new ArrayList<>();

        for (Object[] result : results) {
            Usuario usuario = new Usuario();

            usuario.setIdUsuario((Integer) result[0]);
            usuario.setNombres((String) result[1]);
            usuario.setApellidos((String) result[2]);
            usuario.setDni((String) result[3]);
            usuario.setFechaNacimiento((Date) result[4]);
            usuario.setIdTipoDocumento((Integer) result[5]);
            usuario.setEmail((String) result[6]);
            usuario.setDireccion((String) result[7]);
            usuario.setIdDepartamento((String) result[8]);
            usuario.setIdProvincia((String) result[9]);
            usuario.setIdDistrito((String) result[10]);
            usuario.setCodigoPostal((String) result[11]);
            usuario.setContrasena((String) result[12]);
            usuario.setCelular((String) result[13]);
            usuario.setIdTipoUsuario((Integer) result[14]);
            usuario.setActivo((Boolean) result[15]);

            usuarioR.add(usuario);
        }

        return usuarioR;
    }

}
