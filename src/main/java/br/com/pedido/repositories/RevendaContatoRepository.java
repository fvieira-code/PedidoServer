package br.com.pedido.repositories;

import br.com.pedido.models.Revenda_Contato;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RevendaContatoRepository extends JpaRepository<Revenda_Contato, Integer> {
}
