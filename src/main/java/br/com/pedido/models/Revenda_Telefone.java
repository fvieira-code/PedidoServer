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
@Table(name = "tb_revenda_telefone")
@EqualsAndHashCode(callSuper = false)
public class Revenda_Telefone {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_revenda_telefone")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_revenda")
    Revenda revenda;

    @ManyToOne
    @JoinColumn(name = "id_telefone")
    Telefone telefone;
}
