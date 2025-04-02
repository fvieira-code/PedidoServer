package br.com.pedido.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Data
@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "tb_item")
@EqualsAndHashCode(callSuper = false)
public class Item {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_item")
    private Integer id;

    //@ManyToOne
    //@JoinColumn(name = "id_pedido")
    //@Column(name = "id_pedido")
    //Pedido pedido;

    //@ManyToOne
    //@JoinColumn(name = "id_produto")
    //@Column(name = "id_produto")
    //Produto produto;

    @Column(name = "quantidade_produto")
    private Double quantidadeProduto;

    @Column(name = "valor_produto")
    private Double valorProduto;

    @Column(name = "total_produto")
    private Double totalProduto;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "id_pedido", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JsonIgnore
    private Pedido pedido;
}
