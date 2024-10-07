--1)
--Selecionei os produtos mais vendidos juntamente com a sua quantidade 
--SELECT TOP (100) SalesQuantity, SalesAmount

--FROM FactSales

--ORDER BY SalesAmount DESC



--2)
--Filtrei os 10 produtos com maior valor, e fiz uma diferenciacão com ele, mostrando a diferença entre cor e peso
--SELECT TOP (10)
--UnitPrice,
--Weight,
--ColorName

--FROM DimProduct

--ORDER BY UnitPrice DESC, Weight DESC, ColorName ASC



--3) Achei os Produtos de categoria A (Acima de 100kg), mudei os nomes das colunas e dexei em ordem decrescente (mais pesado, para o mais leve)
--SELECT
--ProductName AS 'Nome do Produto',
--Weight AS 'PESO'

--FROM DimProduct

--WHERE Weight > 100
--ORDER BY Weight DESC

--4) Acheias lojas que ja foram fechadas, deixando apenas as abertas disponíveis, e mudei o nome das colunas
--SELECT
--StoreName AS 'Nome da loja',
--OpenDate AS 'Lojas Abertas',
--EmployeeCount AS 'Contagem de funcionários'

--FROM DimStore

--WHERE CloseDate IS NULL;

--5)
SELECT
ProductKey,
ProductName, 
BrandName,
AvailableForSaleDate

FROM DimProduct 

WHERE ProductName LIKE '%Home Theater%' AND BrandName LIKE '%Litware%' AND 