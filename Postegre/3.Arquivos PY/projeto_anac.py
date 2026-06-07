
import pandas as pd
import json
import psycopg2

caminho_arquivo = r"C:\Users\João\Desktop\postgre\origem_dados\V_OCORRENCIA_AMPLA.json"
df = pd.read_json(caminho_arquivo, encoding='utf-8-sig')

colunas = ["Numero_da_Ocorrencia", "Classificacao_da_Ocorrência", "Data_da_Ocorrencia","Municipio","UF","Regiao","Nome_do_Fabricante"]
df = df[colunas]
df.rename(columns={'Classificacao_da_Ocorrência' : 'Classificacao_da_Ocorrencia'} ,inplace=True)

# Parâmetros de conexão
dbname   = 'python'
user     = 'postgres'
password = '56789'
host     = 'localhost'
port     = '5432' 

# Criando uma conexão
conexao = psycopg2.connect(dbname=dbname, user=user, password=password, host=host, port=port)

# Deletando o histórico
cursor = conexao.cursor()
cursor.execute("DELETE FROM Anac")
cursor.close()

cur = conexao.cursor()

# Carregando dados
for indice,coluna_df in df.iterrows():
    cur.execute( """   INSERT INTO Anac (     
                Numero_da_Ocorrencia, 
                Classificacao_da_Ocorrencia, 
                Data_da_Ocorrencia, 
                Municipio, 
                UF, 
                Regiao, 
                Nome_do_Fabricante
            ) VALUES (%s,%s,%s,%s,%s,%s,%s) 
                
            """ ,(
                coluna_df["Numero_da_Ocorrencia"],
                coluna_df["Classificacao_da_Ocorrencia"],
                coluna_df["Data_da_Ocorrencia"],
                coluna_df["Municipio"],
                coluna_df["UF"],
                coluna_df["Regiao"],
                coluna_df["Nome_do_Fabricante"]                                            
            )                   
            )

conexao.commit() 
cur.close()
conexao.close()


