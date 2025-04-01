package br.com.pedido.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import jakarta.validation.constraints.Pattern;
import lombok.*;

import java.util.HashSet;
import java.util.Set;

@Data
@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "tb_telefone")
@EqualsAndHashCode(callSuper = false)
public class Telefone {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_telefone")
    private Integer id;

    @Column(name = "ddd")
    private String dddTelefone;

    @Pattern(regexp = "^\\d{10}$", message = "Número de telefone inválido.")
    @Column(name = "numero")
    private String numeroTelefone;

    @ManyToMany(fetch = FetchType.LAZY,
            cascade = {
                    CascadeType.MERGE
            },
            mappedBy = "telefones")
    @JsonIgnore
    private Set<Revenda> revendas = new HashSet<>();

}
