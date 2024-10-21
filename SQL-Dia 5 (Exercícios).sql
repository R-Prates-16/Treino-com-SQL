--01)
SELECT
ProductSubcategoryName AS 'Nome da Subcategoria',
DimProductSubcategory.ProductSubcategoryKey AS 'ID da categoria'

FROM DimProductSubcategory

INNER JOIN DimProduct 
ON DimProductSubcategory.ProductSubcategoryKey = DimProduct.ProductSubcategoryKey



--2)
SELECT
ProductCategoryName AS 'Nome da categoria',
DimProductCategory.ProductCategoryKey AS 'ID da categoria'

FROM 
DimProductCategory

LEFT JOIN DimProductSubcategory
ON DimProductCategory.ProductCategoryKey = DimProductSubcategory.ProductCategoryKey



--3)
SELECT
StoreKey,
StoreName,
EmployeeCount,
DimGeography.ContinentName,
DimGeography.RegionCountryName

FROM 
DimStore

LEFT JOIN DimGeography
ON Dimstore.GeographyKey = DimGeography.GeographyKey



--4)
SELECT
ProductKey,
ProductName,
DimProductCategory.ProductCategoryDescription,
DimProductSubcategory.ProductCategoryKey,
DimProduct.ProductSubcategoryKey

FROM DimProduct

LEFT JOIN DimProductSubcategory
ON DimProductSubcategory.ProductSubcategoryKey = DimProduct.ProductSubcategoryKey

LEFT JOIN DimProductCategory
ON DimProductCategory.ProductCategoryKey = DimProductSubcategory.ProductCategoryKey



--Questão 05
--A)
SELECT TOP(100)*
FROM FactStrategyPlan

--B)
SELECT
StrategyPlanKey,
DateKey,
DimAccount.AccountName,
Amount

FROM FactStrategyPlan

INNER JOIN DimAccount
ON FactStrategyPlan.AccountKey = DimAccount.AccountKey



--6)
SELECT
StrategyPlanKey,
DateKey,
DimScenario.ScenarioName,
Amount

FROM FactStrategyPlan

INNER JOIN DimScenario
ON FactStrategyPlan.ScenarioKey = DimScenario.ScenarioKey



--7)
SELECT
ProductSubcategoryName,
DimProduct.ProductSubcategoryKey

FROM DimProductSubcategory

LEFT JOIN DimProduct
ON DimProductSubcategory.ProductSubcategoryKey = DimProduct.ProductSubcategoryKey

WHERE DimProduct.ProductSubcategoryKey IS NULL;



--8)
SELECT DISTINCT
BrandName,
DimChannel.ChannelName

FROM DimProduct

CROSS JOIN DimChannel
WHERE BrandName IN('Contoso', 'Litware', 'Fabrikam')


--9) 
SELECT
OnlineSalesKey,
DateKey,
PromotionName,
SalesAmount

FROM FactOnlineSales

INNER JOIN DimPromotion
ON FactOnlineSales.PromotionKey = DimPromotion.PromotionKey

WHERE PromotionName <> 'No Discount'

ORDER BY DateKey ASC



--10)
SELECT
SalesKey,
DimChannel. ChannelName,
DimStore. StoreName,
DimProduct. ProductName, 
SalesAmount

FROM FactSales

INNER JOIN DimChannel
ON FactSales.channelKey = DimChannel.ChannelKey

INNER JOIN DimStore
ON FactSales.StoreKey = DimStore.StoreKey

INNER JOIN DimProduct
ON FactSales.ProductKey = DimProduct.ProductKey

ORDER BY SalesAmount DESC