package br.com.pedido.models;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.math.BigDecimal;

@Data
@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "tb_pedido_produto")
@EqualsAndHashCode(callSuper = false)
public class Pedido_Produto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_pedido_produto")
    private Integer id;

    @Column(name = "descricao_produto")
    private String descricaoProduto;

    @Column(name = "unidade_produto")
    private String unidadeProduto;

    @Column(name = "quantidade_produto")
    private Double quantidadeProduto;

    @Column(name = "valor_produto")
    //private Double valorProduto;
    private BigDecimal valorProduto;

    @Column(name = "total_produto")
    private Double totalProduto;

}
