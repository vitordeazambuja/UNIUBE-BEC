CREATE TABLE canteiro(
	canteiroId INT PRIMARY KEY,
	nome CHAR(20),
	luzdiaria DECIMAL(4,3),
	aguadiaria DECIMAL(4,3)
);
CREATE TABLE funcionario(
	funcId INT PRIMARY KEY,
	nome CHAR(20),
	idade INT
);
CREATE TABLE planta(
	id INT PRIMARY KEY,
	nome CHAR(20),
	luzdiaria DECIMAL(4,3),
	agua DECIMAL(4,3),
	peso DECIMAL(4,3)
);
CREATE TABLE plantio(
	plantioId INT PRIMARY KEY,
	plantaId INT FOREIGN KEY REFERENCES planta(id),
	funcId INT FOREIGN KEY REFERENCES funcionario(funcId),
	canteiroId INT FOREIGN KEY REFERENCES canteiro(canteiroId),
	data DATE,
	sementes INT
);
CREATE TABLE colhido(
	colhidoId INT PRIMARY KEY,
	plantaId INT FOREIGN KEY REFERENCES planta(id),
	funcId INT FOREIGN KEY REFERENCES funcionario(funcId),
	canteiroId INT FOREIGN KEY REFERENCES canteiro(canteiroId),
	data DATE,
	quantidade INT,
	peso DECIMAL(4,3)
);