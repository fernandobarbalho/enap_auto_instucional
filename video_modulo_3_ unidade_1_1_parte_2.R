#Carrega o pacote tidyverse para a memória
library(tidyverse)

arquivo<- "https://raw.githubusercontent.com/fernandobarbalho/enap_auto_instucional/main/data/dados_municipios.csv"

dados_municipios<- read_csv(file= arquivo)

dados_municipios

#A função filter permite fazer filtros sobre um dataframe.
#Deve-se informar pelo menos os seguintes parâmetros:
#.data: data frame com os dados
#expressão lógica: expressão que indica o filtro que será feito

#Na linha abaixo, vamos filtrar o data frame dados_municipios permanecendo apenas os municípios do estado de Pernambuco
#Nesse caso, a expressão lógica é sigla_uf=="PE"

filter(.data= dados_municipios, sigla_uf=="PE" )

#Se quisermos os municipios do CEará

filter(.data= dados_municipios, sigla_uf=="CE" )

#O pacote tidyverse permite o uso do operador %>%, conhecido como pipe (cano, em inglês), que facilita a construção de uma sequência de operações
#O operador %>% leva o conteúdo de um dataframe para o primeiro parâmetro de uma função que vem logo após o %>%
#Isso elimina a necessidade de informar o valor do primeiro parâmetro da função

#NO exemplo abaixo, o %>% leva o conteúdo de dados_municipios para o primeiro argumento da função filter, que é .data

dados_municipios %>%
  filter(sigla_uf=="CE")

#Isso permite fazer uma sequência de comandos sobre um dado original.
#No exemplo abaixo, aplicamos um novo filtro ao filto original
#Agora além de filtrar por estado, vamos filtrar também por população, permanecendo apenas os municípios com mais
#de 100000 habitantes

dados_municipios %>%
  filter(sigla_uf=="CE") %>%
  filter(populacao > 100000)

#Já vimos que a tabela contém 26 colunas para saber o nome das colunas usamos a função name
#Passamos como parâmetro para a função name o nome do dataframe

names(dados_municipios)

#Vamos imaginar que agora queremos trabalhar apenas com as colunas sigla_uf, nome e populacao.
#Para isso acrescentamos à sequência do comandos concatenadas por %>% a função select. Veja abaixo

dados_municipios%>%
  filter(sigla_uf == "CE")  %>%
  filter(populacao > 100000) %>%
  select(sigla_uf,nome, populacao) #indica as colunas que devem aparecer no resultado da sequência de comandos

#Talvez seja interessante ordenar esses municípios. Para isso acrescentamos à sequência de comandos a função arrange
#Na função arrange devemos indicar qual a coluna que será feita a ordenação

dados_municipios%>%
  filter(sigla_uf == "CE")  %>%
  filter(populacao > 100000) %>%
  select(sigla_uf,nome, populacao) %>% #indica as colunas que devem aparecer no resultado da sequência de comandos
  arrange(populacao)

#Para que a a ordenação seja feita em ordem decrescente use a função desc. Veja abaixo

dados_municipios%>%
  filter(sigla_uf == "CE")  %>%
  filter(populacao > 100000) %>%
  select(sigla_uf,nome, populacao) %>% #indica as colunas que devem aparecer no resultado da sequência de comandos
  arrange(desc(populacao)) #ordenação em ordem decrescente de população
