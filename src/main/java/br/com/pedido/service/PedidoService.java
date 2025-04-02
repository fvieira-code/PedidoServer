package br.com.pedido.service;

import br.com.pedido.models.Pedido;
import br.com.pedido.models.Pedido_Produto;
import br.com.pedido.repositories.PedidoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@Service
public class PedidoService {

    @Autowired
    private PedidoRepository pedidoRepository;

    public List<Pedido> findAll(){
        return pedidoRepository.findAll() ;
    }

    public Pedido pedidoFindById(Integer id) {
        Pedido pedido = pedidoRepository.findById(id).get();

        pedido.getTotalPedido().add(
        pedido.getPedido_produtos().stream().
                map(Pedido_Produto::getValorProduto).
                reduce(BigDecimal.ZERO, BigDecimal::add)
        );

        return pedido;
    }

    public Pedido save(Pedido pedido) {
        return pedidoRepository.save(pedido);
    }
}