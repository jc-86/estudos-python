-- Criando a tabela do projeto
CREATE TABLE IF NOT EXISTS anac_sqlalchemy (
		Numero_da_Ocorrencia INT,
		Classificacao_da_Ocorrencia VARCHAR(50),
		Data_da_Ocorrencia DATE,
		Municipio VARCHAR(50),
		UF VARCHAR(30),
		Regiao VARCHAR(30),
		Nome_do_Fabricante VARCHAR(100)		
)

SELECT EXTRACT (YEAR FROM 'Data_da_Ocorrencia') AS ano, *
FROM anac_sqlalchemy

