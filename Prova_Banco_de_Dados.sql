CREATE DATABASE AméricaSuns_Elétricos

USE AméricaSuns_Elétricos

CREATE TABLE Clientes (
	ID_Cliente INT PRIMARY KEY NOT NULL,
	RG VARCHAR(13) NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	Nascimento DATE NOT NULL,
	Sexo BIT NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Telefone_Cliente VARCHAR(15) NOT NULL
);

CREATE TABLE Produto (
	ID_Produto INT PRIMARY KEY NOT NULL,
	Tipo BIT NOT NULL,
	Fabricação DATETIME NOT NULL,
	Valor DECIMAL(7, 2) NOT NULL
);


CREATE TABLE Funcionários (
	ID_Funcionário INT PRIMARY KEY NOT NULL,
	CPF VARCHAR(14) NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Carga_horaria INT NOT NULL,
	Salario_mensal FLOAT NOT NULL,     
	Telefone VARCHAR(19) NOT NULL
);

-- Inserindo registros na tabela Clientes
INSERT INTO Clientes(ID_Cliente, RG, Nome, Nascimento, Sexo, Email, Telefone_Cliente) VALUES
(1, '12.345.678-9', 'Joao Silva', '1998-09-09', 1, 'joao.silva@example.com', '(11) 98765-4321'),
(2, '98.765.432-1', 'Maria Oliveira', '1999-10-10', 0, 'maria.oliveira@example.com', '(21) 91234-5678'),
(3, '21.456.789-0', 'Ana Santos', '2000-01-01', 0, 'ana.santos@example.com', '(31) 93456-7890'),
(4, '32.765.432-0', 'Pedro Almeida', '2002-03-03', 1, 'pedro.almeida@example.com', '(41) 91234-5678'),
(5, '54.321.987-0', 'Clara Ferreira', '2005-12-05', 0, 'clara.ferreira@example.com', '(51) 98765-4321');

-- Inserindo registros na tabela Produto
INSERT INTO Produto(ID_Produto, Tipo, Fabricação, Valor) VALUES
(1, 1, '2024-24-12', 150.00),
(2, 0, '2024-26-10', 200.00),
(3, 1, '2024-11-01', 180.00),
(4, 0, '2024-30-10', 220.00),
(5, 1, '2024-12-05', 160.00);


-- Inserindo registros na tabela Funcionários
INSERT INTO Funcionários(ID_Funcionário, CPF, Nome, Email, Carga_horaria, Salario_mensal, Telefone) VALUES
(1, '111.222.333-44', 'Fernanda Costa', 'fernanda.costa@example.com', '40', 3500, '(31) 99876-5432'),
(2, '222.333.444-55', 'Carlos Pereira', 'carlos.pereira@example.com', '30', 4000, '(41) 98765-4321'),
(3, '333.444.555-66', 'Juliana Martins', 'juliana.martins@example.com', '35', 4200, '(51) 99876-5432'),
(4, '444.555.666-77', 'Ricardo Gomes', 'ricardo.gomes@example.com', '40', 3600, '(61) 98765-4321'),
(5, '555.666.777-88', 'Tatiane Lima', 'tatiane.lima@example.com', '30', 4200, '(71) 91234-5678');





SELECT * FROM Clientes
SELECT * FROM Produto
SELECT * FROM Funcionários




--VIEWS-- 
CREATE VIEW Gender AS

SELECT
CPF_Cliente,
Nome,
Sexo

FROM Clientes

WHERE Sexo = '1'

--Retorna apenas clientes da loja de elétricos com o sexo=1 que significa masculino

--Tipo=1 Masculino
--Tipo=2 Feminino 







--FUNCTION-- 
CREATE FUNCTION CalcularANOS (@data_de_nascimento DATE)
RETURNS INT
AS
BEGIN 
	 RETURN DATEDIFF(YEAR, @data_de_nascimento, GETDATE());
END;

SELECT Nome, dbo.CalcularANOS(Nascimento) AS Idade
FROM Clientes

--Transforma a data de nascimento do cliente da loja em idade








--TRIGGER-- (Funciona)
CREATE OR ALTER TRIGGER Cliente_Adicionado
ON Clientes
AFTER INSERT
AS

BEGIN
	DECLARE @ultimo_cliente VARCHAR(20)
	SELECT @ultimo_cliente = Nome FROM Clientes ORDER BY CPF_Cliente ASC 

	PRINT @ultimo_cliente + 'adicionado com sucesso'
END

GO
INSERT INTO Clientes (ID_Cliente, RG, Nome, Nascimento, Sexo, Email, Telefone_Cliente)
VALUES (6, '99.888.555.1', 'João Prates', '1990-05-09', 1, 'joaoprateessss@gmail.com', '(11) 99995-5648');

--Notifica Quando alguém é adicionado na tabela Clientes






--WINDOW FUNCTIONS-- 
SELECT 
Nome,
Carga_horaria,
AVG(Salario_mensal) OVER (PARTITION BY Carga_horaria) AS 'Sálario por carga horária'

FROM Funcionários

--Esse código apresenta a média salárial levando em consideração a carga horária, ou seja, você consegue averigar se os salários estão equilibrados de acordo com a carga horária, levando em
--consideração a quantidae de médico para cada carga horária







--PROCEDURE--
IF EXISTS (SELECT 1 FROM SYS.objects WHERE TYPE = 'P' AND NAME = 'SP_ADD_CLIENTE')
	BEGIN
		DROP PROCEDURE SP_ADD_CLIENTE
	END
GO

CREATE PROCEDURE SP_ADD_CLIENTE
	@ID_Cliente INT,
	@RG VARCHAR(13),
	@Nome VARCHAR(50),
	@Nascimento DATE,
	@Sexo BIT,
	@Email VARCHAR(50),
	@Telefone_Cliente VARCHAR(15)

AS

INSERT INTO Clientes(ID_Cliente, RG, Nome, Nascimento, Sexo, Email, Telefone_Cliente) 
	VALUES (@ID_Cliente, @RG, @Nome, @Nascimento, @Sexo, @Email, @Telefone_Cliente);

EXEC SP_ADD_CLIENTE
	@ID_Cliente = 6,
	@RG = '12.666.789.2',
	@Nome = 'Rian Fernando',
	@Nascimento = '2007-08-01',
	@Sexo = 1,
	@Email = 'rianprates@gmail.com',
	@Telefone_Cliente = '(11) 48229-6855'

SELECT* FROM Clientes
--Automatiza o processo de adição de clientes na loja de elétricos




--CTE-- 
WITH Compra_Detalhes
AS(

SELECT
Tipo,
Valor

FROM Produto
)


SELECT *
FROM Compra_Detalhes
ORDER BY Valor

--Ele especifica o valor dos produtos e os seus preços, ou seja, é possivel analisar se o tipo 1 ou o tipo 2 de produtos tem os 
--preços mais elavados, ou seja, cria uma tabela temporária que torna mais fácil a comparação dos preços com os produtos, ordenando do produto mais caro para o mais barato.
