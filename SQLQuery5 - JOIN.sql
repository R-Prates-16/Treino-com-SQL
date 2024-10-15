--União da tabela de vendas (FactSales) com a tabela de produtos (DimProduct) para exibir o nome dos produtos e o valor da venda. A coluna que conecta as duas tabelas é a *ProductKey*

SELECT
FS.SalesAmount,
DP.ProductName

FROM
FactSales fs

INNER JOIN 
DimProduct DP

ON
FS.ProductKey = DP.ProductKey




--União da tabela de venda (FcatSales) com a tabela de lojas (DimStore) para exibir o nome da loja e o valor das vendas

SELECT 
DS.StoreName, 
FS.SalesAmount 

FROM 
FactSales FS

INNER JOIN 
DimStore DS 

ON 
FS.StoreKey = DS.StoreKey;



--Aqui o INNER JOIN mostra o nome do produto e a quantidade disponível em estoque, a união ocorre entre a coluna ProductKey
SELECT 
DP.ProductName, 
FI.OnHandQuantity 

FROM 
FactInventory FI

INNER JOIN 
DimProduct DP 

ON
FI.ProductKey = DP.ProductKey;

