package br.com.pedido.repositories;

import br.com.pedido.models.Revenda_Telefone;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RevendaTelefoneRepository extends JpaRepository<Revenda_Telefone, Integer> {
}
