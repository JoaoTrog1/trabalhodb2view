/* Criação do banco de dados */
DROP DATABASE lojaExView;
CREATE DATABASE lojaExView;
USE lojaExView;

/* Criação da tabela de clientes */
CREATE TABLE tbcliente (
    id_cliente INT AUTO_INCREMENT,
    nome_cliente VARCHAR(100),
    email_cliente VARCHAR(100),
    cidade_cliente VARCHAR(50),
    CONSTRAINT pk_tbcliente PRIMARY KEY(id_cliente)
)ENGINE=INNODB;

/* Criaçao da tabela fornecedor */
CREATE TABLE tbfornecedor (
    id_fornecedor INT AUTO_INCREMENT,
    nome_fornecedor VARCHAR(100),
    cnpj_fornecedor VARCHAR(20) UNIQUE,
    CONSTRAINT pk_tbfornecedor PRIMARY KEY(id_fornecedor)
)ENGINE=INNODB;

/* Criação da tabela de produtos */
CREATE TABLE tbproduto (
    id_produto INT AUTO_INCREMENT,
    nome_produto VARCHAR(100),
    id_fornecedor INT NOT NULL,
    valor_produto DOUBLE,
    CONSTRAINT pk_tbproduto PRIMARY KEY(id_produto),
    CONSTRAINT fk_tbproduto_tbfornecedor FOREIGN KEY(id_fornecedor) REFERENCES tbfornecedor(id_fornecedor)

    ON DELETE CASCADE ON UPDATE CASCADE 
)ENGINE=INNODB;



/* Criação da tabela de pedidos */
CREATE TABLE tbpedido (
    id_pedido INT AUTO_INCREMENT,
    data_pedido DATE,
    id_produto INT NOT NULL,
    id_cliente INT NOT NULL,
    CONSTRAINT pk_tbpedido PRIMARY KEY(id_pedido),
    CONSTRAINT fk_tbpedido_tbcliente FOREIGN KEY (id_cliente) REFERENCES tbcliente(id_cliente),
    CONSTRAINT fk_tbpedido_tbproduto FOREIGN KEY (id_produto) REFERENCES tbproduto(id_produto)

    ON DELETE CASCADE ON UPDATE CASCADE 
)ENGINE=INNODB;





/* Inserção na tabela clientes */
INSERT INTO tbcliente (nome_cliente, email_cliente, cidade_cliente) VALUES
('Carlos Silva', 'carlos.silva@example.com', 'São Paulo'),
('Maria Oliveira', 'maria.oliveira@example.com', 'Rio de Janeiro'),
('João Pereira', 'joao.pereira@example.com', 'Belo Horizonte'),
('Ana Costa', 'ana.costa@example.com', 'Porto Alegre'),
('Fernanda Almeida', 'fernanda.almeida@example.com', 'Curitiba'),
('Ricardo Santos', 'ricardo.santos@example.com', 'Recife');

/* Inserção na tabela fornecedor */
INSERT INTO tbfornecedor (nome_fornecedor, cnpj_fornecedor) VALUES
('Fornecedor Alpha Ltda', '01.234.567/0001-89'),
('Fornecedor Beta S.A.', '23.456.789/0001-01'),
('Fornecedor Gama Comércio', '34.567.890/0001-12');

/* Inserção na tabela produtos */
INSERT INTO tbproduto (nome_produto, id_fornecedor, valor_produto) VALUES
('Smartphone X200', 1, 599.99),
('Notebook UltraPro 15', 1, 1299.49),
('Cadeira Ergonômica Pro', 2, 219.89),
('Mesa de Escritório Compacta', 2, 159.99),
('Fone de Ouvido Bluetooth 4.0', 3, 89.00),
('Monitor LED 24"', 3, 179.75),
('Teclado Mecânico RGB', 1, 89.50),
('Mouse Sem Fio Ergonomic', 3, 45.30);

/* Inserção na tabela pedidos */
INSERT INTO tbpedido (data_pedido, id_produto, id_cliente) VALUES
('2024-08-01', 1, 1),  /* Carlos Silva */
('2024-08-02', 2, 2),  /* Maria Oliveira */
('2024-08-03', 3, 3),  /* João Pereira */
('2024-08-04', 4, 4),  /* Ana Costa */
('2024-08-05', 5, 5),  /* Fernanda Almeida */
('2024-08-06', 6, 6),  /* Ricardo Santos */
('2024-08-07', 7, 1),  /* Carlos Silva */
('2024-08-08', 8, 2);  /* Maria Oliveira */







