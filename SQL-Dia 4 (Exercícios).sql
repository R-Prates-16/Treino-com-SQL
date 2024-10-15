--1)
--A)
SELECT
channelKey,
SUM(SalesQuantity) AS 'Quantidade Total de Vendida' 

FROM FactSales
GROUP BY channelKey

--B)
SELECT
SUM(SalesQuantity) AS 'Quantidade Total de Vendas',
SUM(ReturnQuantity) AS 'Quantidade Total Devolvida',
StoreKey

FROM FactSales
GROUP BY StoreKey

--C)
SELECT
SUM(SalesAmount) AS 'Quantidade de vendas',
channelKey

FROM FactSales

WHERE DateKey = '2007'

GROUP BY channelKey 

--2)
--A)
SELECT
SUM(SalesAmount) AS 'Total Vendido',
ProductKey

FROM FactSales

GROUP BY ProductKey

HAVING SUM (SalesAmount) >= 5000000
ORDER BY COUNT (SalesAmount)

--B)
SELECT TOP (10)
SUM(SalesAmount) AS 'Total Vendido',
ProductKey AS 'ID do produto'

FROM FactSales

GROUP BY ProductKey

ORDER BY COUNT (SalesAmount)


--3)
--A)
SELECT TOP (1)
CustomerKey,
SUM(SalesQuantity) AS 'Compras Online'

FROM FactOnlineSales

GROUP BY CustomerKey

ORDER BY  COUNT (SalesQuantity) DESC


--B) 
SELECT TOP(3)
ProductKey,
SUM(SalesQuantity) AS 'Total Vendido'

FROM FactOnlineSales

WHERE CustomerKey = '19037'

GROUP BY ProductKey

ORDER BY COUNT (SalesQuantity) DESC

--4)
--A)
SELECT
BrandName,
COUNT(ProductKey) AS 'Produto'

FROM DimProduct

GROUP BY BrandName

--B)
SELECT 
ClassName,
AVG (UnitPrice) AS 'Média de Preços'

FROM DimProduct
GROUP BY ClassName

--C)
SELECT
ColorName,
SUM (Weight)

FROM DimProduct
GROUP BY ColorName
ORDER BY SUM(Weight)



--5)
SELECT
StockTypeName AS 'Tipo de Produto',
SUM (Weight) AS 'Peso Total' 

FROM DimProduct

WHERE BrandName = 'Contoso'

GROUP BY StockTypeName

ORDER BY [Peso Total] DESC

--6)
SELECT
BrandName,
COUNT(DISTINCT ColorID) AS 'Cores disponíveis'

FROM DimProduct

GROUP BY BrandName

--7)
SELECT
Gender,
COUNT (CustomerKey),
AVG (YearlyIncome) AS 'Média Salarial Anual'

FROM DimCustomer

WHERE Gender IS NOT NULL

GROUP BY Gender

--8)
SELECT
Education,
COUNT (CustomerKey),
AVG (YearlyIncome) AS 'Média Salarial Anual'

FROM DimCustomer

WHERE Education IS NOT NULL

GROUP BY  Education

--9)
SELECT
COUNT(EmployeeKey) AS 'ID do Funcionário',
DepartmentName

FROM DimEmployee

WHERE EndDate IS NULL
GROUP BY DepartmentName

--10)
 SELECT
 Title,
 SUM(VacationHours) AS 'Hora de Férias'

 FROM DimEmployee

 WHERE
 Gender = 'F' AND
 DepartmentName IN ('Production','Marketing','Engineering','Finance') AND
 HireDate BETWEEN '01/01/1999' AND '31/12/2000'

 GROUP BY Title 
