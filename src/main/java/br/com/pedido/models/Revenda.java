package br.com.pedido.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.*;

import java.util.HashSet;
import java.util.Set;

@Entity
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Table(name = "tb_revenda")
public class Revenda {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_revenda")
    private Integer id;

    @NotBlank(message = "CNPJ obrigatório.")
    @Size(min = 14, max = 14, message = "CPNJ deve ter 14 números.")
    @Pattern(regexp = "^\\d{14}$", message = "CNPJ inválido.")
    @Column(name = "cnpj")
    private String cnpj;

    @NotBlank(message = "Razão Social obrigatório.")
    @Pattern(regexp = "^[A-Z](?=.{1,29}$)[A-Za-z]*(?:\\h+[A-Z][A-Za-z]*)*$", message = "Razão Social inválido.")
    @Column(name = "razao_social")
    private String razaoSocial;

    @NotBlank(message = "Nome Fantasia obrigatório.")
    @Pattern(regexp = "^[A-Z](?=.{1,29}$)[A-Za-z]*(?:\\h+[A-Z][A-Za-z]*)*$", message = "Nome Fantasia inválido.")
    @Column(name = "nome_fantasia")
    private String nomeFantasia;

    @NotBlank(message = "Email obrigatório.")
    @Email(message = "Email inválido.", regexp = "[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,3}",
            flags = Pattern.Flag.CASE_INSENSITIVE)
    @Column(name = "email")
    private String emailRevenda;

    @Column(name = "situacao")
    private String situacaoRevenda; //Enum - ATIVO-INATIVO

    @ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.MERGE})
    @JoinTable(name = "tb_revenda_telefone", joinColumns = {@JoinColumn(name = "id_revenda")}, inverseJoinColumns = {@JoinColumn(name = "id_telefone")})
    @OrderBy(value = "id_telefone")
    private Set<Telefone> telefones = new HashSet<>();

    @ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.MERGE})
    @JoinTable(name = "tb_revenda_contato", joinColumns = {@JoinColumn(name = "id_revenda")}, inverseJoinColumns = {@JoinColumn(name = "id_contato")})
    @OrderBy(value = "id_contato")
    private Set<Contato> contatos = new HashSet<>();

    @ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.MERGE})
    @JoinTable(name = "tb_revenda_endereco", joinColumns = {@JoinColumn(name = "id_revenda")}, inverseJoinColumns = {@JoinColumn(name = "id_endereco")})
    @OrderBy(value = "id_endereco")
    private Set<Endereco> enderecos = new HashSet<>();

    public Revenda(String cnpj, String razaoSocial, String nomeFantasia, String emailRevenda) {
        this.cnpj = cnpj;
        this.razaoSocial = razaoSocial;
        this.nomeFantasia = nomeFantasia;
        this.emailRevenda = emailRevenda;
    }

    public void addTelefone(Telefone telefone) {
        this.telefones.add(telefone);
        telefone.getRevendas().add(this);
    }

    public void addContato(Contato contato) {
        this.contatos.add(contato);
        contato.getRevendas().add(this);
    }

    public void addEndereco(Endereco endereco) {
        this.enderecos.add(endereco);
        endereco.getRevendas().add(this);
    }

}
