-- Criando a tabela do projeto
CREATE TABLE IF NOT EXISTS Anac (
		Numero_da_Ocorrencia INT,
		Classificacao_da_Ocorrencia VARCHAR(50),
		Data_da_Ocorrencia DATE,
		Municipio VARCHAR(50),
		UF VARCHAR(30),
		Regiao VARCHAR(30),
		Nome_do_Fabricante VARCHAR(100)		
)

-- Criando uma tabela com colunas diferentes
CREATE TABLE IF NOT EXISTS anac_mapeamento (
	"ID" INT,
	"Classificacao_da_Ocorrencia" VARCHAR(50),
	"Dt_Ocorrencia" DATE,
	"Municipio" VARCHAR(50),
	"UF" VARCHAR(30),
	"Regiao" VARCHAR(30),
	"Fabricante" VARCHAR(100)	
)

-- Adicionando uma coluna
ALTER TABLE anac_mapeamento
ADD Modelo VARCHAR(50)

-- Exibindo informações da tabela
SELECT *
FROM information_schema.columns
WHERE table_name = 'anac_mapeamento'