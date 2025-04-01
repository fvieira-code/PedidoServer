package br.com.pedido.repositories;

import br.com.pedido.models.Revenda;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RevendaRepository extends JpaRepository<Revenda, Integer> {
}
