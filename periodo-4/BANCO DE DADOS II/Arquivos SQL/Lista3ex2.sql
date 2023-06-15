-- CRIAÇÃO DE TABELAS
CREATE TABLE canteiro(
	canteiroId INT PRIMARY KEY,
	nome VARCHAR(20),
	luzdiaria DECIMAL(4,3),
	aguadiaria DECIMAL(4,3)
);
CREATE TABLE funcionario(
	funcId INT PRIMARY KEY,
	nome VARCHAR(20),
	idade INT
);
CREATE TABLE planta(
	id INT PRIMARY KEY,
	nome VARCHAR(20),
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

-- INSERTS NAS TABELAS
select * from canteiro;
INSERT INTO canteiro VALUES
    (1, 'Canteiro 1', 4.5, 3.2),
    (2, 'Canteiro 2', 3.8, 2.9),
    (3, 'Canteiro 3', 5.1, 4.3),
    (4, 'Canteiro 4', 3.2, 2.1),
    (5, 'Canteiro 5', 4.7, 3.9),
    (6, 'Canteiro 6', 3.9, 2.7),
    (7, 'Canteiro 7', 4.2, 3.5),
    (8, 'Canteiro 8', 3.5, 2.4),
    (9, 'Canteiro 9', 4.9, 4.1),
    (10, 'Canteiro 10', 3.6, 2.8);

select * from funcionario;
INSERT INTO funcionario VALUES
    (1, 'Funcionário 1', 28),
    (2, 'Funcionário 2', 35),
    (3, 'Funcionário 3', 74),
    (4, 'Funcionário 4', 31),
    (5, 'Funcionário 5', 67),
    (6, 'Funcionário 6', 15),
    (7, 'Funcionário 7', 17),
    (8, 'Funcionário 8', 19),
    (9, 'Funcionário 9', 39),
    (10, 'Funcionário 10', 26);

INSERT INTO planta VALUES
    (1, 'Planta 1', 4.5, 3.2, 0.6),
    (2, 'Planta 2', 3.8, 2.9, 0.5),
    (3, 'Planta 3', 5.1, 4.3, 0.7),
    (4, 'Planta 4', 3.2, 2.1, 0.4),
    (5, 'Planta 5', 4.7, 3.9, 0.8),
    (6, 'Planta 6', 3.9, 2.7, 0.5),
    (7, 'Planta 7', 4.2, 3.5, 0.6),
    (8, 'Planta 8', 3.5, 2.4, 0.4),
    (9, 'Planta 9', 4.9, 4.1, 0.7),
    (10, 'Planta 10', 3.6, 2.8, 0.5);

INSERT INTO plantio VALUES
    (1, 1, 1, 1, '2015-05-01', 100),
    (2, 2, 3, 2, '2023-05-02', 150),
    (3, 3, 2, 3, '2023-05-03', 120),
    (4, 4, 4, 4, '2016-05-04', 90),
    (5, 5, 5, 5, '2023-05-05', 110),
    (6, 6, 6, 6, '2023-05-06', 140),
    (7, 7, 7, 7, '2017-05-07', 130),
    (8, 8, 8, 8, '2023-05-08', 160),
    (9, 9, 9, 9, '2023-05-09', 170),
    (10, 10, 10, 10, '2023-05-10', 180);

INSERT INTO colhido VALUES
    (1, 1, 1, 1, '2023-05-15', 80, 1.8),
    (2, 2, 3, 2, '2023-05-16', 120, 2.5),
    (3, 3, 2, 3, '2023-05-17', 90, 2.1),
    (4, 4, 4, 4, '2023-05-18', 70, 1.6),
    (5, 5, 5, 5, '2023-05-19', 100, 2.2),
    (6, 6, 6, 6, '2023-05-20', 130, 2.8),
    (7, 7, 7, 7, '2023-05-21', 110, 2.4),
    (8, 8, 8, 8, '2023-05-22', 150, 3.0),
    (9, 9, 9, 9, '2023-05-23', 160, 3.3),
    (10, 10, 10, 10, '2023-05-24', 170, 3.5);

-- EX LETRA C
SELECT * FROM plantio
WHERE year(data) > 2017;

-- EX LETRA D
SELECT * FROM funcionario
WHERE idade < 18 OR idade > 60;

-- EX LETRA E
GO
CREATE PROCEDURE colhidofunc
@idfunc INT
AS
BEGIN
SELECT * FROM colhido
WHERE colhido.funcId = @idfunc
END;

EXECUTE colhidofunc 1;

-- EX LETRA F
GO
CREATE VIEW divcanteiro AS
SELECT c.nome AS 'Canteiros Diversificados'
FROM canteiro c
INNER JOIN plantio p ON c.canteiroId = p.canteiroId
GROUP BY c.nome
HAVING COUNT(DISTINCT p.plantaId) > 1;
GO

INSERT INTO plantio
VALUES
(11,1,1,1,'2023-05-24',170),
(12,1,1,1,'2023-05-24',170),
(13,1,1,1,'2023-05-24',170),
(14,2,1,4,'2023-05-24',170),
(15,2,1,4,'2023-05-24',170);

SELECT * FROM plantio

SELECT * FROM divcanteiro;