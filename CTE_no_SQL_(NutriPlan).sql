WITH ConsultaDetalhada AS (
    SELECT 
        Paciente.Nome AS Nome_Paciente,
        Consulta.Tipo_Consulta,
        Consulta.Data,
        Nutricionista.Nome_Nutricionista
    FROM 
        Consulta
    INNER JOIN Paciente ON Consulta.CPF_Paciente = Paciente.CPF_Paciente
    INNER JOIN Nutricionista ON Consulta.CRN_Nutricionista = Nutricionista.CRN_Nutricionista
)

SELECT 
    Nome_Paciente,
    Tipo_Consulta,
    Data,
    Nome_Nutricionista
FROM 
    ConsultaDetalhada
ORDER BY 
    Data;