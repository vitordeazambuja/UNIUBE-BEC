-- EXERCÍCIO 9
CREATE TABLE telefone(
	id_numero int not null PRIMARY KEY,
	numero varchar(15) not null
);

INSERT INTO telefone
VALUES
(1,'99587412'),
(2,'98632574'),
(3,'97412587');
select * from telefone;
GO
CREATE FUNCTION insere_prefixo(@id_numero INT)
RETURNS VARCHAR(15)
AS
BEGIN
DECLARE @numero_prefix VARCHAR(15)
SELECT @numero_prefix = '055'+numero
FROM telefone
WHERE @id_numero = id_numero
RETURN @numero_prefix
END
GO
SELECT dbo.insere_prefixo(1) AS 'Número com prefixo';
/*

-- Ex 10
create function ajuste_precos (@valor decimal(10,2))
returns decimal(10,2)
begin
	return abs(@valor * 1.05)
end

select dbo.ajuste_precos(-100)

-- Ex 11
create view VI_RANDOMVALOR
as
select * from cliente
select rand() * 1000

create function ajuste_precos (@valor decimal(10,2))
returns decimal(10,2)
begin
	return rand() * 1000
end

*/

--DATABASE ECOMMERCE

/** Criação das estruturas de banco de dados **/
-- Criação da tabela de cliente:
CREATE TABLE [dbo].[cliente](
	[id] [int] NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[email] [varchar](50) NULL,
	[senha] [varchar](8) NOT NULL
 CONSTRAINT [PK_CLIENTE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

-- Criação da tabela de produto:
CREATE TABLE [dbo].[produto](
	[id] [int] NOT NULL,
	[titulo] [varchar](150) NOT NULL,
	[descricao] [varchar](max) NULL,
	[preco] [decimal](6,2) NOT NULL,
	[nome_imagem] [int] NULL,
 CONSTRAINT [PK_PRODUTO] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

-- Criação da tabela de pedido:
CREATE TABLE [dbo].[pedido](
	[id] [int] NOT NULL,
	[id_cliente] [int] NOT NULL,
	[data_pedido] [datetime] NOT NULL,
	[total] [decimal](6,2) NOT NULL
 CONSTRAINT [PK_PEDIDO] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[pedido]  WITH CHECK ADD  CONSTRAINT [REL_01] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id])
GO

-- Criação da tabela de item de pedido:
CREATE TABLE [dbo].[item_pedido](
	[id_pedido] [int] NOT NULL,
	[id_produto] [int] NOT NULL,
	[preco_unitario] [decimal](6,2) NOT NULL,
	[quantidade] [int] NOT NULL,
	[preco_total] [decimal](6,2) NOT NULL
 CONSTRAINT [PK_ITM_PEDIDO] PRIMARY KEY CLUSTERED 
(
	[id_pedido] ASC,
	[id_produto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ALTER TABLE [dbo].[item_pedido]  WITH CHECK ADD  CONSTRAINT [REL_02] FOREIGN KEY([id_produto])
REFERENCES [dbo].[produto] ([id])
GO

ALTER TABLE [dbo].[item_pedido]  WITH CHECK ADD  CONSTRAINT [REL_03] FOREIGN KEY([id_pedido])
REFERENCES [dbo].[pedido] ([id])
GO

/** Criação dos registros de banco de dados **/
-- Inclusão dos registros de clientes:
insert into cliente(id, nome, email, senha) values (1, 'Maria das Dores', 'maria@microsoft.com.br', '41235');
insert into cliente(id, nome, email, senha) values (2, 'Maria Antonieta', 'mantonieta@gmail.com.br', 'ant0nie');
insert into cliente(id, nome, email, senha) values (3, 'João Batista', 'joaozinho@microsoft.com.br', 'jo@oB');
insert into cliente(id, nome, email, senha) values (4, 'Deivid Felipe Castro', 'deivid@yahoo.com.br', 'de1v!d');
insert into cliente(id, nome, email, senha) values (5, 'Maria das Dores', 'mariadasdores@gmail.com.br', '1234');

-- Inclusão dos registros de produtos:
insert into produto(id, titulo, preco, nome_imagem, descricao) values (1, 'Samsung Galaxy S7', 2799, 4512, 'Câmera Dual Pixel 12 MP. Resistência à água e poeira - IP68. Design inigualável em metal e vidro.');
insert into produto(id, titulo, preco, nome_imagem, descricao) values (2, 'Xperia ZQ', 1000, 982, 'O Xperia ZQ é um smartphone da Sony no Brasil compatível com a rede 4G. O aparelho oferece uma tela de 5 polegadas, tecnologia Bravia 2 e resolução Full HD (1920 x 1080 pixels).');
insert into produto(id, titulo, preco, nome_imagem, descricao) values (3, 'Samsung Galaxy S6', 1762.99, 9652, 'O Samsung Galaxy S6 é um smartphone Android avançado e abrangente em todos os pontos de vista com algumas características excelentes. Tem uma grande tela de 5.1 polegadas com uma resolução de 2560x1440 pixels. As funcionalidades oferecidas pelo Samsung Galaxy S6 são muitas e inovadoras. Começando pelo LTE 4G que permite a transferência de dados e excelente navegação na internet. ');
insert into produto(id, titulo, preco, nome_imagem, descricao) values (3, 'Samsung Galaxy A32', 1345.00, 9652, 'O Samsung Galaxy A32 é um smartphone Android avançado e abrangente em todos os pontos de vista com algumas características excelentes. Tem uma grande tela de 5.1 polegadas com uma resolução de 2560x1440 pixels. As funcionalidades oferecidas pelo Samsung Galaxy S6 são muitas e inovadoras. Começando pelo LTE 4G que permite a transferência de dados e excelente navegação na internet. ');
insert into produto(id, titulo, preco, nome_imagem, descricao) values (3, 'Samsung Galaxy S20', 2080.00, 9652, 'O Samsung Galaxy S20 é um smartphone Android avançado e abrangente em todos os pontos de vista com algumas características excelentes. Tem uma grande tela de 5.1 polegadas com uma resolução de 2560x1440 pixels. As funcionalidades oferecidas pelo Samsung Galaxy S6 são muitas e inovadoras. Começando pelo LTE 4G que permite a transferência de dados e excelente navegação na internet. ');

-- Inclusão dos pedidos:
insert into pedido(id, id_cliente, data_pedido, total) values (1, 1, convert(datetime, '11/04/2017', 103), 3799);
insert into pedido(id, id_cliente, data_pedido, total) values (2, 1, convert(datetime, '10/04/2017', 103), 1000);
insert into pedido(id, id_cliente, data_pedido, total) values (3, 2, convert(datetime, '09/04/2017', 103), 2000);
insert into pedido(id, id_cliente, data_pedido, total) values (4, 3, convert(datetime, '09/04/2017', 103), 2200);

-- Inclusão de item de pedido
insert into item_pedido(id_pedido, id_produto, preco_unitario, quantidade, preco_total) values (1, 1, 2799, 1, 2799);
insert into item_pedido(id_pedido, id_produto, preco_unitario, quantidade, preco_total) values (1, 2, 1000, 1, 1000);
insert into item_pedido(id_pedido, id_produto, preco_unitario, quantidade, preco_total) values (2, 2, 1000, 1, 1000);
insert into item_pedido(id_pedido, id_produto, preco_unitario, quantidade, preco_total) values (3, 2, 1000, 2, 1000);
insert into item_pedido(id_pedido, id_produto, preco_unitario, quantidade, preco_total) values (4, 2, 1100, 2, 2200);

--EX 12
GO
CREATE FUNCTION concat_nome_aparelho(@id_cliente INT)
RETURNS VARCHAR(255)
AS
BEGIN
DECLARE @concat VARCHAR(255)
SELECT @concat = CONCAT(cliente.nome, ' - ', produto.titulo)
FROM item_pedido
INNER JOIN 
END
GO