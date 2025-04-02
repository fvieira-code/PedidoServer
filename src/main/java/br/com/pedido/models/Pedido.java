package br.com.pedido.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import static jakarta.persistence.CascadeType.ALL;

@Data
@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "tb_pedido")
public class Pedido {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_pedido")
    private Integer id;

    @Column(name = "data_pedido")
    private LocalDate dataPedido;
    @Column(name = "situacao_pedido")
    private String situacaoPedido; //enum
    @Column(name = "descricao_pedido")
    private String descricaoPedido;
    @Column(name = "total")
    private BigDecimal totalPedido;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "id_cliente", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Cliente cliente;

    @OneToMany(orphanRemoval=true)
    @JoinColumn(name="id_pedido")
    private Set<Pedido_Produto> pedido_produtos;

    private BigDecimal totalGeralPedido;

}
