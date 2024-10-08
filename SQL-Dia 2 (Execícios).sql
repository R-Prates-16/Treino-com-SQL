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

--WHERE 
Weight > 100
  
--ORDER BY Weight DESC

--4) Achei as lojas que ja foram fechadas, deixando apenas as abertas disponíveis, e mudei o nome das colunas
--SELECT
--StoreName AS 'Nome da loja',
--OpenDate AS 'Lojas Abertas',
--EmployeeCount AS 'Contagem de funcionários'

--FROM DimStore

--WHERE 
CloseDate IS NULL;

--5) Filtrei um produto específico que estava com problemas, achando as unidades que foram vendidas com defeitos
--SELECT
--ProductKey,
--ProductName, 
--BrandName,
--AvailableForSaleDate

--FROM DimProduct 

--WHERE 
BrandName = 'Litware' AND AvailableForSaleDate = '15/03/2009'


--6) Selecionei todas as lojas que estão com status igual a "on", e filtrei a coluna "CloseDate", e todas que estiver com valor nulo, significa que a loja ainda esta aberta
--SELECT 
--Status, 
--CloseDate

--FROM DimStore

--WHERE
--Status = 'on'

--7) Na categoria 1, terá 75 lojas que receberam apenas uma máquina de café; Na categoria 2, terá 187 lojas que receberam 2 máquinas de café; Nacategoria 3, terá 43 lojas, que receberam 3 máquinas de café
--SELECT 
--EmployeeCount

--FROM DimStore

--WHERE
--EmployeeCount BETWEEN 1 AND 20


--SELECT 
--EmployeeCount

--FROM DimStore

--WHERE
--EmployeeCount BETWEEN 21 AND 50


--SELECT 
--EmployeeCount

--FROM DimStore

--WHERE
--EmployeeCount > 50

--8) Selecionei todos os produtos "LCD", juntamente com ID do produto e Preço 
--SELECT 
--ProductKey,
--ProductName,
--UnitPrice

--FROM DimProduct

--WHERE 
ProductName LIKE '%LCD%'

--9) Selecionei todos os produtos da marca 'contoso', 'Litware' e 'Fabrikam', nas cores especificadas de acordo com o exercício
--SELECT
--ProductKey,
--ProductName, 
--ColorName, 
--BrandName

--FROM DimProduct

--WHERE 
BrandName IN ('Contoso', 'Litware', 'Fabrikam') AND ColorName IN ('Green', 'Orange', 'Black', 'Silver', 'Pink')

--10) Achei 15 produtos da cor prata da marca 'Contoso', mostrando o preço do maior para o menor
--SELECT
--BrandName,
--ColorName, 
--UnitPrice

--FROM DimProduct

--WHERE 
BrandName= 'Contoso' AND ColorName= 'Silver' AND UnitPrice BETWEEN 10 AND 30

--ORDER BY UnitPrice DESC
