SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE sp_verificarExistenciaEmail(
     @email VARCHAR(150)     
)
as
BEGIN
    
        select COUNT(*) 
        from Usuario 
        where email= @email
        
    
END 