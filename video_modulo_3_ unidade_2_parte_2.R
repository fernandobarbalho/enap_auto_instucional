#Instale o pacote dados
install.packages("dados")

library(dados)
library(tidyverse)


#vamos agora fazer algumas experiências com gráficos de pontos
#usamos para isso a função geom_point
#No gráfico abaixo identficiamos a relação entre pib_per_capita no eixo x e expectativa de vida no eixo y
#fazemos o filtro para os países das Américas no ano de 2007

dados_gapminder %>%
  filter(continente=="Américas") %>%
  filter(ano==2007) %>%
  ggplot()+
  geom_point(aes(x=pib_per_capita, y=expectativa_de_vida))


#Podemos incluir mais um continente no filtro para isso vamos usar o operador %in% que checa se um determinado valor está presente num conjunto

conjunto_continentes <- c("Américas", "África") #Cria um objeto com o conjunto de continentes a ser usado no filtro

dados_gapminder %>%
  filter(continente %in% conjunto_continentes) %>%
  filter(ano==2007) %>%
  ggplot()+
  geom_point(aes(x=pib_per_capita, y=expectativa_de_vida))


#O gráfico não permite identificar quais pontos são de países da África e quais são das Américas.
#Vamos colorir os pontos de acordo com o continente usando o parâmetro color dentro da função aes

dados_gapminder %>%
  filter(continente %in% conjunto_continentes) %>%
  filter(ano==2007) %>%
  ggplot()+
  geom_point(aes(x=pib_per_capita, y=expectativa_de_vida, color= continente))

#Os dados do dataframe dados_gapminder referem-se a uma série de indicadores coletados ao longo de vários anos
#Para saber como um determinado indicador evoluiu uma opção interessante é usar o gráfico de linha
#Faremos uso da função geom_line

#O gráfico abaixo mostra a evolução da expectativa de vida no Brasil desde o início da série histórica
dados_gapminder %>%
  filter(pais == "Brasil") %>%
  ggplot()+
  geom_line(aes(x=ano, y=expectativa_de_vida ))

#Talvez o uso de pontos ajude a identificar os anos em que ocorreram as coletas de dados.
#Nesse caso vamos trabalhar com a combinação de duas geometrias: geom_line e geom_point. Veja abaixo

dados_gapminder %>%
  filter(pais == "Brasil") %>%
  ggplot()+
  geom_line(aes(x=ano, y=expectativa_de_vida )) +
  geom_point(aes(x=ano, y=expectativa_de_vida ))


