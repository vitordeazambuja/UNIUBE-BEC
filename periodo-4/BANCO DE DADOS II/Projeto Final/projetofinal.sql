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

CREATE TABLE venda(
	id_venda int not null,
	data_venda date not null,
	valor_total_venda decimal(12,2) not null,
	cliente_id int not null,
	PRIMARY KEY (id_venda),
	FOREIGN KEY (cliente_id) REFERENCES cliente(id_cliente)
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
	venda_id int not null,
	funcionario_id int not null,
	PRIMARY KEY (id_pagamento),
	FOREIGN KEY (venda_id) REFERENCES venda(id_venda),
	FOREIGN KEY (funcionario_id) REFERENCES funcionario(id_funcionario)
);

/* TRIGGER */
/* IF CONDICIONAL */
/* IFF FUNÇÃO */
/* WHILE BREAK */
/* CASE WHEN */