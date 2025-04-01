package br.com.pedido.controllers;

import br.com.pedido.models.Revenda;
import br.com.pedido.repositories.RevendaRepository;
import br.com.pedido.service.RevendaService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
public class RevendaController {

    @Autowired
    private RevendaService revendaService;

    @PostMapping(value = "/revendas", produces = "application/json")
    public ResponseEntity<Revenda> createRevenda(@RequestBody Revenda revenda) {

        Revenda revendaResponse = revendaService.save(revenda);
        return new ResponseEntity<>(revendaResponse, HttpStatus.CREATED);
    }

    @PutMapping("/revendas/{id}")
    public ResponseEntity<Revenda> updateRevenda(@PathVariable("id") Integer id, @RequestBody @Valid Revenda revenda) {
        Revenda updateRevenda = revendaService.listarRevendaPorId(id);
        if (updateRevenda != null) {
            revendaService.updateRevenda(updateRevenda, revenda);
            return new ResponseEntity<>(revendaService.update(updateRevenda), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

    }

    @DeleteMapping("/revendas/{id}")
    public ResponseEntity<Revenda> deleteRevenda(@PathVariable("id") Integer id, @RequestBody @Valid Revenda revenda) {
        Revenda updateRevenda = revendaService.listarRevendaPorId(id);
        if (updateRevenda != null) {
            revendaService.deleteRevenda(updateRevenda, revenda);
            return new ResponseEntity<>(revendaService.update(updateRevenda), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

    }

    @GetMapping(value = "/revendas", produces = "application/json")
    public ResponseEntity<List<Revenda>> findAll() {
        return new ResponseEntity<>(revendaService.findAll(), HttpStatus.OK);
    }

    @GetMapping(value = "/revendas/{id}", produces = "application/json")
    public ResponseEntity<Revenda> revendaFindById(@PathVariable("id") Integer id) {
        return new ResponseEntity<>( revendaService.revendaFindById(id), HttpStatus.OK);
    }

    @GetMapping(value = "/espacos/page", produces = "application/json")
    public ResponseEntity<Page<Revenda>> findAllPage(Pageable pageRequest) {
        Page<Revenda> revendaPage = revendaService.findAll(pageRequest);
        return ResponseEntity.ok().body(revendaPage);
    }

}
