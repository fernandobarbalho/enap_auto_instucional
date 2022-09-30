library(tidyverse)

#O endereço indicado logo abaixo contém um arquivo com dados sobre municípios, incluindo informações sobre gastos com saúde
arquivo<- "https://raw.githubusercontent.com/fernandobarbalho/enap_auto_instucional/main/data/dados_saude_municipio.csv"

dados_saude_municipio<-
  read_csv(file = arquivo)


#Os gráficos de correlação são feitos a partir de gráficos de pontos
#Nos eixos x e y colocamos as variáves que queremos verificar visualmente se há correlação
#No caso do gráfico abaixo queremos testar se há correlação entre população e percentual gasto com saúde
dados_saude_municipio%>%
  ggplot()+
  geom_point(aes(x=populacao, y=perc))

#Como há pontos extremos muito elevados, é possível que a representação do eixo x em escala logarimica ajude a melhorar o gráfico

dados_saude_municipio%>%
  ggplot()+
  geom_point(aes(x=populacao, y=perc))+
  scale_x_log10()


#Para se calcular a correlação entre as duas variáveis usamos a função cor
#Na função indicamos as duas variáveis que queremos checar a correlação
#No gráfico fizemos a transformação logaritimca no eixo x que corresponde à variável população
#O mais indicado é testar a correlação transformando os dados de população usando logarítimo. Para isso usamos a função logcor(log10(dados_saude_municipio$populacao), dados_saude_municipio$perc)
cor(log10(dados_saude_municipio$populacao), dados_saude_municipio$perc)


#Podemos também testar a correlação entre população e o valor absoluto gasto em saúde

dados_saude_municipio%>%
  ggplot()+
  geom_point(aes(x=populacao, y=valor))

#O gráfico mostra a possibilidade de termos pontos muito extremos tanto no eixo x como no y
#Precisaremos usar escala logaritmica nos dois eixos

dados_saude_municipio%>%
  ggplot()+
  geom_point(aes(x=populacao, y=valor))+
  scale_x_log10() +
  scale_y_log10()

#O cálculo da correlação admite a transformação em logaritmo para as duas variáveis
cor(log10(dados_saude_municipio$populacao), log10(dados_saude_municipio$valor))


municipios_pequenos<-
dados_saude_municipio%>%
  filter(populacao<20000)

municipios_pequenos%>%
  ggplot()+
  geom_point(aes(x=populacao, y=perc))

cor(municipios_pequenos$populacao, municipios_pequenos$perc)

