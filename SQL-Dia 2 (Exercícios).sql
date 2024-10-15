--1)
--Selecionei os produtos mais vendidos juntamente com a sua quantidade 
SELECT TOP (100) SalesQuantity, SalesAmount

FROM FactSales

ORDER BY SalesAmount DESC



--2)
--Filtrei os 10 produtos com maior valor, e fiz uma diferenciac�o com ele, mostrando a diferen�a entre cor e peso
SELECT TOP (10)
UnitPrice,
Weight,
ColorName

FROM DimProduct

ORDER BY UnitPrice DESC, Weight DESC, ColorName ASC --ou use AvailableForSaleDate como crit�rio de desempate--



--3) Achei os Produtos de categoria A (Acima de 100kg), mudei os nomes das colunas e dexei em ordem decrescente (mais pesado, para o mais leve)
SELECT
ProductName AS 'Nome do Produto',
Weight AS 'PESO (Libras)'

FROM DimProduct

WHERE 
Weight > 100
  
ORDER BY Weight DESC

--4) Achei as lojas que ja foram fechadas, deixando apenas as abertas dispon�veis, e mudei o nome das colunas
SELECT
StoreName AS 'Nome da loja',
OpenDate AS 'Lojas Abertas',
EmployeeCount AS 'Contagem de funcion�rios'

FROM DimStore

WHERE 
WHERE StoreType = 'Store' AND Status = 'On'

--5) Filtrei um produto espec�fico que estava com problemas, achando as unidades que foram vendidas com defeitos
SELECT
ProductKey,
ProductName, 
BrandName,
AvailableForSaleDate

FROM DimProduct 

WHERE 
BrandName = 'Litware' AND AvailableForSaleDate = '15/03/2009'


--6) Selecionei todas as lojas que est�o com status igual a "on", e filtrei a coluna "CloseDate", e todas que estiver com valor nulo, significa que a loja ainda esta aberta
SELECT 
Status, 
CloseDate

FROM DimStore

  -- Poderia ser: "WHERE Status = 'off'"
WHERE
  CloseDate IS NOT NULL

--7) Na categoria 1, ter� 75 lojas que receberam apenas uma m�quina de caf�; Na categoria 2, ter� 187 lojas que receberam 2 m�quinas de caf�; Nacategoria 3, ter� 43 lojas, que receberam 3 m�quinas de caf�
SELECT 
EmployeeCount

FROM DimStore

WHERE
EmployeeCount BETWEEN 1 AND 20


SELECT 
EmployeeCount

FROM DimStore

WHERE
EmployeeCount BETWEEN 21 AND 50


SELECT 
EmployeeCount

FROM DimStore

WHERE
EmployeeCount > 50

--8) Selecionei todos os produtos "LCD", juntamente com ID do produto e Pre�o 
SELECT 
ProductKey,
ProductName,
UnitPrice

FROM DimProduct

WHERE 
ProductDescription LIKE '%LCD%'

--9) Selecionei todos os produtos da marca 'contoso', 'Litware' e 'Fabrikam', nas cores especificadas de acordo com o exerc�cio
SELECT
ProductKey,
ProductName, 
ColorName, 
BrandName

FROM DimProduct

WHERE 
BrandName IN ('Contoso', 'Litware', 'Fabrikam') AND ColorName IN ('Green', 'Orange', 'Black', 'Silver', 'Pink')

--10) Achei 15 produtos da cor prata da marca 'Contoso', mostrando o pre�o do maior para o menor
SELECT
BrandName,
ColorName, 
UnitPrice

FROM DimProduct

WHERE 
BrandName= 'Contoso' AND ColorName= 'Silver' AND UnitPrice BETWEEN 10 AND 30

ORDER BY UnitPrice DESC