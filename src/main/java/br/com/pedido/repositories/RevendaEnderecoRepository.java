package br.com.pedido.repositories;

import br.com.pedido.models.Revenda_Endereco;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RevendaEnderecoRepository extends JpaRepository<Revenda_Endereco, Integer> {
}
