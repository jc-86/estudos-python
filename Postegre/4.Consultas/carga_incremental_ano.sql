-- Criando coluna de ano
SELECT EXTRACT(YEAR FROM "Data_da_Ocorrencia") AS ano, *
FROM anac_sqlalchemy

-- Trazendo dados distintos
SELECT DISTINCT EXTRACT(YEAR FROM "Data_da_Ocorrencia") AS ano
FROM anac_sqlalchemy

-- Filtrando ano atual
SELECT DISTINCT EXTRACT(YEAR FROM "Data_da_Ocorrencia") AS ano, 
EXTRACT(YEAR FROM current_date) AS ano_atual, *
FROM anac_sqlalchemy
WHERE EXTRACT(YEAR FROM "Data_da_Ocorrencia") = 2024

SELECT DISTINCT EXTRACT(YEAR FROM "Data_da_Ocorrencia") AS ano, 
EXTRACT(YEAR FROM current_date) AS ano_atual, *
FROM anac_sqlalchemy
WHERE EXTRACT(YEAR FROM "Data_da_Ocorrencia") = EXTRACT(YEAR FROM current_date)

-- Delete ano atual
DELETE FROM anac_alchemy
WHERE EXTRACT(YEAR FROM "Data_da_Ocorrencia") = EXTRACT(YEAR FROM current_date)
