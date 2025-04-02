CREATE TABLE tb_contato (
	id_contato INTEGER  AUTO_INCREMENT NOT NULL,
	tipo_contato varchar(250) NOT NULL,
	nome_contato varchar(500) NULL,
	CONSTRAINT tb_contato_pk PRIMARY KEY (id_contato)
);

CREATE TABLE tb_endereco (
	id_endereco INTEGER  AUTO_INCREMENT NOT NULL,
	rua varchar(250) NOT NULL,
	numero varchar(5) NULL,
	bairro varchar(250) NULL,
	cep varchar(15) NULL,
	cidade varchar(100) NULL,
	uf varchar(2) NULL,
	CONSTRAINT tb_endereco_pk PRIMARY KEY (id_endereco)
);

CREATE TABLE tb_telefone (
	id_telefone INTEGER  AUTO_INCREMENT NOT NULL,
	ddd varchar(5) NOT NULL,
	numero varchar(25) NULL,
	CONSTRAINT tb_telefone_pk PRIMARY KEY (id_telefone)
);

CREATE TABLE tb_revenda (
	id_revenda INTEGER  AUTO_INCREMENT NOT NULL,
	cnpj varchar(15) NOT NULL,
	razao_social varchar(250) NULL,
	nome_fantasia varchar(500) NULL,
	email varchar(250) NULL,
	situacao varchar(250) NULL,
	CONSTRAINT tb_revenda_pk PRIMARY KEY (id_revenda)
);

CREATE TABLE tb_revenda_contato(
	id_revenda_contato INTEGER  AUTO_INCREMENT NOT NULL,
	id_revenda INTEGER  NOT NULL,
	id_contato INTEGER  NOT NULL,
	CONSTRAINT tb_revenda_contato_pk PRIMARY KEY (id_revenda_contato, id_revenda, id_contato)
);

ALTER TABLE tb_revenda_contato ADD CONSTRAINTEGER tb_revenda_contato_tb_revenda_fk FOREIGN KEY (id_revenda) REFERENCES tb_revenda(id_revenda);
ALTER TABLE tb_revenda_contato ADD CONSTRAINTEGER tb_revenda_contato_tb_contato_fk FOREIGN KEY (id_contato) REFERENCES tb_contato(id_contato);

CREATE TABLE tb_revenda_endereco(
	id_revenda_endereco INTEGER  AUTO_INCREMENT NOT NULL,
	id_revenda INTEGER  NOT NULL,
	id_endereco INTEGER  NOT NULL,
	CONSTRAINT tb_revenda_endereco_pk PRIMARY KEY (id_revenda_endereco, id_revenda, id_endereco)
);

ALTER TABLE tb_revenda_endereco ADD CONSTRAINTEGER tb_revenda_endereco_tb_revenda_fk FOREIGN KEY (id_revenda) REFERENCES tb_revenda(id_revenda);
ALTER TABLE tb_revenda_endereco ADD CONSTRAINTEGER tb_revenda_endereco_tb_endereco_fk FOREIGN KEY (id_endereco) REFERENCES tb_endereco(id_endereco);

CREATE TABLE tb_revenda_telefone(
	id_revenda_telefone INTEGER  AUTO_INCREMENT NOT NULL,
	id_revenda INTEGER  NOT NULL,
	id_telefone INTEGER  NOT NULL,
	CONSTRAINT tb_revenda_telefone_pk PRIMARY KEY (id_revenda_telefone, id_revenda, id_telefone)
);

ALTER TABLE tb_revenda_telefone ADD CONSTRAINTEGER tb_revenda_telefone_tb_revenda_fk FOREIGN KEY (id_revenda) REFERENCES tb_revenda(id_revenda);
ALTER TABLE tb_revenda_telefone ADD CONSTRAINTEGER tb_revenda_telefone_tb_endereco_fk FOREIGN KEY (id_telefone) REFERENCES tb_telefone(id_telefone);

CREATE TABLE tb_cliente (
	id_cliente INTEGER  AUTO_INCREMENT NOT NULL,
	nome_cliente varchar(250) NOT NULL,
	tipo_cliente varchar(15) NULL,
	documento_cliente varchar(15) NULL,
	numero_cliente varchar(15) NULL,
	id_endereco INTEGER NOT NULL,
	CONSTRAINT tb_cliente_pk PRIMARY KEY (id_cliente)
);

ALTER TABLE tb_cliente ADD CONSTRAINT tb_cliente_tb_endereco_fk FOREIGN KEY (id_endereco) REFERENCES tb_endereco(id_endereco);

CREATE TABLE tb_produto (
	id_produto INTEGER  AUTO_INCREMENT NOT NULL,
	descricao_produto varchar(250) NOT NULL,
	unidade_produto varchar(5) NULL,
	CONSTRAINT tb_produto_pk PRIMARY KEY (id_produto)
);

CREATE TABLE tb_cliente (
	id_cliente INTEGER  AUTO_INCREMENT NOT NULL,
	nome_cliente varchar(250) NOT NULL,
	tipo_cliente varchar(15) NULL,
	documento_cliente varchar(15) NULL,
	numero_cliente varchar(15) NULL,
	id_endereco INTEGER NOT NULL,
	CONSTRAINT tb_cliente_pk PRIMARY KEY (id_cliente)
);

ALTER TABLE tb_cliente ADD CONSTRAINT tb_cliente_tb_endereco_fk FOREIGN KEY (id_endereco) REFERENCES tb_endereco(id_endereco);

CREATE TABLE tb_produto (
	id_produto INTEGER  AUTO_INCREMENT NOT NULL,
	descricao_produto varchar(250) NOT NULL,
	unidade_produto varchar(5) NULL,
	CONSTRAINT tb_produto_pk PRIMARY KEY (id_produto)
);

CREATE TABLE tb_pedido (
	id_pedido INTEGER  AUTO_INCREMENT NOT NULL,
	data_pedido data NOT NULL,
	situacao_pedido varchar(15) NULL,
	descricao_pedido varchar(250) NULL,
	id_cliente INTEGER NOT NULL,
	CONSTRAINT tb_pedido_pk PRIMARY KEY (id_pedido)
);

ALTER TABLE tb_pedido ADD CONSTRAINT tb_pedido_tb_cliente_fk FOREIGN KEY (id_cliente) REFERENCES tb_cliente(id_cliente);

CREATE TABLE tb_pedido_produto (
	id_pedido_produto INTEGER  AUTO_INCREMENT NOT NULL,
	id_pedido INTEGER  NOT NULL,
    quantidade_produto DECIMAL(15,4),
    valor_produto DECIMAL(15,4),
    total_produto DECIMAL(15,4),
	CONSTRAINT tb_pedido_produto_pk PRIMARY KEY (id_pedido_produto)
);

ALTER TABLE tb_pedido_produto ADD CONSTRAINT tb_pedido_produto_tb_pedido_fk FOREIGN KEY (id_pedido) REFERENCES tb_pedido(id_pedido);
--ALTER TABLE tb_pedido_produto ADD CONSTRAINT tb_pedido_produto_tb_produto_fk FOREIGN KEY (id_produto) REFERENCES tb_produto(id_produto);



