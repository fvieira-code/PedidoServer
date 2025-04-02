INSERT INTO revendapedidodb.tb_endereco (bairro, cep, cidade, numero, rua, uf)
VALUES('FELICIDADE', '55600123', 'SANTO ANTONIO', '545', 'RUA DA PAZ', 'SC');
INSERT INTO revendapedidodb.tb_cliente (documento_cliente, nome_cliente, numero_cliente, tipo_cliente, id_endereco)
VALUES('CPF', 'PAULO JOSE CARDOSO SANTOS', '23465798020', 'PESSOA_FISICA', 1);
INSERT INTO revendapedidodb.tb_contato (nome, tipo)
VALUES('MARIA CARDOSO SANTOS', 'PRIMARIO');
INSERT INTO revendapedidodb.tb_contato (nome, tipo)
VALUES('ALEXANDRE SILVA MEDEIROS', 'SECUNDARPIO');
INSERT INTO revendapedidodb.tb_telefone (ddd, numero)
VALUES('014', '23459877');
INSERT INTO revendapedidodb.tb_telefone (ddd, numero)
VALUES('015', '45667210');
INSERT INTO revendapedidodb.tb_produto (descricao_produto, unidade_produto)
VALUES('CANETA AZUL BIC', 'UN');
INSERT INTO revendapedidodb.tb_produto (descricao_produto, unidade_produto)
VALUES('CANETA VERMELHA BIC', 'UN');
INSERT INTO revendapedidodb.tb_produto (descricao_produto, unidade_produto)
VALUES('CANETA PRETA BIC', 'UN');
INSERT INTO revendapedidodb.tb_produto (descricao_produto, unidade_produto)
VALUES('CANETA VERDA BIC', 'UN');
INSERT INTO revendapedidodb.tb_pedido (data_pedido, descricao_pedido, situacao_pedido, total, id_cliente)
VALUES('2025-04-01', 'PEDIDO DE MATERIAL DE ESCRITORIO', 'ABERTO', 150.50, 1);
INSERT INTO revendapedidodb.tb_pedido_produto (id_pedido, id_produto)
VALUES(1, 1);
INSERT INTO revendapedidodb.tb_pedido_produto (id_pedido, id_produto)
VALUES(1, 2);
INSERT INTO revendapedidodb.tb_pedido_produto (id_pedido, id_produto)
VALUES(1, 3);
INSERT INTO revendapedidodb.tb_pedido_produto (id_pedido, id_produto)
VALUES(1, 4);
INSERT INTO revendapedidodb.tb_revenda (cnpj, email, nome_fantasia, razao_social, situacao)
VALUES('21345678000125', 'revenda.um@gmail.com', 'REVENDA UM SOLUCAO', 'REVENDA UM LTDA', 'ATIVA');
INSERT INTO revendapedidodb.tb_revenda_contato (id_contato, id_revenda)
VALUES(1, 1);
INSERT INTO revendapedidodb.tb_revenda_contato (id_contato, id_revenda)
VALUES(2, 1);
INSERT INTO revendapedidodb.tb_revenda_endereco (id_endereco, id_revenda)
VALUES(1, 1);
INSERT INTO revendapedidodb.tb_revenda_telefone (id_revenda, id_telefone)
VALUES(1, 1);
INSERT INTO revendapedidodb.tb_revenda_telefone (id_revenda, id_telefone)
VALUES(1, 2);