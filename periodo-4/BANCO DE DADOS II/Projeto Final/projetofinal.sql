/* CRIAÇÃO DE TABELAS */
CREATE TABLE editora(
id_editora int not null,
nome varchar(125) not null,
endereco varchar(125),
telefone varchar(15),
PRIMARY KEY (id_editora)
);

CREATE TABLE livro(
id_livro int not null,
titulo varchar(125) not null,
autor varchar(125) not null,
editora_id int not null,
PRIMARY KEY (id_livro),
FOREIGN KEY (editora_id) REFERENCES editora(id_editora)
);

CREATE TABLE fornecedor(
	id_fornecedor int not null,
	nome varchar(125) not null,
	endereco varchar(125),
	telefone varchar(15),
	email varchar(125),
	PRIMARY KEY (id_fornecedor)
);

CREATE TABLE compra(
	id_compra int not null,
	data_compra date not null,
	valor_total_compra decimal(12,2) not null,
	fornecedor_id int not null,
	PRIMARY KEY (id_compra),
	FOREIGN KEY (fornecedor_id) REFERENCES fornecedor(id_fornecedor)
);

CREATE TABLE item_compra(
	id_item_compra int not null,
	quantidade int not null,
	valor_unitario decimal(12,2) not null,
	livro_id int not null,
	compra_id int not null,
	PRIMARY KEY (id_item_compra),
	FOREIGN KEY (livro_id) REFERENCES livro(id_livro),
	FOREIGN KEY (compra_id) REFERENCES compra(id_compra)
);

CREATE TABLE cliente(
	id_cliente int not null,
	nome varchar(125) not null,
	endereco varchar(125),
	telefone varchar(15),
	PRIMARY KEY (id_cliente)
);

CREATE TABLE pedido(
	id_pedido int not null,
	data_pedido date not null,
	valor_total decimal(12,2) not null,
	cliente_id int not null,
	PRIMARY KEY (id_pedido),
	FOREIGN KEY (cliente_id) REFERENCES cliente(id_cliente)
);

CREATE TABLE item_pedido(
	id_item_pedido int not null,
	quantidade int not null,
	valor_unitario decimal(12,2) not null,
	livro_id int not null,
	pedido_id int not null,
	PRIMARY KEY (id_item_pedido),
	FOREIGN KEY (livro_id) REFERENCES livro(id_livro),
	FOREIGN KEY (pedido_id) REFERENCES pedido(id_pedido)
);

CREATE TABLE funcionario(
	id_funcionario int not null,
	nome varchar(125) not null,
	cpf varchar(125) not null,
	endereco varchar(125),
	telefone varchar(15),
	salario decimal(12,2) not null,
	PRIMARY KEY (id_funcionario)
);

CREATE TABLE pagamento(
	id_pagamento int not null,
	data_pagamento date not null,
	valor_pago decimal(12,2) not null,
	tipo_pagamento varchar(125) not null,
	cliente_id int not null,
	funcionario_id int not null,
	PRIMARY KEY (id_pagamento),
	FOREIGN KEY (cliente_id) REFERENCES cliente(id_cliente),
	FOREIGN KEY (funcionario_id) REFERENCES funcionario(id_funcionario)
);
/* POPULANDO AS TABELAS */
INSERT INTO cliente
VALUES 
(1, 'João Silva', 'Rua das Flores, 123, Centro, São Paulo - SP','(11)98765-4321'),
(2,'Maria Santos', 'Avenida das Palmeiras, 456, Jardim Botânico, Rio de Janeiro - RJ', '(21)91234-5678'),
(3,'Pedro Oliveira', 'Rua dos Ipês, 789, Jardim América, Belo Horizonte - MG', '(31)99876-5432'),
(4,'Ana Rodrigues', 'Praça da Liberdade, 101, Savassi, Belo Horizonte - MG', '(31)98765-4321'),
(5,'Lucas Costa', 'Rua da Paz, 234, Vila Mariana, São Paulo - SP', '(11)91234-5678');
INSERT INTO editora
VALUES
(1,'Livros & Cia','Rua dos Livreiros, 123, Centro, São Paulo - SP','(11)9876-5432'),
(2,'Edições Literárias','Avenida dos Escritores, 456, Jardim Botânico, Rio de Janeiro - RJ','(21)9123-4567'),
(3,'Editora Criativa','Rua dos Artistas, 789, Vila Mariana, São Paulo - SP','(11)9987-6543'),
(4,'Livraria do Saber','Praça da Cultura, 101, Savassi, Belo Horizonte - MG','(31)9876-5432'),
(5,'Casa das Letras','Avenida das Letras, 234, Jardim América, Belo Horizonte - MG','(31)9123-4567');
INSERT INTO fornecedor
VALUES
(1,'Livraria das Letras','Rua do Saber, 456, Centro, Rio de Janeiro - RJ','(21)5555-4444','contato@livrariadasletras.com.br'),
(2,'Leitura Perfeita','Av. das Palavras, 456, Jardins, Rio de Janeiro - RJ','(21)5555-5555','atendimento@leituraperfeita.com'),
(3,'Biblioteca da Alma','Rua dos Sonhos, 789, Vila Madalena, Belo Horizonte - MG','(31)5555-5555','contato@bibliotecadaalma.com.br'),
(4,'Livros e Ideias','Praça das Ideias, 101, Centro, Brasília - DF','(61)5555-5555','atendimento@livroseideias.com'),
(5,'Sabedoria Cultural','Avenida do Conhecimento, 987, Brooklin, São Paulo - SP','(11)5555-5555','contato@sabedoriacultural.com.br');
INSERT INTO funcionario
VALUES
(1,'Fernanda Oliveira','123.456.789-00','Rua das Flores, 123, Centro, São Paulo - SP','(11)93422-6897',3000),
(2,'Rafael Santos','987.654.321-00','Rua das Pedras, 456, Jardins, Rio de Janeiro - RJ','(21)99765-1234',4500),
(3,'Pedro Almeida','456.789.123-00','Rua das Árvores, 789, Vila Madalena, Belo Horizonte - MG','(31)98234-5678',3200),
(4,'Luana Silva','789.123.456-00','Av. das Flores, 123, Centro, Florianópolis - SC','(48)98276-4567',2800),
(5,'Carlos Vieira','654.321.987-00','Rua das Pedras, 789, Centro, Brasília - DF','(61)99567-2345',5000);

/* POPULANDO A TABELA COM WHILE/BREAK */

/* TESTES COM SELECT ALL */
SELECT * FROM cliente;
SELECT * FROM editora;
SELECT * FROM fornecedor;
SELECT * FROM funcionario;
/* TRIGGERS*/
/* TRIGGER PARA ATUALIZAR O VALOR TOTAL DO PEDIDO QUANDO FOR INSERIDO UM ELEMENTO NA TABELA item_pedido */
CREATE TRIGGER atualiza_valor_total_pedido
ON item_pedido
AFTER INSERT
AS
BEGIN
	UPDATE pedido
	SET pedido.valor_total = (SELECT SUM(item_pedido.quantidade * item_pedido.valor_unitario) FROM item_pedido WHERE item_pedido.pedido_id = pedido.id_pedido)
	WHERE pedido.id_pedido = (SELECT pedido_id FROM inserted);
END
GO
/* TESTES TRIGGER 1*/

/* TRIGGER PARA ATUALIZAR O VALOR TOTAL DA COMPRA QUANDO FOR INSERIDO UM ELEMENTO NA TABELA item_compra */
CREATE TRIGGER atualiza_valor_total_compra
ON item_compra
AFTER INSERT
AS
BEGIN
	UPDATE compra
	SET compra.valor_total_compra = (SELECT SUM(item_compra.quantidade * item_compra.valor_unitario) FROM item_compra WHERE item_compra.compra_id = compra.id_compra)
	WHERE compra.id_compra = (SELECT compra_id FROM inserted);
END
GO
/* TESTES TRIGGER 2 */

/* IF CONDICIONAL */
/* IFF FUNÇÃO */
/* CASE WHEN */