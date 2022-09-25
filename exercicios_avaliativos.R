#exercícios avaliativos

nome_escola<- c("Elefante Branco", "Liceu", "Pedro II")

quantidade_alunos_inscritos<- c(200, 250, 300)
media_escola<- c(400.34 , 453.27, 425.32)

df_enem<- data.frame(nome_escola=nome_escola,
                     quantidade_alunos_inscritos=quantidade_alunos_inscritos,
                     media_escola=media_escola)

###########################################

library(questionr)
nome_hospital<- c("São Sebastião","João Paulo II","Trindade","São Clemente","Hospital Regional", "Hospital Geral")
rede_hospitalar<- c("municipal","municipal","federal","estadual","estadual","municipal")

hospitais<- data.frame(nome_hospital= nome_hospital, rede_hospitalar= rede_hospitalar)

questionr::freq(hospitais$rede_hospitalar, cum = TRUE, sort = "dec", total = TRUE)


######################################333

#O set.seed(1972) possibilita que os números gerados aleatoriamente logo a seguir sejam repetidos em próximas execuções
set.seed(1972)
#gera um conjunto com 50 números aleatórios entre 1 e 100
valores_aleatorios<- sample(1:100, size = 50)

mean(valores_aleatorios)
median(valores_aleatorios)



#O set.seed(13) possibilita que os números gerados aleatoriamente logo a seguir sejam repetidos em próximas execuções
set.seed(13)
#gera um conjunto com 50 números aleatórios entre 1 e 100
novos_valores_aleatorios<- sample(1:100, size = 50)

sd(novos_valores_aleatorios)
min(novos_valores_aleatorios)
max(novos_valores_aleatorios)


sd(sample(1:100, size = 50))
min(sample(1:100, size = 50))
max(sample(1:100, size = 50))


############

library(tidyverse)

#O objeto url abaixo indica onde está na internet a tabela com os dados sobre municípios brasileiros
url<- "https://raw.githubusercontent.com/fernandobarbalho/enap_auto_instucional/main/data/dados_municipios.csv"

#O comando read_csv permite ler para a sua máquina o conteúdo de uma tabela que está no endereço especificado no objeto url
#o conteúdo da tabela é passado para o dataframe dados_municipios
dados_municipios<- read_csv(url)

dados_municipios%>%
  filter(sigla_uf == "CE") %>%
  select(sigla_uf,nome, populacao) %>%
  arrange(desc(populacao))


#O objeto url abaixo indica onde está na internet a tabela com os dados sobre municípios brasileiros
url<- "https://raw.githubusercontent.com/fernandobarbalho/enap_auto_instucional/main/data/dados_municipios.csv"

#O comando read_csv permite ler para a sua máquina o conteúdo de uma tabela que está no endereço especificado no objeto url
#o conteúdo da tabela é passado para o dataframe dados_municipios
dados_municipios<- read_csv(url)


dados_municipios%>%
  filter(sigla_uf != "DF") %>%
  group_by(sigla_uf) %>%
  summarise(
    media_populacao_municipios = mean(populacao)
  ) %>%
  arrange(desc(media_populacao_municipios))


dados_municipios%>%
  filter(sigla_uf != "DF") %>%
  group_by(sigla_uf) %>%
  summarise(
    populacao = sum(populacao)
  ) %>%
  ungroup() %>%
  mutate(sigla_uf=reorder(sigla_uf,populacao)) %>%
  slice_max(order_by = populacao, n=10)%>%
  ggplot()+
    geom_col(aes(x=populacao, y=sigla_uf))

dados_municipios %>%
  slice_max(populacao, n=10) %>%
  ggplot()+
  geom_col(aes(x=populacao, y=nome))

dados_municipios %>%
  slice_max(populacao, n=10) %>%
  mutate(nome=reorder(nome, populacao)) %>%
  ggplot()+
  geom_col(aes(x=populacao, y=nome))


dados_municipios %>%
  slice_head( n=10) %>%
  mutate(nome=reorder(nome, populacao)) %>%
  ggplot()+
  geom_col(aes(x=populacao, y=nome))


dados_municipios %>%
  slice_sample( n=10) %>%
  mutate(nome=reorder(nome, populacao)) %>%
  ggplot()+
  geom_col(aes(x=populacao, y=nome))

library(dados)
dados_gapminder %>%
  filter(pais=="Brasil") %>%
  ggplot()+
  geom_point(aes(x=pib_per_capita, y=expectativa_de_vida))


library(dados)
dados_gapminder %>%
  filter(ano==2007) %>%
  slice_max(order_by = expectativa_de_vida, n=10) %>%
  mutate(pais = reorder(pais,expectativa_de_vida)) %>%
  ggplot()+
  geom_col(aes(x=expectativa_de_vida, y=pais))

library(dados)
dados_gapminder %>%
  filter(pais=="Brasil") %>%
  ggplot()+
  geom_line(aes(x=ano, y=pib_per_capita))


library(dados)
dados_gapminder %>%
  filter(pais=="Brasil") %>%
  ggplot()+
  geom_line(aes(x=ano, y=expectativa_de_vida))

library(dados)
dados_gapminder %>%
  filter(pais=="Argentina") %>%
  ggplot()+
  geom_point(aes(x=ano, y=expectativa_de_vida))

library(dados)
library(tidyverse)
dados_gapminder %>%
  mutate(ano = as.character(ano)) %>%
  ggplot() +
  geom_boxplot(aes(x=ano, y= expectativa_de_vida)) +
  scale_y_continuous(breaks=(seq(0,80,20))) +
  ylim(c(0,NA))



library(dados)
library(tidyverse)
dados_gapminder %>%
  filter(ano==2007) %>%
  ggplot() +
  geom_histogram(aes(x= pib_per_capita), color="white") +
  scale_y_continuous(breaks = c(seq(0,10,1)))+
  scale_x_log10()


