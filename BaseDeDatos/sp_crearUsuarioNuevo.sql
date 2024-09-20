
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE sp_crearUsuarioNuevo(
     @id_dni VARCHAR(20),
     @nombres VARCHAR(100),
     @apellidos VARCHAR(100),
     @fechaNacimiento DATE,
     @tipoDocumento VARCHAR(50),
     @email VARCHAR(150),
     @direccion VARCHAR(150),
     @departamento VARCHAR(50),
     @provincia VARCHAR(50),
     @distrito VARCHAR(50),
     @codigoPostal VARCHAR(50),
     @contrasena VARCHAR(350),
     @celular VARCHAR(50),
     @id_tipoUsuario int
)
as
BEGIN
    
        -- Insertar el nuevo usuario
        INSERT INTO usuario (id_dni, nombres,apellidos,fechaNacimiento,tipoDocumento,email,
        direccion,departamento,provincia,distrito,codigoPostal,contrasena,celular,id_tipoUsuario)
        VALUES (@id_dni,@nombres,@apellidos,@fechaNacimiento,@tipoDocumento,@email,
        @direccion,@departamento,@provincia,@distrito,@codigoPostal,@contrasena,@celular,@id_tipoUsuario);
    
END 