CREATE DATABASE TRABALHO

USE TRABALHO

-- CRIANDO TABELAS SEM CHAVE ESTRANGEIRA
CREATE TABLE FUNCIONARIOS (
Codigo INT PRIMARY KEY IDENTITY,
PrimeiroNome VARCHAR(255),
SegundoNome VARCHAR(255),
UltimoNome VARCHAR(255),
DataNasc DATE,
CPF VARCHAR(20),
RG VARCHAR(20),
Endereco CHAR(255),
CEP VARCHAR(20),
Cidade CHAR(255),
NumFone VARCHAR(20),
-- CodigoDepartamento É A CHAVE ESTRANGEIRA
CodigoDepartamento INT,
Funcao CHAR(60),
Salario MONEY
)

CREATE TABLE DEPARTAMENTOS (
Codigo INT PRIMARY KEY IDENTITY,
Nome CHAR(255),
Localizacao CHAR(255),
-- CodigoFuncionarioGerente É A CHAVE ESTRANGEIRA
CodigoFuncionarioGerente INT
)

-- INSERÇÃO DE DADOS
INSERT INTO FUNCIONARIOS VALUES -- JOAO, RECIFE, SEGUNDO NOME == NULL, PROGRAMADOR, SUPERVISOR, TELEFONISTA, GERENTE, CURITIBA, RECIFE, SÃO PAULO.
-- João e Recife
('João', 'Guilherme', 'Silva', '24-09-2000', '111.222.333-98', '12.455.129-8', 'Rua Alameda', '11420-410', 'Recife', '(41) 97834-2131', 5, 'Programador', 15000.00),
('Mario', null, 'Gomes', '22-12-1990', '121.325.433-11', '11.235.425-1', 'Rua cabrala', '12140-521', 'Curitiba', '(41) 99123-4152', 3, 'Supervisor', 8500.00),
('Fer', 'Telecom', 'Teleco', '22-09-1990', '213.442.323-18', '22.435.221-2', 'Rua telefono', '23440-124', 'São Paulo', '(41) 82844-2242', 4, 'Telefonista', 5000.00),
('Maria', 'Serafina', 'Floratti', '14-11-1998', '123.562.463-18', '12.455.129-8', 'Rua Marechal', '12410-450', 'Recife', '(44) 92414-5631', 1, 'Gerente', 12000.00),
('Ronaldo', 'Kraemer', 'Machado', '10-08-1999', '132.152.673-28', '12.455.129-8', 'Rua Floriano', '26460-110', 'Curitiba', '(41) 92154-2631', 2, 'Gerente', 11000.00),
('Guilherme', 'Gaucho', 'Lopes', '12-05-1987', '145.362.241-68', '12.455.129-8', 'Rua Peixoto', '14450-420', 'São Paulo', '(41) 85214-1121', 5, 'Gerente', 13000.00)

INSERT INTO DEPARTAMENTOS VALUES
('Pessoal', 'Localização Secreta 1', 2),
('Administrativo', 'Localização Secreta 2', 1),
('Comercial', 'Localização Secreta 3', 4),
('Recursos Humanos', 'Localização Secreta 4', 5),
('TI', 'HomeOffice', 6)

-- CRIANDO CHAVES ESTRANGEIRAS
ALTER TABLE FUNCIONARIOS ADD FOREIGN KEY(CodigoDepartamento)
REFERENCES DEPARTAMENTOS(Codigo)

ALTER TABLE DEPARTAMENTOS ADD FOREIGN KEY(CodigoFuncionarioGerente)
REFERENCES FUNCIONARIOS(Codigo)

SELECT * FROM FUNCIONARIOS
SELECT * FROM DEPARTAMENTOS

-- Exercicio 01
SELECT PrimeiroNome, UltimoNome FROM FUNCIONARIOS ORDER BY (UltimoNome)

-- Exercicio 02
SELECT * FROM FUNCIONARIOS ORDER BY (Cidade)

-- Exercicio 03
SELECT * FROM FUNCIONARIOS WHERE (Salario > 1000.00) ORDER BY (CONCAT(PrimeiroNome, SegundoNome, UltimoNome))

-- Exercicio 04
SELECT DataNasc, PrimeiroNome FROM FUNCIONARIOS ORDER BY (DataNasc) DESC

-- Exercicio 05
SELECT PrimeiroNome, UltimoNome, NumFone, Endereco, Cidade, CEP FROM FUNCIONARIOS

-- Exercicio 06
SELECT PrimeiroNome, UltimoNome, CPF, Salario FROM FUNCIONARIOS 

-- Exercicio 07
SELECT PrimeiroNome, Nome, Funcao FROM Funcionarios Funci INNER JOIN DEPARTAMENTOS Depart ON Funci.CodigoDepartamento = Depart.Codigo

-- Exercicio 08 (N tem nenhum na minha tabela :) )
SELECT * FROM FUNCIONARIOS WHERE (Salario < 1000.00) ORDER BY (CONCAT(PrimeiroNome, SegundoNome, UltimoNome))

-- Exercicio 09 
SELECT SUM(Salario) AS Pagamento_Total_Departamentos FROM FUNCIONARIOS Funci INNER JOIN DEPARTAMENTOS Depart ON Funci.CodigoDepartamento = Depart.Codigo GROUP BY (Depart.Codigo)

-- Exercicio 10
SELECT Nome AS Nome_Departamento FROM DEPARTAMENTOS Depart INNER JOIN FUNCIONARIOS Funci ON Funci.CodigoDepartamento = Depart.Codigo WHERE (Funci.Funcao = 'Supervisor')

-- Exercicio 11
SELECT COUNT(PrimeiroNome) AS Qntd_Funcionarios FROM FUNCIONARIOS

-- Exercicio 12 
SELECT AVG(Salario) AS Salario_Medio FROM FUNCIONARIOS

-- Exercicio 13
SELECT MIN(Salario) AS Menor_Salario FROM Funcionarios Funci INNER JOIN DEPARTAMENTOS Depart ON Funci.CodigoDepartamento = Depart.Codigo GROUP BY (Depart.Codigo)

-- Exercicio 14
SELECT * FROM FUNCIONARIOS WHERE (SegundoNome is null)

-- Exercicio 15 
SELECT Nome as Nome_Departamento, PrimeiroNome FROM FUNCIONARIOS Funci INNER JOIN DEPARTAMENTOS Depart ON Funci.CodigoDepartamento = Depart.Codigo ORDER BY Nome, PrimeiroNome

-- Exercicio 16
SELECT PrimeiroNome + ' ' + SegundoNome + ' ' + UltimoNome AS NOME_COMPLETO FROM FUNCIONARIOS
WHERE (Cidade = 'Recife' and Funcao = 'Programador')

-- Exercicio 17
SELECT PrimeiroNome + ' ' + SegundoNome + ' ' + UltimoNome AS NOME_COMPLETO FROM FUNCIONARIOS 
WHERE (codigoDepartamento = 1)

-- Exercicio 18
SELECT PrimeiroNome, Salario, Nome as Nome_Departamento FROM FUNCIONARIOS Funci INNER JOIN DEPARTAMENTOS Depart ON (Funci.CodigoDepartamento = Depart.Codigo) WHERE(Salario > 5000)

-- Exercicio 19
SELECT PrimeiroNome, UltimoNome FROM FUNCIONARIOS WHERE (Funcao = 'Telefonista' and Cidade = 'Curitiba')

-- Exercicio 20
SELECT Nome as Nome_Departamento FROM FUNCIONARIOS Funci INNER JOIN DEPARTAMENTOS Depart ON Funci.CodigoDepartamento = Depart.Codigo WHERE (Funci.Funcao = 'Programador')