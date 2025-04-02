CREATE TABLE tb_contato (
	id_contato INTEGER  AUTO_INCREMENT NOT NULL,
	tipo_contato varchar(250) NOT NULL,
	nome_contato varchar(500) NULL,
	CONSTRAINT tb_contato_pk PRIMARY KEY (id_contato)
);
INSERT INTO revendapedidodb.tb_contato (nome_contato, tipo_contato)
VALUES('MARIA CARDOSO SANTOS', 'PRIMARIO');
INSERT INTO revendapedidodb.tb_contato (nome_contato, tipo_contato)
VALUES('ALEXANDRE SILVA MEDEIROS', 'SECUNDARPIO');

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
INSERT INTO revendapedidodb.tb_endereco (bairro, cep, cidade, numero, rua, uf)
VALUES('FELICIDADE', '55600123', 'SANTO ANTONIO', '545', 'RUA DA PAZ', 'SC');

CREATE TABLE tb_telefone (
	id_telefone INTEGER  AUTO_INCREMENT NOT NULL,
	ddd varchar(5) NOT NULL,
	numero varchar(25) NULL,
	CONSTRAINT tb_telefone_pk PRIMARY KEY (id_telefone)
);
INSERT INTO revendapedidodb.tb_telefone (ddd, numero)
VALUES('014', '23459877');
INSERT INTO revendapedidodb.tb_telefone (ddd, numero)
VALUES('015', '45667210');

CREATE TABLE tb_revenda (
	id_revenda INTEGER  AUTO_INCREMENT NOT NULL,
	cnpj varchar(15) NOT NULL,
	razao_social varchar(250) NULL,
	nome_fantasia varchar(500) NULL,
	email varchar(250) NULL,
	situacao varchar(250) NULL,
	CONSTRAINT tb_revenda_pk PRIMARY KEY (id_revenda)
);
INSERT INTO revendapedidodb.tb_revenda (cnpj, email, nome_fantasia, razao_social, situacao)
VALUES('21345678000125', 'revenda.um@gmail.com', 'REVENDA UM SOLUCAO', 'REVENDA UM LTDA', 'ATIVA');

CREATE TABLE tb_revenda_contato(
	id_revenda_contato INTEGER  AUTO_INCREMENT NOT NULL,
	id_revenda INTEGER  NOT NULL,
	id_contato INTEGER  NOT NULL,
	CONSTRAINT tb_revenda_contato_pk PRIMARY KEY (id_revenda_contato, id_revenda, id_contato)
);
ALTER TABLE tb_revenda_contato ADD CONSTRAINT tb_revenda_contato_tb_revenda_fk FOREIGN KEY (id_revenda) REFERENCES tb_revenda(id_revenda);
ALTER TABLE tb_revenda_contato ADD CONSTRAINT tb_revenda_contato_tb_contato_fk FOREIGN KEY (id_contato) REFERENCES tb_contato(id_contato);

INSERT INTO revendapedidodb.tb_revenda_contato (id_contato, id_revenda)
VALUES(1, 1);
INSERT INTO revendapedidodb.tb_revenda_contato (id_contato, id_revenda)
VALUES(2, 1);

CREATE TABLE tb_revenda_endereco(
	id_revenda_endereco INTEGER  AUTO_INCREMENT NOT NULL,
	id_revenda INTEGER  NOT NULL,
	id_endereco INTEGER  NOT NULL,
	CONSTRAINT tb_revenda_endereco_pk PRIMARY KEY (id_revenda_endereco, id_revenda, id_endereco)
);
ALTER TABLE tb_revenda_endereco ADD CONSTRAINT tb_revenda_endereco_tb_revenda_fk FOREIGN KEY (id_revenda) REFERENCES tb_revenda(id_revenda);
ALTER TABLE tb_revenda_endereco ADD CONSTRAINT tb_revenda_endereco_tb_endereco_fk FOREIGN KEY (id_endereco) REFERENCES tb_endereco(id_endereco);

INSERT INTO revendapedidodb.tb_revenda_endereco (id_endereco, id_revenda)
VALUES(1, 1);

CREATE TABLE tb_revenda_telefone(
	id_revenda_telefone INTEGER  AUTO_INCREMENT NOT NULL,
	id_revenda INTEGER  NOT NULL,
	id_telefone INTEGER  NOT NULL,
	CONSTRAINT tb_revenda_telefone_pk PRIMARY KEY (id_revenda_telefone, id_revenda, id_telefone)
);
ALTER TABLE tb_revenda_telefone ADD CONSTRAINT tb_revenda_telefone_tb_revenda_fk FOREIGN KEY (id_revenda) REFERENCES tb_revenda(id_revenda);
ALTER TABLE tb_revenda_telefone ADD CONSTRAINT tb_revenda_telefone_tb_endereco_fk FOREIGN KEY (id_telefone) REFERENCES tb_telefone(id_telefone);

INSERT INTO revendapedidodb.tb_revenda_telefone (id_revenda, id_telefone)
VALUES(1, 1);
INSERT INTO revendapedidodb.tb_revenda_telefone (id_revenda, id_telefone)
VALUES(1, 2);

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

INSERT INTO revendapedidodb.tb_cliente (documento_cliente, nome_cliente, numero_cliente, tipo_cliente, id_endereco)
VALUES('CPF', 'ALEXANDRE CARDOSO DE MELO', '23465798020', 'PESSOA_FISICA', 1);

CREATE TABLE tb_pedido (
	id_pedido INTEGER  AUTO_INCREMENT NOT NULL,
	data_pedido date DEFAULT NULL,
	situacao_pedido varchar(15) NULL,
	descricao_pedido varchar(250) NULL,
	total DECIMAL(15,4) NULL,
	id_cliente INTEGER NOT NULL,
	CONSTRAINT tb_pedido_pk PRIMARY KEY (id_pedido)
);
ALTER TABLE tb_pedido ADD CONSTRAINT tb_pedido_tb_cliente_fk FOREIGN KEY (id_cliente) REFERENCES tb_cliente(id_cliente);

INSERT INTO revendapedidodb.tb_pedido (data_pedido, descricao_pedido, situacao_pedido, total, id_cliente)
VALUES('2025-04-01', 'PEDIDO DE MATERIAL DE ESCRITORIO', 'ABERTO', 150.5, 1);

CREATE TABLE tb_pedido_produto (
	id_pedido_produto INTEGER  AUTO_INCREMENT NOT NULL,
	id_pedido INTEGER  NOT NULL,
	descricao_produto VARCHAR(250) NULL,
	unidade_produto VARCHAR(5) NULL,
    quantidade_produto DECIMAL(15,4),
    valor_produto DECIMAL(15,4),
    total_produto DECIMAL(15,4),
	CONSTRAINT tb_pedido_produto_pk PRIMARY KEY (id_pedido_produto)
);
ALTER TABLE tb_pedido_produto ADD CONSTRAINT tb_pedido_produto_tb_pedido_fk FOREIGN KEY (id_pedido) REFERENCES tb_pedido(id_pedido);

INSERT INTO revendapedidodb.tb_pedido_produto (descricao_produto, quantidade_produto, total_produto, unidade_produto, valor_produto, id_pedido)
VALUES('CANETA VERMELHA BIC', 5, 15, 'UN', 3, (SELECT min(id_pedido) from revendapedidodb.tb_pedido));
INSERT INTO revendapedidodb.tb_pedido_produto (descricao_produto, quantidade_produto, total_produto, unidade_produto, valor_produto, id_pedido)
VALUES('CANETA PRETA BIC', 1, 10, 'UN', 10, (SELECT min(id_pedido) from revendapedidodb.tb_pedido));



