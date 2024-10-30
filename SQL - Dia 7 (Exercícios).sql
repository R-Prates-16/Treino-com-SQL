--1)

DECLARE @Valor1 INT
DECLARE @Valor2 INT
DECLARE @Valor3 INT
DECLARE @Valor4 INT

SET @Valor1 = 10
SET @Valor2 = 5
SET @Valor3 = 34
SET @Valor4 = 7

--A) Soma
DECLARE @Soma INT
SET @Soma = @Valor1 + @Valor2

SELECT @Soma 

--B) Subtração
DECLARE @Subtração INT
SET @Subtração = @Valor3 - @Valor4

SELECT @Subtração


--C) 
DECLARE @Multiplicação INT
SET @Multiplicação = @Valor1 * @Valor4

SELECT @Multiplicação


--D)
DECLARE @Divisão FLOAT
SET @Divisão = CAST(@Valor3 AS FLOAT) / CAST(@Valor4 AS FLOAT)

SELECT ROUND (@Divisão, 2)

    

--2)
DECLARE @Produto Varchar
SET @Produto = 'Celular'

DECLARE @Quantidade INT
SET @Quantidade = 12

DECLARE @Preco FLOAT
SET @Preco = 9.99

DECLARE @Faturamento FLOAT
SET @Faturamento = @Preco * @Quantidade

SELECT 
    @Produto AS Produto,
    @Quantidade AS Quantidade,
    @Preco AS Preco,
    @Preco * @Quantidade AS Faturamento;




--3)
DECLARE @Nome Varchar(MAX)
SET @Nome = 'André'

DECLARE @Data_de_Nascimento DATE
SET @Data_de_Nascimento = '10/02/1998' 


DECLARE @Num_Pets INT
SET @Num_Pets = 2

SELECT 'Meu nome é ' + @Nome + ' nasci em ' + FORMAT (CAST( @Data_de_Nascimento AS datetime), 'dd/MM/yyyy') + ' e tenho ' + CAST (@Num_Pets AS varchar(200)) + ' Pets' 


    
--4)
--USE CONTOSO

DECLARE @Loja VARCHAR(MAX)
SET @Loja = ''
    
SELECT @Loja = @Loja + StoreName+', ' + CHAR(10)
    
FROM DimStore 
    
WHERE CloseDate IS NOT NULL AND CloseDate BETWEEN '01/01/2008' AND '31/12/2008'
    
PRINT LEFT(@Loja,DATALENGTH(@Loja) -3)


    
--5)
--USE CONTOSO

DECLARE @PRODUTOS VARCHAR(MAX)
SET @PRODUTOS = ''
    
SELECT @PRODUTOS = @PRODUTOS + ProductName+', ' + CHAR(10) 
    
FROM DimProduct
    
INNER JOIN DimProductSubcategory 
ON DimProductSubcategory.ProductSubcategoryKey = DimProduct.ProductSubcategoryKey
    
WHERE ProductSubcategoryName ='Lamps'
    
PRINT LEFT(@PRODUTOS,DATALENGTH(@PRODUTOS) -3)
