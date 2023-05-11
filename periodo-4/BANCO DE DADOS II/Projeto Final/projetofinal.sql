/* CRIAÇÃO DE TABELAS */
CREATE TABLE editora(
id_editora int not null,
nome varchar(125) not null,
endereco varchar(125),
PRIMARY KEY (id_editora)
);

CREATE TABLE editora_telefone(
id_editora int,
telefone varchar(15),
PRIMARY KEY(id_editora, telefone),
FOREIGN KEY(id_editora)REFERENCES editora(id_editora)
);

CREATE TABLE livro(
id_livro int not null,
editora_id int not null,
titulo varchar(125) not null,
autor varchar(125) not null,
PRIMARY KEY (id_livro),
FOREIGN KEY (editora_id) REFERENCES editora(id_editora)
);

CREATE TABLE fornecedor(
	id_fornecedor int not null,
	nome varchar(125) not null,
	endereco varchar(125),
	email varchar(125),
	PRIMARY KEY (id_fornecedor)
);
CREATE TABLE fornecedor_telefone(
id_fornecedor int,
telefone varchar(15),
PRIMARY KEY(id_fornecedor, telefone),
FOREIGN KEY(id_fornecedor)REFERENCES fornecedor(id_fornecedor)
);

CREATE TABLE compra(
	id_compra int not null,
	fornecedor_id int not null,
	data_compra date not null,
	valor_total_compra decimal(12,2) not null,
	PRIMARY KEY (id_compra),
	FOREIGN KEY (fornecedor_id) REFERENCES fornecedor(id_fornecedor)
);

CREATE TABLE item_compra(
	id_item_compra int not null,
	livro_id int not null,
	compra_id int not null,
	quantidade int not null,
	valor_unitario decimal(12,2) not null,
	PRIMARY KEY (id_item_compra),
	FOREIGN KEY (livro_id) REFERENCES livro(id_livro),
	FOREIGN KEY (compra_id) REFERENCES compra(id_compra)
);

CREATE TABLE cliente(
	id_cliente int not null,
	nome varchar(125) not null,
	endereco varchar(125),
	PRIMARY KEY (id_cliente)
);
CREATE TABLE cliente_telefone(
id_cliente int,
telefone varchar(15),
PRIMARY KEY(id_cliente, telefone),
FOREIGN KEY(id_cliente)REFERENCES cliente(id_cliente)
);

CREATE TABLE pedido(
	id_pedido int not null,
	cliente_id int not null,
	data_pedido date not null,
	valor_total decimal(12,2) not null,
	PRIMARY KEY (id_pedido),
	FOREIGN KEY (cliente_id) REFERENCES cliente(id_cliente)
);

CREATE TABLE item_pedido(
	id_item_pedido int not null,
	livro_id int not null,
	pedido_id int not null,
	quantidade int not null,
	valor_unitario decimal(12,2) not null,
	PRIMARY KEY (id_item_pedido),
	FOREIGN KEY (livro_id) REFERENCES livro(id_livro),
	FOREIGN KEY (pedido_id) REFERENCES pedido(id_pedido)
);

CREATE TABLE funcionario(
	id_funcionario int not null,
	nome varchar(125) not null,
	cpf varchar(125) not null,
	endereco varchar(125),
	salario decimal(12,2) not null,
	PRIMARY KEY (id_funcionario)
);
CREATE TABLE funcionario_telefone(
id_funcionario int,
telefone varchar(15),
PRIMARY KEY(id_funcionario, telefone),
FOREIGN KEY(id_funcionario)REFERENCES funcionario(id_funcionario)
);

CREATE TABLE pagamento(
	id_pagamento int not null,
	cliente_id int not null,
	funcionario_id int not null,
	data_pagamento date not null,
	valor_pago decimal(12,2) not null,
	tipo_pagamento varchar(125) not null,
	PRIMARY KEY (id_pagamento),
	FOREIGN KEY (cliente_id) REFERENCES cliente(id_cliente),
	FOREIGN KEY (funcionario_id) REFERENCES funcionario(id_funcionario)
);
/* POPULANDO AS TABELAS */
INSERT INTO cliente
VALUES 
(1, 'João Silva', 'Rua das Flores, 123, Centro, São Paulo - SP'),
(2,'Maria Santos', 'Avenida das Palmeiras, 456, Jardim Botânico, Rio de Janeiro - RJ'),
(3,'Pedro Oliveira', 'Rua dos Ipês, 789, Jardim América, Belo Horizonte - MG'),
(4,'Ana Rodrigues', 'Praça da Liberdade, 101, Savassi, Belo Horizonte - MG'),
(5,'Lucas Costa', 'Rua da Paz, 234, Vila Mariana, São Paulo - SP');
INSERT INTO editora
VALUES
(1,'Livros & Cia','Rua dos Livreiros, 123, Centro, São Paulo - SP'),
(2,'Edições Literárias','Avenida dos Escritores, 456, Jardim Botânico, Rio de Janeiro - RJ'),
(3,'Editora Criativa','Rua dos Artistas, 789, Vila Mariana, São Paulo - SP'),
(4,'Livraria do Saber','Praça da Cultura, 101, Savassi, Belo Horizonte - MG'),
(5,'Casa das Letras','Avenida das Letras, 234, Jardim América, Belo Horizonte - MG');
INSERT INTO fornecedor
VALUES
(1,'Livraria das Letras','Rua do Saber, 456, Centro, Rio de Janeiro - RJ','contato@livrariadasletras.com.br'),
(2,'Leitura Perfeita','Av. das Palavras, 456, Jardins, Rio de Janeiro - RJ','atendimento@leituraperfeita.com'),
(3,'Biblioteca da Alma','Rua dos Sonhos, 789, Vila Madalena, Belo Horizonte - MG','contato@bibliotecadaalma.com.br'),
(4,'Livros e Ideias','Praça das Ideias, 101, Centro, Brasília - DF','atendimento@livroseideias.com'),
(5,'Sabedoria Cultural','Avenida do Conhecimento, 987, Brooklin, São Paulo - SP','contato@sabedoriacultural.com.br');
INSERT INTO funcionario
VALUES
(1,'Fernanda Oliveira','123.456.789-00','Rua das Flores, 123, Centro, São Paulo - SP',3000),
(2,'Rafael Santos','987.654.321-00','Rua das Pedras, 456, Jardins, Rio de Janeiro - RJ',4500),
(3,'Pedro Almeida','456.789.123-00','Rua das Árvores, 789, Vila Madalena, Belo Horizonte - MG',3200),
(4,'Luana Silva','789.123.456-00','Av. das Flores, 123, Centro, Florianópolis - SC',2800),
(5,'Carlos Vieira','654.321.987-00','Rua das Pedras, 789, Centro, Brasília - DF',5000);

/* POPULANDO A TABELA COM WHILE*/
DECLARE @contador INT = 1;
WHILE @contador <= 20
BEGIN
	INSERT INTO livro
	VALUES (@contador, FLOOR(RAND()*5)+1,'Livro '+CAST(@contador AS VARCHAR),'Autor '+CAST(@contador AS VARCHAR));
	SET @contador += 1;
END
/* TESTES COM SELECT ALL */
SELECT * FROM cliente;
SELECT * FROM editora;
SELECT * FROM fornecedor;
SELECT * FROM funcionario;
SELECT * FROM livro;
/* TRIGGERS*/
/* TRIGGER PARA ATUALIZAR O VALOR TOTAL DO PEDIDO QUANDO FOR INSERIDO UM ELEMENTO NA TABELA item_pedido */
GO
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
INSERT INTO pedido
VALUES
(1,1,'30-03-23',0);
INSERT INTO item_pedido
VALUES
(1,2,1,1,20);
INSERT INTO item_pedido
VALUES
(2,3,1,2,40);
select * from item_pedido;
select * from pedido;
/* TRIGGER PARA ATUALIZAR O VALOR TOTAL DA COMPRA QUANDO FOR INSERIDO UM ELEMENTO NA TABELA item_compra */
GO
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
INSERT INTO compra
VALUES
(1,1,'30-03-23',0),
(2,2,'30-03-23',0),
(3,1,'30-03-23',0),
(4,3,'30-03-23',0);
INSERT INTO item_compra
VALUES
(1,1,1,1,200);
INSERT INTO item_compra
VALUES
(2,2,2,2,400);
INSERT INTO item_compra
VALUES
(3,3,3,3,350);
INSERT INTO item_compra
VALUES
(4,4,4,2,500);
select * from item_compra;
select * from compra;
/* IF CONDICIONAL */
DECLARE @contagemPag int
	SELECT @contagemPag = COUNT(id_pagamento)
	FROM pagamento;
	IF @contagemPag < 25
		BEGIN
			PRINT 'Vendas Baixas'
		END
	ELSE
		BEGIN
			PRINT 'Vendas Satisfatórias'
		END;
/* TESTE IF CONDICIONAL */
DECLARE @contador INT = 1;
WHILE @contador <= 30
BEGIN
	INSERT INTO pagamento
	VALUES (@contador,1,1,'01-04-2023',200,'dinheiro');
	SET @contador += 1;
END
/* FUNÇÃO IIF PARA BUSCAR LIVROS DE UMA DETERMINADA EDITORA*/
SELECT id_livro,titulo,autor, IIF(editora_id = 5, 'livro da Casa das Letras','livro de outra editora')
FROM livro
/* DEMONSTRAÇÃO DE CASE/WHEN */
SELECT c.id_compra,
	   c.data_compra,
	   CASE
		WHEN valor_total_compra < 1000 THEN 'Compra pequena'
		WHEN valor_total_compra < 1500  THEN 'Compra média'
		WHEN valor_total_compra < 2000 THEN 'Compra grande'
	   ELSE
		'Compra gigante'
	   END AS class_compra
FROM compra c
/* TRANSAÇÃO - COMMIT/ROLLBACK */
select * from pagamento;
BEGIN TRANSACTION
	insert into pagamento
	values (1,1,1,'02-05-2023',100,'cartao');
	BEGIN
	IF @@ERROR = 0
		COMMIT
	ELSE
	BEGIN
		ROLLBACK
		PRINT 'Erro ao inserir pagamento, chave duplicada'
	END
END
select * from pagamento;
/* PROCEDURE CLIENTE*/
GO
CREATE PROCEDURE insere_telefone_cliente
   @id_cliente int,
   @telefone varchar(15)
AS
BEGIN
   INSERT INTO cliente_telefone (id_cliente, telefone)
   VALUES (@id_cliente, @telefone)
END
GO
SELECT * FROM cliente_telefone;
EXECUTE insere_telefone_cliente 1, '996314678';
EXECUTE insere_telefone_cliente 1, '98003245';
EXECUTE insere_telefone_cliente 1, '997980908';
SELECT * FROM cliente_telefone;

/* PROCEDURE EDITORA */
GO
CREATE PROCEDURE insere_telefone_editora
   @id_editora int,
   @telefone varchar(15)
AS
BEGIN
   INSERT INTO editora_telefone (id_editora, telefone)
   VALUES (@id_editora, @telefone)
END
GO
SELECT * FROM editora_telefone;
EXECUTE insere_telefone_editora 1, '32498764';
EXECUTE insere_telefone_editora 1,'33097633';
EXECUTE insere_telefone_editora 1,'32778906';
SELECT * FROM editora_telefone;
/* PROCEDURE FUNCINARIO */
GO
CREATE PROCEDURE insere_telefone_funcionario
   @id_funcionario int,
   @telefone varchar(15)
AS
BEGIN
   INSERT INTO funcionario_telefone (id_funcionario, telefone)
   VALUES (@id_funcionario, @telefone)
END
GO
SELECT * FROM funcionario_telefone;
EXECUTE insere_telefone_funcionario 1, '980076563';
EXECUTE insere_telefone_funcionario 1,'992234679';
EXECUTE insere_telefone_funcionario 1,'990769897';
SELECT * FROM funcionario_telefone;

/* PROCEDURE FORNECEDOR */
GO
CREATE PROCEDURE insere_telefone_fornecedor
   @id_fornecedor int,
   @telefone varchar(15)
AS
BEGIN
   INSERT INTO fornecedor_telefone (id_fornecedor, telefone)
   VALUES (@id_fornecedor, @telefone)
END
GO
SELECT * FROM fornecedor_telefone;
EXECUTE insere_telefone_fornecedor 1, '32234579';
EXECUTE insere_telefone_fornecedor 1,'32678800';
EXECUTE insere_telefone_fornecedor 1,'32972255';
SELECT * FROM fornecedor_telefone;

/* FUNÇÃO DE CRIAÇÃO E USO */
-- A função irá receber como parâmetro o id do livro e irá retornar a quantidade de livros disponíveis
GO
CREATE FUNCTION qtde_livros_disponiveis(@id_livro INT)
RETURNS INT
AS
BEGIN
    DECLARE @quantidade_livros INT

    SELECT @quantidade_livros = SUM(quantidade)
    FROM item_compra
    WHERE livro_id = @id_livro

    RETURN @quantidade_livros
END
GO

INSERT INTO item_compra
VALUES(5, 1, 1, 2, 200);

SELECT dbo.qtde_livros_disponiveis(1) AS 'Quantidade de livros disponíveis'
SELECT * FROM item_compra