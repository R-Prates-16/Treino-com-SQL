CREATE DATABASE NutriPlan

USE NutriPlan

CREATE TABLE Paciente (
	CPF_Paciente VARCHAR(14) PRIMARY KEY NOT NULL,
	RG VARCHAR(13) NOT NULL,
	Nome VARCHAR(50) NOT NULL,
	Idade INT NOT NULL,
	Sexo BIT NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Telefone_Paciente VARCHAR(15) NOT NULL,
	Convênio VARCHAR (50) NOT NULL   --AQUIIIIII--
);

CREATE TABLE Consulta (
	ID_Consulta VARCHAR(5) PRIMARY KEY NOT NULL,
	Tipo_Consulta BIT NOT NULL,
	Data DATETIME NOT NULL,
	Valor DECIMAL(7, 2) NOT NULL,
	CPF_Paciente VARCHAR(14) NOT NULL,
	CRN_Nutricionista VARCHAR(12) NOT NULL
);

CREATE TABLE Especialidade (
	ID_Especialidade VARCHAR(2) PRIMARY KEY NOT NULL,
	Nome_Especialidade VARCHAR(20) NOT NULL,
	Salário_Base DECIMAL(6, 2) NOT NULL
);

CREATE TABLE Nutricionista (
	CRN_Nutricionista VARCHAR(12) PRIMARY KEY NOT NULL,
	CPF VARCHAR(14) NOT NULL,
	Nome_Nutricionista VARCHAR(50) NOT NULL,
	Email_Nutricionista VARCHAR(50) NOT NULL,
	Carga_horária INT NOT NULL,
	Salário_mensal FLOAT NOT NULL,      -- AQUIIIII--
	Telefone_Nutricionista VARCHAR(19) NOT NULL,
	ID_Especialidade VARCHAR(2) NOT NULL,
);

-- Inserindo registros na tabela Paciente
INSERT INTO Paciente (CPF_Paciente, RG, Nome, Idade, Sexo, Email, Telefone_Paciente, Convênio) VALUES --AQUIIII--
('123.456.789-00', '12.345.678-9', 'João Silva', 30, 1, 'joao.silva@example.com', '(11) 98765-4321', 'Amil 300'),
('987.654.321-00', '98.765.432-1', 'Maria Oliveira', 25, 0, 'maria.oliveira@example.com', '(21) 91234-5678', 'Amil 500'),
('321.654.987-00', '21.456.789-0', 'Ana Santos', 28, 1, 'ana.santos@example.com', '(31) 93456-7890', 'Sul América - Plano Exato'),
('654.321.987-00', '32.765.432-0', 'Pedro Almeida', 40, 0, 'pedro.almeida@example.com', '(41) 91234-5678', 'Bradesco - Plano Efetivo' ),
('159.753.486-00', '54.321.987-0', 'Clara Ferreira', 35, 1, 'clara.ferreira@example.com', '(51) 98765-4321', 'Unimed - UnitPart Básico');

-- Inserindo registros na tabela Consulta
INSERT INTO Consulta (ID_Consulta, Tipo_Consulta, Data, Valor, CPF_Paciente, CRN_Nutricionista) VALUES
('C001', 1, '2024-24-12', 150.00, '123.456.789-00', 'CRN123456'),
('C002', 0, '2024-26-10', 200.00, '987.654.321-00', 'CRN654321'),
('C003', 1, '2024-11-01', 180.00, '321.654.987-00', 'CRN123456'),
('C004', 0, '2024-30-10', 220.00, '654.321.987-00', 'CRN654321'),
('C005', 1, '2024-12-05', 160.00, '159.753.486-00', 'CRN123456');

-- Inserindo registros na tabela Especialidade
INSERT INTO Especialidade (ID_Especialidade, Nome_Especialidade, Salário_Base) VALUES
('01', 'Nutrição Clínica', 3000.00),
('02', 'Nutrição Esportiva', 4000.00),
('03', 'Nutrição Funcional', 3500.00),
('04', 'Nutrição Pediátrica', 3700.00),
('05', 'Nutrição Geriátrica', 3900.00);

-- Inserindo registros na tabela Nutricionista
INSERT INTO Nutricionista (CRN_Nutricionista, CPF, Nome_Nutricionista, Email_Nutricionista, Carga_horária, Salário_mensal, Telefone_Nutricionista, ID_Especialidade) VALUES
('CRN123456', '111.222.333-44', 'Fernanda Costa', 'fernanda.costa@example.com', '40', 3500, '(31) 99876-5432', '01'),
('CRN654321', '222.333.444-55', 'Carlos Pereira', 'carlos.pereira@example.com', '30', 4000, '(41) 98765-4321', '02'),
('CRN789012', '333.444.555-66', 'Juliana Martins', 'juliana.martins@example.com', '35', 4200, '(51) 99876-5432', '03'),
('CRN890123', '444.555.666-77', 'Ricardo Gomes', 'ricardo.gomes@example.com', '40', 3600, '(61) 98765-4321', '04'),
('CRN901234', '555.666.777-88', 'Tatiane Lima', 'tatiane.lima@example.com', '30', 4200, '(71) 91234-5678', '05');

ALTER TABLE Consulta
ADD CONSTRAINT FK_Consulta_Paciente FOREIGN KEY (CPF_Paciente)
REFERENCES Paciente(CPF_Paciente);

ALTER TABLE Consulta
ADD CONSTRAINT FK_Consulta_Nutricionista FOREIGN KEY (CRN_Nutricionista)
REFERENCES Nutricionista(CRN_Nutricionista);

ALTER TABLE Nutricionista
ADD CONSTRAINT FK_Nutricionista_Especialidade FOREIGN KEY (ID_Especialidade)
REFERENCES Especialidade(ID_Especialidade);

CREATE INDEX IDX_CPF_Paciente ON Paciente (CPF_Paciente);

SELECT
	*
FROM
	Nutricionista
INNER JOIN Consulta
	ON Consulta.CRN_Nutricionista = Nutricionista.CRN_Nutricionista

SELECT * FROM Paciente
SELECT * FROM Consulta
SELECT * FROM Especialidade
SELECT * FROM Nutricionista















	