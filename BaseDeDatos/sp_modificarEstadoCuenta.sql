SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE sp_modificarEstadoCuenta(
     @id_dni VARCHAR(20),
     @nuevoMonto float     
)
as
BEGIN
    
        
        update estadocuenta
        set
        saldoDisponible=@nuevoMonto
        where id_dni=@id_dni;
    
END 
GO


