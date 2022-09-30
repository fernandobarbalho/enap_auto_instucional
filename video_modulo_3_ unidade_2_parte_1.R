library(tidyverse)

arquivo<- "https://raw.githubusercontent.com/fernandobarbalho/enap_auto_instucional/main/data/dados_municipios.csv"

dados_municipios<- read_csv(file= arquivo)

#ggplot é uma biblioteca do pacote tidyverse que permite trabalhar com gráficos
#Para se trabalhar com gráfico usando ggplot2 usa-se uma combinação de funções
#uma obrigatória é a ggplot. É ela quem indica ao R que o que vem em seguir é um conjunto de isntruções sobre gráficos
#é obrigatório indicar qual a geometria que vai ser usada
#para se trabalhar com colunas ou barras, usa-se  a função geom_col
#a função geom_col exige que se informa algumas informações estéticas a partir da função aes
#dois elementos fundamentais de estética são as variáveis que ficarão nos eixos x e y
#A tabela de referência para uso do ggplot pode ser informado a partir de uma sequência de comandos concatenados por %>%
#As instruções de gráficos são separadas pelo operador +

#Na sequência de instruções abaixo geramos um gráfico de colunas com as populações dos municípios pernambucanos com mais de 100 mil habitantes
# no eixo x (horizontal) aparecem as populações e no eixo y (vertical) o nome das cidades
dados_municipios %>%
  filter(sigla_uf == "PE") %>%
  filter(populacao>100000) %>%
  ggplot()+
  geom_col(aes(x=populacao, y=nome))


#A função slice_max retorna as n linhas que possuem os maiores valores para uma dada variável
#Veja como podemos usar a função slice_max para mostrar os 10 municípios mais populosos do Brasil

dados_municipios %>%
  slice_max(populacao, n=10) %>%
  ggplot()+
  geom_col(aes(x=populacao, y=nome))

#Observe que o gráfico mostra as cidades em uma ordem aleatória. É conveniente deixarmos o gráfico em forma de ranking
#Usando a função mutate reordenamos a variável nome para que ela passe a aparecer no gráfico a partir da variável população

dados_municipios %>%
  slice_max(populacao, n=10) %>%
  mutate(nome=reorder(nome, populacao)) %>% #reordena a variável nome a partir do valor da variável população
  ggplot()+
  geom_col(aes(x=populacao, y=nome))


#podemos preencher as barras com cores que mudam de acordo com o valor de uma variável
#fazemos isso associando o parâmetro fill da função aes.
#indicamos para esse parâmetro qual a variável que servirá de referência para as cores.
#No caso abaixo as 10 cidades mais populosas terão as cores de suas barras preenchidas de acordo com a variável nome_região


dados_municipios %>%
  slice_max(populacao, n=10) %>%
  mutate(nome=reorder(nome, populacao)) %>%
  ggplot()+
  geom_col(aes(x=populacao, y=nome, fill=nome_regiao))



