
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE verificarExistenciaDni(
     @id_dni VARCHAR(20)     
)
as
BEGIN
    
        select COUNT(*) 
        from Usuario 
        where id_dni= @id_dni
        
    
END 