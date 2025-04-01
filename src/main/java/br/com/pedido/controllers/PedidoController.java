package br.com.pedido.controllers;

import br.com.pedido.models.Pedido;
import br.com.pedido.service.PedidoService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
public class PedidoController {

    @Autowired
    private PedidoService pedidoService;

    @GetMapping("/pedidos")
    public List<Pedido> getAllPedidos() {
        return pedidoService.findAll();
    }

    @GetMapping("/pedidos/{id}")
    public ResponseEntity<Pedido> pedidoFindById(@PathVariable("id") Integer id){
        Pedido entity = pedidoService.pedidoFindById(id);
        return ResponseEntity.ok(entity);
    }

    @PostMapping("/pedidos")
    public ResponseEntity<Pedido> postPedido(@RequestBody @Valid Pedido pedido) {
        pedidoService.save(pedido);
        return new ResponseEntity<>(pedido, HttpStatus.CREATED);
    }

}