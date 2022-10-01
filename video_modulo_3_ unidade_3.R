library(tidyverse)

arquivo<- "https://raw.githubusercontent.com/fernandobarbalho/enap_auto_instucional/main/data/dados_municipios.csv"

dados_municipios<- read_csv(file= arquivo)

dados_municipios

#para fazer gráficos box-plot usamos a geom_boxplot
dados_municipios%>%
  filter(nome_regiao=="Nordeste") %>%
  ggplot()+
  geom_boxplot(aes(x=sigla_uf, y=populacao))


#é necessário usar a a escala logaritmica no eixo y para tornar viável a visualização
#usa-se a função scale_y_log10 pra representação em escala logaritimca

dados_municipios%>%
  filter(nome_regiao=="Nordeste") %>%
  ggplot()+
  geom_boxplot(aes(x=sigla_uf, y=populacao)) +
  scale_y_log10()


#para fazer gráficos de histograma usamos a função geom_histogram
#no caso do histograma precisamos indcar apenas o eixo x.
#O R se encarrega de fazer a contagem necessária para gerar os valores do eixo y

dados_municipios%>%
  ggplot()+
  geom_histogram(aes(x=populacao))


#Aqui também se faz necessário transformações logaritmicas, porém sobre o eixo x
#Nesse caso usamos a função scale_x_log10

dados_municipios%>%
  ggplot()+
  geom_histogram(aes(x=populacao), color = "white") +
  scale_x_log10()



