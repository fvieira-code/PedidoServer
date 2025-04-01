CREATE TABLE tb_contato (
	id_contato INTEGER  AUTO_INCREMENT NOT NULL,
	tipo_contato varchar(250) NOT NULL,
	nome_contato varchar(500) NULL,
	CONSTRAINTEGER tb_contato_pk PRIMARY KEY (id_contato)
);

CREATE TABLE tb_endereco (
	id_endereco INTEGER  AUTO_INCREMENT NOT NULL,
	rua varchar(250) NOT NULL,
	numero varchar(5) NULL,
	bairro varchar(250) NULL,
	cep varchar(15) NULL,
	cidade varchar(100) NULL,
	uf varchar(2) NULL,
	CONSTRAINTEGER tb_endereco_pk PRIMARY KEY (id_endereco)
);

CREATE TABLE tb_telefone (
	id_telefone INTEGER  AUTO_INCREMENT NOT NULL,
	ddd varchar(5) NOT NULL,
	numero varchar(25) NULL,
	CONSTRAINTEGER tb_telefone_pk PRIMARY KEY (id_telefone)
);

CREATE TABLE tb_revenda (
	id_revenda INTEGER  AUTO_INCREMENT NOT NULL,
	cnpj varchar(15) NOT NULL,
	razao_social varchar(250) NULL,
	nome_fantasia varchar(500) NULL,
	email varchar(250) NULL,
	situacao varchar(250) NULL,
	CONSTRAINTEGER tb_revenda_pk PRIMARY KEY (id_revenda)
);

CREATE TABLE tb_revenda_contato(
	id_revenda_contato INTEGER  AUTO_INCREMENT NOT NULL,
	id_revenda INTEGER  NOT NULL,
	id_contato INTEGER  NOT NULL,
	CONSTRAINTEGER tb_revenda_contato_pk PRIMARY KEY (id_revenda_contato, id_revenda, id_contato)
);

ALTER TABLE tb_revenda_contato ADD CONSTRAINTEGER tb_revenda_contato_tb_revenda_fk FOREIGN KEY (id_revenda) REFERENCES tb_revenda(id_revenda);
ALTER TABLE tb_revenda_contato ADD CONSTRAINTEGER tb_revenda_contato_tb_contato_fk FOREIGN KEY (id_contato) REFERENCES tb_contato(id_contato);

CREATE TABLE tb_revenda_endereco(
	id_revenda_endereco INTEGER  AUTO_INCREMENT NOT NULL,
	id_revenda INTEGER  NOT NULL,
	id_endereco INTEGER  NOT NULL,
	CONSTRAINTEGER tb_revenda_endereco_pk PRIMARY KEY (id_revenda_endereco, id_revenda, id_endereco)
);

ALTER TABLE tb_revenda_endereco ADD CONSTRAINTEGER tb_revenda_endereco_tb_revenda_fk FOREIGN KEY (id_revenda) REFERENCES tb_revenda(id_revenda);
ALTER TABLE tb_revenda_endereco ADD CONSTRAINTEGER tb_revenda_endereco_tb_endereco_fk FOREIGN KEY (id_endereco) REFERENCES tb_endereco(id_endereco);

CREATE TABLE tb_revenda_telefone(
	id_revenda_telefone INTEGER  AUTO_INCREMENT NOT NULL,
	id_revenda INTEGER  NOT NULL,
	id_telefone INTEGER  NOT NULL,
	CONSTRAINTEGER tb_revenda_telefone_pk PRIMARY KEY (id_revenda_telefone, id_revenda, id_telefone)
);

ALTER TABLE tb_revenda_telefone ADD CONSTRAINTEGER tb_revenda_telefone_tb_revenda_fk FOREIGN KEY (id_revenda) REFERENCES tb_revenda(id_revenda);
ALTER TABLE tb_revenda_telefone ADD CONSTRAINTEGER tb_revenda_telefone_tb_endereco_fk FOREIGN KEY (id_telefone) REFERENCES tb_telefone(id_telefone);

CREATE TABLE tb_pedido (
	id_pedido INTEGER  AUTO_INCREMENT NOT NULL,
	data date NULL,
	situacao varchar(15) NOT NULL,
	descricao varchar(250) NULL,
	total  decimal(19,2) NULL,
	CONSTRAINTEGER tb_pedido_pk PRIMARY KEY (id_pedido)
);
