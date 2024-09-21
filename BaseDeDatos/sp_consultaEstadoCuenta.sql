SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE sp_consultaEstadoCuenta(
     @id_dni VARCHAR(20)     
)
as
BEGIN
    
        
        select saldoDisponible from estadoCuenta where id_dni=@id_dni;
    
END 
GO


