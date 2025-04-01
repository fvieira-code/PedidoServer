package br.com.pedido.models;

import jakarta.persistence.*;
import lombok.*;

@Data
@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "tb_revenda_endereco")
@EqualsAndHashCode(callSuper = false)
public class Revenda_Endereco {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_revenda_endereco")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_revenda")
    Revenda revenda;

    @ManyToOne
    @JoinColumn(name = "id_endereco")
    Contato contato;

}
