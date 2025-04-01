package br.com.pedido.models;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;

@Data
@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "tb_pedido")
@EqualsAndHashCode(callSuper = false)
public class Pedido {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_pedido")
    private Integer id;

    @Column(name = "data")
    private LocalDate dataPedido;
    @Column(name = "situacao")
    private String situacaoPedido; //enum
    @Column(name = "descricao")
    private String descricaoPedido;
    @Column(name = "total")
    private Double totalPedido;

}
