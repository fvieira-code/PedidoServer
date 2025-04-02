# Pedido Server
Aplicação backend usando Docker, Spring Boot 3.1.2, Java 17, MySQL 8.0.33 e outras tecnologias.

## PASSOS PARA SUBIR A APLICAÇÃO:
1. Criar os pacotes :

    cd [diretório-raiz]

    mvn clean package

2. Criar os containers com o Docker para a aplicação:

    cd [diretório-raiz]

    docker compose up -d

### Retorno de sucesso:
    [+] Running 4/4
    ✔ Volume "pedido-api_mysql-data"  Created
    ✔ Container mysql-8.0.33-server   Healthy
    ✔ Container pedido-server-02      Started  
    ✔ Container pedido-server-01      Started

3. Banco de dados : Script para popular.
   
    **URL:** jdbc:mysql://localhost:3307/revendapedidodb

   **USER:** root

   **PASSWORD:** Lui$05012013

3.1. Caso o FlyWay não insira os registros, executar o script abaixo:

```sql
INSERT INTO revendapedidodb.tb_endereco (bairro, cep, cidade, numero, rua, uf)
VALUES('FELICIDADE', '55600123', 'SANTO ANTONIO', '545', 'RUA DA PAZ', 'SC');
INSERT INTO revendapedidodb.tb_cliente (documento_cliente, nome_cliente, numero_cliente, tipo_cliente, id_endereco)
VALUES('CPF', 'ALEXANDRE CARDOSO DE MELO', '23465798020', 'PESSOA_FISICA', 1);
INSERT INTO revendapedidodb.tb_contato (nome, tipo)
VALUES('MARIA CARDOSO SANTOS', 'PRIMARIO');
INSERT INTO revendapedidodb.tb_contato (nome, tipo)
VALUES('ALEXANDRE SILVA MEDEIROS', 'SECUNDARPIO');
INSERT INTO revendapedidodb.tb_telefone (ddd, numero)
VALUES('014', '23459877');
INSERT INTO revendapedidodb.tb_telefone (ddd, numero)
VALUES('015', '45667210');
INSERT INTO revendapedidodb.tb_pedido (data_pedido, descricao_pedido, situacao_pedido, total, id_cliente)
VALUES('2025-04-01', 'PEDIDO DE MATERIAL DE ESCRITORIO', 'ABERTO', 150.5, 1);
INSERT INTO revendapedidodb.tb_pedido_produto (descricao_produto, quantidade_produto, total_produto, unidade_produto, valor_produto, id_pedido)
VALUES('CANETA AZUL BIC', 10, 20, 'UN', 2, (SELECT min(id_pedido) from revendapedidodb.tb_pedido));
INSERT INTO revendapedidodb.tb_pedido_produto (descricao_produto, quantidade_produto, total_produto, unidade_produto, valor_produto, id_pedido)
VALUES('CANETA VERMELHA BIC', 5, 15, 'UN', 3, (SELECT min(id_pedido) from revendapedidodb.tb_pedido));
INSERT INTO revendapedidodb.tb_pedido_produto (descricao_produto, quantidade_produto, total_produto, unidade_produto, valor_produto, id_pedido)
VALUES('CANETA PRETA BIC', 1, 10, 'UN', 10, (SELECT min(id_pedido) from revendapedidodb.tb_pedido));
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
```

4. Endpoints:
   Portas das aplicações: 
    8078: pedido-server-01;
    8079: pedido-server-02;

4.1. Consulta todos :
[GET]   http://localhost:8078/api/pedidos

[GET]   http://localhost:8078/api/revendas

4.1. Consulta por Id :
[GET]   http://localhost:8078/api/pedidos/[id]

[GET]   http://localhost:8078/api/revendas/[id]

4.2. Inseri pedido:
[POST] http://localhost:8078/api/pedidos

Body - raw - JSON:
```JSON
{
    "dataPedido": "2025-04-01",
    "situacaoPedido": "ABERTO",
    "descricaoPedido": "PEDIDO DE MATERIAL DE ESCRITORIO",
    "totalPedido": 45.00,
    "cliente": {
                "id": 1,
                "nomeCliente": "ALEXANDRE CARDOSO DE MELO",
                "tipoCliente": "PESSOA_FISICA",
                "documentoCliente": "CPF",
                "numeroCliente": "23465798020",
        "endereco": {
                    "id": 1,
                    "ruaEndereco": "RUA DA PAZ",
                    "numeroEndereco": "545",
                    "bairroEndereco": "FELICIDADE",
                    "cepEndereco": "55600123",
                    "cidadeEndereco": "SANTO ANTONIO",
                    "ufEndereco": "SC"
                    }
        },
        "pedido_produtos": [
        {
            "id": 3,
            "descricaoProduto": "CANETA PRETA BIC",
            "unidadeProduto": "UN",
            "quantidadeProduto": 5.0,
            "valorProduto": 6.00,
            "totalProduto": 30.0
        }
        ]
}
```

[POST] http://localhost:8078/api/revendas

Body - raw - JSON:
```JSON
{
    "cnpj": "12345678909875",
    "razaoSocial": "Empresa Quatro Ltda",
    "nomeFantasia": "Empresa Quatro Solucoes",
    "emailRevenda": "empresa_004@gmail.com",
    "situacaoRevenda": "ATIVA",
    "telefones": [
                    {
                    "id": 4,
                    "numeroTelefone": "4570-6543"
                    }
                ],
    "contatos": [
                    {
                    "id": 4,
                    "tipoContato": "SECUNDARIO",
                    "nomeContato": "Ezio Miranda Vasconcelos"
                    }
                ],
    "enderecos": [
                    {
                    "id": 4
                    }
    ]
}
```