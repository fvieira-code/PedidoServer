package br.com.pedido.service;

import br.com.pedido.models.Pedido;
import br.com.pedido.models.Revenda;
import br.com.pedido.repositories.RevendaRepository;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@AllArgsConstructor
public class RevendaService {

    @Autowired
    private RevendaRepository revendaRepository;

    public Revenda save(Revenda revendaRequest){

        Revenda revendaResponse = new Revenda(
                revendaRequest.getCnpj(),
                revendaRequest.getRazaoSocial(),
                revendaRequest.getNomeFantasia(),
                revendaRequest.getEmailRevenda()
        );

        revendaRequest.getTelefones().forEach(
                telefone ->{
                    revendaResponse.addTelefone(telefone);
                }
        );

        revendaRequest.getContatos().forEach(
                contato ->{
                    revendaResponse.addContato(contato);
                }
        );

        revendaRequest.getEnderecos().forEach(
                endereco ->{
                    revendaResponse.addEndereco(endereco);
                }
        );

        revendaRepository.save(revendaResponse);
        return revendaResponse;
    }

    public Revenda updateRevenda(Revenda updateRevenda, Revenda requestRevenda){
        updateRevenda.setId(requestRevenda.getId());
        updateRevenda.setCnpj(requestRevenda.getCnpj());
        updateRevenda.setRazaoSocial(requestRevenda.getRazaoSocial());
        updateRevenda.setNomeFantasia(requestRevenda.getNomeFantasia());
        updateRevenda.setEmailRevenda(requestRevenda.getEmailRevenda());
        updateRevenda.setTelefones(requestRevenda.getTelefones());
        updateRevenda.setContatos(requestRevenda.getContatos());
        updateRevenda.setEnderecos(requestRevenda.getEnderecos());
        return updateRevenda;
    }

    public Revenda update(Revenda revendaRequest){
        revendaRepository.save(revendaRequest);
        return revendaRequest;
    }

    public Revenda listarRevendaPorId(Integer id) {
        return revendaRepository.findById(id).stream()
                .filter(revenda -> revenda.getId() != null)
                .findFirst()
                .get();
    }

    public List<Revenda> findAll() {
        List<Revenda> revendasResponse = new ArrayList<Revenda>();
        revendaRepository.findAll().forEach(revendasResponse::add);

        return revendasResponse;
    }

    public Page<Revenda> findAll(Pageable pageRequest) {
        Page<Revenda> revendaList = revendaRepository.findAll(pageRequest);
        return revendaList;
    }

    public ResponseEntity<Map<String, Object>> findAll_() {
        String title = "Paginação";
        int page = 0;
        int size = 3;

        List<Revenda> revendas = new ArrayList<Revenda>();
        Pageable paging = PageRequest.of(page, size);

        Page<Revenda> pageRevendas;
        pageRevendas = revendaRepository.findAll(paging);
        revendas = pageRevendas.getContent();
        Map<String, Object> response = new HashMap<>();
        response.put("espacos", revendas);
        response.put("currentPage", pageRevendas.getNumber());
        response.put("totalItems", pageRevendas.getTotalElements());
        response.put("totalPages", pageRevendas.getTotalPages());

        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    public Revenda deleteRevenda(Revenda updateRevenda, Revenda requestRevenda){
        updateRevenda.setSituacaoRevenda(requestRevenda.getSituacaoRevenda());
        return updateRevenda;
    }

    public Revenda revendaFindById(Integer id) {
        return revendaRepository.findById(id).get();
    }

}
