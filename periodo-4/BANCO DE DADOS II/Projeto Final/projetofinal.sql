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
genero varchar(125) not null,
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
(1,'Companhia das Letras','Rua Bandeira Paulista, 702, cj.32, 04532-002 São Paulo - SP'),
(2,'Darkside Books','Av. Portugal, 46 - Galpão 1 - Itaqui - Itapevi - SP'),
(3,'Editora Aleph','Rua Tabapuã, 81 – Conj. 134, Itaim Bibi – São Paulo/SP'),
(4,'Globo Livros','Rua Marquês de Pombal, 25 – 2º andar – Centro – Rio de Janeiro – RJ'),
(5,'Editora Intrínseca','Rua Marquês de São Vicente, 99 / 6º andar Gávea - Rio de Janeiro - RJ');
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
INSERT INTO livro
VALUES
(1,1,'Um Verão Italiano', 'Romance', 'Rebecca Serle'),
(2,1,'Oito Horas Perfeitas', 'Romance', 'Lia Louis'),
(3,1,'João e Maria', 'Infantil','Hervé Le Goff'),
(4,2,'O Demonologiasta', 'Terror', 'Gillian Flynn'),
(5,2,'Evangelho de Sangue', 'Terror', 'Clive Barker'),
(6,2,'Fragmentos do Horror', 'Terror', 'Junji Ito'),
(7,3,'1984', 'Ficção', 'George Orwell'),
(8,3,'Blade Runner', 'Ficção', 'Philip K. Dick'),
(9,3,'A Revolução dos Bichos', 'Ficção', 'George Orwell'),
(10,4,'O Iglu', 'Infantil', 'Flávia Lins e Silva'),
(11,4,'A Mecânica do Amor', 'Romance', 'Alexene Farol Follmuth'),
(12,4,'Minhas Mãos', 'Infantil', 'Néjib'),
(13,5,'A Culpa é Das Estrelas', 'Romance', 'John Green'),
(14,5,'Vovê deu no pé', 'Infantil', 'David Williams'),
(15,5,'Terra Faminta', 'Terror', 'Andrew Michael Hurley');

/* POPULANDO A TABELA COM WHILE
DECLARE @contador INT = 1;
WHILE @contador <= 20
BEGIN
	INSERT INTO livro
	VALUES (@contador, FLOOR(RAND()*5)+1,'Livro '+CAST(@contador AS VARCHAR),'Genero ' +CAST(@contador AS VARCHAR),'Autor '+CAST(@contador AS VARCHAR));
	SET @contador += 1;
END
*/

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
(1,2,1,1,50.93);
INSERT INTO item_pedido
VALUES
(2,3,1,2,48.91);
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
(1,1,1,1,40.93);
INSERT INTO item_compra
VALUES
(2,2,2,2,38.91);
INSERT INTO item_compra
VALUES
(3,3,3,3,32.83);
INSERT INTO item_compra
VALUES
(4,4,4,2,23.90);
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
SELECT id_livro,titulo,autor, IIF(editora_id = 5, 'livro da Editora Intrínseca','livro de outra editora')
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
VALUES(5, 1, 1, 2, 40.93);
SELECT dbo.qtde_livros_disponiveis(1) AS 'Quantidade de livros disponíveis'
SELECT * FROM item_compra

-- MINERAÇÃO DE DADOS
SELECT * FROM pedido;
SELECT * FROM item_pedido;
/* CRIAÇÃO DE PEDIDOS */
INSERT INTO pedido
VALUES
(2,1,'01-04-23',0),
(3,2,'02-04-23',0),
(4,3,'03-04-23',0),
(5,4,'04-04-23',0),
(6,5,'05-04-23',0),
(7,1,'06-04-23',0),
(8,2,'07-04-23',0),
(9,3,'08-04-23',0),
(10,4,'09-04-23',0),
(11,5,'10-04-23',0),
(12,1,'11-04-23',0),
(13,2,'12-04-23',0),
(14,3,'13-04-23',0),
(15,4,'14-04-23',0),
(16,5,'15-04-23',0),
(17,1,'16-04-23',0);
/* CRIAÇÃO ITEM PEDIDOS */
--CARRINHO 2
INSERT INTO item_pedido
VALUES
(3,1,2,1,50.93);
INSERT INTO item_pedido
VALUES
(4,4,2,1,33.90);
--CARRINHO 3
INSERT INTO item_pedido
VALUES
(5,7,3,1,14.90);
INSERT INTO item_pedido
VALUES
(6,4,3,1,33.90);
--CARRINHO 4
INSERT INTO item_pedido
VALUES
(7,3,4,1,42.83);
--CARRINHO 5
INSERT INTO item_pedido
VALUES
(8,2,5,1,48.91);
INSERT INTO item_pedido
VALUES
(9,10,5,1,61.60);
--CARRINHO 6
INSERT INTO item_pedido
VALUES
(10,5,6,1,40.99);
--CARRINHO 7
INSERT INTO item_pedido
VALUES
(11,8,7,1,44.16);
INSERT INTO item_pedido
VALUES
(12,6,7,1,43.90);
--CARRINHO 8
INSERT INTO item_pedido
VALUES
(13,11,8,1,49.90);
INSERT INTO item_pedido
VALUES
(14,12,8,1,72.08);
--CARRINHO 9
INSERT INTO item_pedido
VALUES
(15,13,9,1,30.99);
--CARRINHO 10
INSERT INTO item_pedido
VALUES
(16,9,10,1,11.70);
--CARRINHO 11
INSERT INTO item_pedido
VALUES
(17,7,11,1,14.90);
INSERT INTO item_pedido
VALUES
(18,15,11,1,44.99);
--CARRINHO 12
INSERT INTO item_pedido
VALUES
(19,14,12,1,49);
--CARRINHO 13
INSERT INTO item_pedido
VALUES
(20,7,13,1,14.90);
INSERT INTO item_pedido
VALUES
(21,4,13,1,33.90);
--CARRINHO 14
INSERT INTO item_pedido
VALUES
(22,5,14,1,40.99);
INSERT INTO item_pedido
VALUES
(23,3,14,1,42.83);
--CARRINHO 15
INSERT INTO item_pedido
VALUES
(24,1,15,1,50.93);
INSERT INTO item_pedido
VALUES
(25,10,15,1,61.60);
--CARRINHO 16
INSERT INTO item_pedido
VALUES
(26,6,16,1,43.90);
--CARRINHO 17
INSERT INTO item_pedido
VALUES
(27,2,17,1,48.91);
INSERT INTO item_pedido
VALUES
(28,12,17,1,72.08);

/* SUPORTE E CONFIANÇA */

--FICÇÃO E TERROR
--QUANTIDADE DE LIVROS DE FICÇÃO
DECLARE @qntlivrofic int;
SET @qntlivrofic = (
SELECT COUNT(itp.id_item_pedido) AS 'Carrinhos com livros de Ficção'
FROM item_pedido itp
INNER JOIN livro l
ON itp.livro_id = l.id_livro
WHERE l.genero = 'Ficção'
);
PRINT('Sup(Ficção) = '+CAST(@qntlivrofic AS VARCHAR));
-- 5 CARRINHOS COM LIVROS DE FICÇÃO

--QUANTIDADE DE LIVROS DE TERROR
DECLARE @qntlivroterror int;
SET @qntlivroterror = (
SELECT COUNT(itp.id_item_pedido) AS 'Carrinhos com livros de Terror'
FROM item_pedido itp
INNER JOIN livro l
ON itp.livro_id = l.id_livro
WHERE l.genero = 'Terror'
);
PRINT('Sup(Terror) = '+CAST(@qntlivroterror AS VARCHAR));
-- 8 CARRINHOS COM LIVROS DE TERROR

--QUANTIDADE DE CARRINHOS COM LIVROS DE FICÇÃO E TERROR JUNTOS
DECLARE @qntftjuntos int;
SET @qntftjuntos = ( 
SELECT COUNT(*) AS 'Carrinhos com livros de Ficção e Terror'
FROM (
  SELECT pedido_id
  FROM item_pedido
  WHERE livro_id IN (
    SELECT id_livro
    FROM livro
    WHERE genero IN ('Ficção', 'Terror')
  )
  GROUP BY pedido_id
  HAVING COUNT(DISTINCT livro_id) = 2
) AS a
);
PRINT('Sup({Ficção} -> {Terror}) = '+ CAST(@qntftjuntos AS VARCHAR));
-- 4 CARRINHOS COM LIVROS DE FICÇÃO E TERROR JUNTOS

-- REGRA DE ASSOCIAÇÃO {Ficção} -> {Terror}
DECLARE @confficterror DECIMAL(10,2);
SET @confficterror = ((@qntftjuntos*1.0/@qntlivrofic)*100);
PRINT('Conf({Ficção} -> {Terror}) = '+ CAST(@confficterror AS VARCHAR)  +'%');
DECLARE @confterrorfic DECIMAL(10,2);
SET @confterrorfic = ((@qntftjuntos*1.0/@qntlivroterror)*100);
PRINT('Conf({Terror} -> {Ficção}) = '+ CAST(@confterrorfic AS VARCHAR) +'%');

--ROMANCE E INFANTIL
--QUANTIDADE DE LIVROS DE ROMANCE
DECLARE @qntlivrorom INT;
SET @qntlivrorom = (
SELECT COUNT(itp.id_item_pedido) AS 'Carrinhos com livros de Romance'
FROM item_pedido itp
INNER JOIN livro l
ON itp.livro_id = l.id_livro
WHERE l.genero = 'Romance'
);
PRINT('Sup(Romance) = '+ CAST(@qntlivrorom AS VARCHAR));
--QUANTIDADE DE LIVROS INFANTIS
DECLARE @qntlivroinf INT
SET @qntlivroinf = (
SELECT COUNT(itp.id_item_pedido) AS 'Carrinhos com livros Infantis'
FROM item_pedido itp
INNER JOIN livro l
ON itp.livro_id = l.id_livro
WHERE l.genero = 'Infantil'
);
PRINT('Sup(Infantil) = '+ CAST(@qntlivroinf AS VARCHAR));
--QUANTIDADE DE CARRINHOS COM LIVROS DE ROMANCE E INFANTIL JUNTOS
DECLARE @qntrijuntos INT
SET @qntrijuntos = (
SELECT COUNT(*) AS 'Carrinhos com livros de Romance e Infantis'
FROM (
  SELECT pedido_id
  FROM item_pedido
  WHERE livro_id IN (
    SELECT id_livro
    FROM livro
    WHERE genero IN ('Romance', 'Infantil')
  )
  GROUP BY pedido_id
  HAVING COUNT(DISTINCT livro_id) = 2
) AS a
);
PRINT('Sup({Romance} -> {Infantil}) = '+ CAST(@qntrijuntos AS VARCHAR));
-- REGRA DE ASSOCIAÇÃO {Romance} -> {Infantil}
DECLARE @confrominfantil DECIMAL(10,2);
SET @confrominfantil = ((@qntrijuntos*1.0/@qntlivrorom)*100);
PRINT('Conf({Romance} -> {Infantil}) = '+ CAST(@confrominfantil AS VARCHAR)  +'%');
DECLARE @confinfromance DECIMAL(10,2);
SET @confinfromance = ((@qntrijuntos*1.0/@qntlivroinf)*100);
PRINT('Conf({Infantil} -> {Romance}) = '+ CAST(@confinfromance AS VARCHAR) +'%');