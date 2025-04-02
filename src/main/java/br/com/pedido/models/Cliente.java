package br.com.pedido.models;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "tb_cliente")
@EqualsAndHashCode(callSuper = false)
public class Cliente {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_cliente")
    private Integer id;

    @Column(name = "nome_cliente")
    private String nomeCliente;
    @Column(name = "tipo_cliente")
    private String tipoCliente; //enum
    @Column(name = "documento_cliente")
    private String documentoCliente;
    @Column(name = "numero_cliente")
    private String numeroCliente;

    @ManyToOne(fetch = FetchType.EAGER, optional = false)
    @JoinColumn(name = "id_endereco", nullable = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    private Endereco endereco;

}
