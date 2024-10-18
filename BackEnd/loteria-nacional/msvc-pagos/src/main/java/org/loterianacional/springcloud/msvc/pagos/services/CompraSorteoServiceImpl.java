package org.loterianacional.springcloud.msvc.pagos.services;

import org.loterianacional.springcloud.msvc.pagos.models.CompraSorteoUsuario;
import org.loterianacional.springcloud.msvc.pagos.models.entities.CompraSorteo;
import org.loterianacional.springcloud.msvc.pagos.repositories.CompraSorteoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class CompraSorteoServiceImpl implements CompraSorteoService {

    @Autowired
    private CompraSorteoRepository repository;

    @Override
    public List<CompraSorteoUsuario> listarCompraSorteoPorUsuario(Integer idUsuario) {

        List<Object[]> results = repository.listarCompraSorteoPorUsuario(idUsuario);
        List<CompraSorteoUsuario> comprasSorteoUsuario= new ArrayList<>();

        for (Object[] result : results){
            CompraSorteoUsuario compraSorteoUsuario = new CompraSorteoUsuario();
            compraSorteoUsuario.setIdSorteo((Integer) result[0]);
            compraSorteoUsuario.setIdCompraSorteo((Integer) result[1]);
            compraSorteoUsuario.setJuego((String) result[2]);
            compraSorteoUsuario.setFechaSorteo((Date) result[3]);
            compraSorteoUsuario.setFechaCompra((Date) result[4]);
            compraSorteoUsuario.setCatidadTickets((Integer) result[5]);
            compraSorteoUsuario.setEstadoPago((String) result[6]);
            compraSorteoUsuario.setPremio((String) result[7]);
            compraSorteoUsuario.setMonto(((BigDecimal) result[8]));
            comprasSorteoUsuario.add(compraSorteoUsuario);
        }

        return comprasSorteoUsuario;
    }

    @Override
    public List<CompraSorteoUsuario> listarCompraSorteoPorSorteo(Integer idSorteo) {
        List<Object[]> results = repository.listarCompraSorteoPorSorteo(idSorteo);
        List<CompraSorteoUsuario> comprasSorteoUsuario= new ArrayList<>();

        for (Object[] result : results){
            CompraSorteoUsuario compraSorteoUsuario = new CompraSorteoUsuario();
            compraSorteoUsuario.setIdSorteo((Integer) result[0]);
            compraSorteoUsuario.setIdCompraSorteo((Integer) result[1]);
            compraSorteoUsuario.setJuego((String) result[2]);
            compraSorteoUsuario.setFechaSorteo((Date) result[3]);
            compraSorteoUsuario.setFechaCompra((Date) result[4]);
            compraSorteoUsuario.setCatidadTickets((Integer) result[5]);
            compraSorteoUsuario.setEstadoPago((String) result[6]);
            compraSorteoUsuario.setPremio((String) result[7]);
            compraSorteoUsuario.setMonto(((BigDecimal) result[8]));
            comprasSorteoUsuario.add(compraSorteoUsuario);
        }

        return comprasSorteoUsuario;
    }

    @Override
    @Transactional
    public void insertarCompraSorteo(CompraSorteo compraSorteo) {
        repository.insertarCompraSorteo(
                compraSorteo.getIdSorteo(),
                compraSorteo.getIdUsuario(),
                compraSorteo.getIdTipoUsuario(),
                compraSorteo.getCantidadInicial(),
                compraSorteo.getCantidadFinal(),
                compraSorteo.getIdTipoTicket(),
                compraSorteo.getMonto(),
                compraSorteo.getIdMetodoPago(),
                compraSorteo.getIdPack(),
                compraSorteo.getIdCodigoPromocional(),
                compraSorteo.getIdTipoDocumento(),
                compraSorteo.getDni(),
                compraSorteo.getTelefono(),
                compraSorteo.getEmail()
        );
        //ejecutamos funcion pagar
    }

    //Crear funcion pagar(sirve para insertarCompraSorteo y para boton de pagos pendientes)
    //        //Se envian los datos a la pasarela de pago
    //        //Retorna el estado de pago
    //        //Actualiza el estado de pago en la base de datos
    //        //Verifica estado de pago
    //        //Si estado de pago es PAGADO se generan los tickets, si estado de pago es RECHAZADO se elimina la compra se mantiene en estado de PENDIENTE

    @Override
    @Transactional
    public void eliminarCompraSorteo(Integer idCompraSorteo) {
        repository.eliminarCompraSorteo(idCompraSorteo);
    }

}
