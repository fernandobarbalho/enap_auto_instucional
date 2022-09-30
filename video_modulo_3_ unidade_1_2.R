#Carrega o pacote tidyverse para a memória
library(tidyverse)

arquivo<- "https://raw.githubusercontent.com/fernandobarbalho/enap_auto_instucional/main/data/dados_municipios.csv"

dados_municipios<- read_csv(file= arquivo)

#Para fazer agrupamentos utilizando o tidyverse utilizamos duas funções: group_by e summarise
#Na função group_by informa-se as variáveis que queremos agrupar
#Na função summarise informa-se operações que se deseja fazer com as variáveis agrupadsa

#No exemplo abaixo, para cada sigla_uf, somamos a população de todos os municípios

dados_municipios %>%
  group_by(sigla_uf) %>% #Agrupa pela variável sigla_uf
  summarise(
    populacao_estado = sum(populacao) #soma a populacao de todos os municípios
  )

#Agora o resultado da sequência de comandos anterior em ordem decrescente de  população do estado

dados_municipios %>%
  group_by(sigla_uf) %>% #Agrupa pela variável sigla_uf
  summarise(
    populacao_estado = sum(populacao) #soma a populacao de todos os municípios
  ) %>%
  arrange(desc(populacao_estado)) #faz a ordenação descrescente por populacao_estado

#Podemos também contar o número de municípios em cada estado usando a função n

dados_municipios %>%
  group_by(sigla_uf) %>% #Agrupa pela variável sigla_uf
  summarise(
    quantidade_municipios = n() #soma a populacao de todos os municípios
  ) %>%
  arrange(desc(quantidade_municipios)) #faz a ordenação descrescente por populacao_estado

#E combinar num mesmo resultado as informações de população do estado, quantidade de municípios, média de habitantes por município e mediana de habitantes

dados_municipios %>%
  group_by(sigla_uf) %>% #Agrupa pela variável sigla_uf
  summarise(
    quantidade_municipios = n(),
    populacao_estado = sum(populacao),
    media_populacao = mean(populacao),
    mediana_populacao = median(populacao)
  ) %>%
  arrange(desc(quantidade_municipios)) #faz a ordenação descrescente por populacao_estado

#Podemos alterar a estrutura de uma tabela usando a função mutate
#No caso abaixo vamos criar uma nova coluna a partir da combinação das variáveis nome, siga_uf e nome_regiao_saude
#vamos usar a função paste para fazer a concatenação de variáveis tipo texto. Vamos separar as variáveis com "-"

dados_municipios %>%
  mutate(nome_regiao_saude_uf = paste(nome, nome_regiao_saude, sigla_uf, sep = "-")) %>%
  select(nome_regiao_saude_uf, populacao)
