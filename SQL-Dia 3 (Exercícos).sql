
--1) Foi devolvido o valor da quantidade de vendas e da quantidade de produtos voltados
SELECT
SUM (SalesQuantity)

FROM FactSales

SELECT
SUM (ReturnQuantity)

FROM FactSales

--2) 
SELECT
AVG (YearlyIncome) AS 'Renda Anual dos cliente'

FROM DimCustomer

WHERE Occupation = 'Professional'


--3)
--A) Loja com mais funcionários (325 Funcionários)
SELECT TOP (1)
StoreName,
EmployeeCount

FROM DimStore

WHERE
EmployeeCount IS NOT NULL

ORDER BY EmployeeCount DESC

----B) Loja com menos funcionários (7 Funcionários)
SELECT TOP (1)
StoreName, 
EmployeeCount

FROM DimStore

WHERE
EmployeeCount IS NOT NULL

ORDER BY EmployeeCount 

--4) Acehi os funcionários mais antigos, fiz a diferença de sexo entre nome e mulher (achando a quantidade de homem e de mulher
SELECT

COUNT (Gender) AS 'Quantidade de Hoemns'

FROM DimEmployee

WHERE EndDate IS NULL


SELECT TOP (1)
FirstName,
EmailAddress,
HireDate,
EndDate

FROM DimEmployee

WHERE Gender = 'M'





SELECT
COUNT (Gender) AS 'Quantidade de Mulheres'

FROM DimEmployee

WHERE EndDate IS NULL


SELECT TOP (1)
FirstName,
EmailAddress,
HireDate,
EndDate


FROM DimEmployee

WHERE Gender = 'F'

--5) Analisei a quantdade dinstinta de marcas de produtos, das cores e das quantidade de classe de produtos
SELECT
COUNT(DISTINCT ColorName) AS 'Cor do Produto'
FROM DimProduct

SELECT
COUNT(DISTINCT BrandName) AS 'Marca do Produto'
FROM DimProduct 

SELECT
COUNT(DISTINCT ClassName) AS 'Classe do Produto'
FROM DimProduct

