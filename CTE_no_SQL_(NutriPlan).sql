---Rian Prates---
WITH ConsultaDetalhada AS (
SELECT 
Paciente.Nome AS Nome_Paciente,
Consulta.Tipo_Consulta,
Consulta.Data,
Nutricionista.Nome_Nutricionista
    
FROM 
Consulta
    
INNER JOIN Paciente 
ON Consulta.CPF_Paciente = Paciente.CPF_Paciente
    
INNER JOIN Nutricionista 
ON Consulta.CRN_Nutricionista = Nutricionista.CRN_Nutricionista
)

SELECT 
Nome_Paciente,
Tipo_Consulta,
Data,
Nome_Nutricionista
    
FROM 
ConsultaDetalhada
    
ORDER BY  Data;



---Lucas Beni---
WITH quantidade(Produtos, [Qtd. Vendida])
AS
(
SELECT TOP(100)
    ProductSubcategoryName,
	COUNT(FactSales.ProductKey)
    
FROM
	DimProductSubcategory
    
INNER JOIN DimProduct
ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
    
INNER JOIN FactSales
ON FactSales.ProductKey = DimProduct.ProductKey
    
WHERE DateKey LIKE '%2008%'
GROUP BY ProductSubcategoryName
ORDER BY COUNT(FactSales.ProductKey) DESC
)

SELECT * FROM quantidade


    
---Luiz Enrique---
WITH EntradaDia (Dia, [Valor Recebido]) AS
    (SELECT
        Data,
        SUM(Valor)
    FROM
        Consulta
    GROUP BY
        Data
    )
SELECT * FROM EntradaDia;
