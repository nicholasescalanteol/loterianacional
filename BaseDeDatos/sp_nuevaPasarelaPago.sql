SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE sp_nuevaPasarelaPago(@id_dni int,
     @estado varchar(50),
     @monto float)
as
BEGIN
    
    insert into pasarelaPago(id_dni,estado,monto) values (@id_dni,@estado,@monto)
    
END 
GO
