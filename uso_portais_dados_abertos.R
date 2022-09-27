library(tidyverse)

##Dados abertos de dados.gov.br

#url do dado
url_habitacao<- "http://sishab.mdr.gov.br/dados_abertos/_contratacoes_pcmv_pcva.csv"



#download do dado a partir do endereço da url
download.file(url = url_habitacao, destfile = "contratacoes_pcmv_pcva.csv", mode="wb")

library(readr)
#gera um dataframe a partir do arquivo csv baixado
contratacoes_pcmv_pcva <- read_delim("contratacoes_pcmv_pcva.csv",
                                     delim = ";", escape_double = FALSE, locale = locale(encoding = "LATIN1"),
                                     trim_ws = TRUE) #sugestão: procure ler sobre encoding


contratacoes_pcmv_pcva%>%
  group_by(txt_uf) %>%
  summarise(
    contratadas= sum(qtd_uh_contratadas), #soma das quantidades de unidades habitacionais contratadas
    entregues = sum(qtd_uh_entregues), #soma das quantidades de unidades habitacionais entregues
    perc_entregues = (entregues/contratadas)*100 #de unidades habitacionais entregues
  ) %>%
  arrange(desc(perc_entregues))







contratacoes_pcmv_pcva%>%
  group_by(txt_uf) %>%
  summarise(
    contratadas= sum(qtd_uh_contratadas),
    entregues = sum(qtd_uh_entregues),
    perc_entregues = (entregues/contratadas)*100
  ) %>%
  mutate(txt_uf=reorder(txt_uf,perc_entregues)) %>%
  ggplot()+
  geom_col(aes(x=perc_entregues,y=txt_uf))



#Dados abertos do tesouro transparente
install.packages("janitor")

library(tidyverse)
library(janitor)


#url do dado
url_estoque_dpf<- "https://www.tesourotransparente.gov.br/ckan/dataset/0998f610-bc25-4ce3-b32c-a873447500c2/resource/b6280ed3-ef7e-4569-954a-bded97c2c8a1/download/EstoqueDPF.csv"


#lê o arquivo diretamente da url
estoque_dpf<- read_csv2(url_estoque_dpf)


#Deixa o nome das variáveis mais legíveis
estoque_dpf<- janitor::clean_names(estoque_dpf)

#agrupamento de dados por tipo de dívida
estoque_dpf %>%
  filter(mes_do_estoque=="12/2021") %>%
  group_by(tipo_de_divida) %>%
  summarise(
    total_divida = sum(valor_do_estoque)
  )

#gráfico a partir do agrupamento por tipo de dívida
estoque_dpf %>%
  filter(mes_do_estoque=="12/2021") %>% #filtra para permanecer apenas o estoque para 12²021
  group_by(tipo_de_divida) %>% #agrupa por tipo de dívida (interna/externa)
  summarise(
    total_divida = sum(valor_do_estoque) #calcula o total da por tipo
  ) %>%
  ggplot()+
  geom_col(aes(x=tipo_de_divida,y=total_divida))



###Portal da transparência

#Explorar os problemas com dados abertos brutos

#url do dado
url_defeso<- "https://transparencia.gov.br/download-de-dados/seguro-defeso/202201"

download.file(url = url_defeso, destfile = "defeso.csv", mode="wb")

defeso <- read_delim("defeso.csv", delim = ";",
                     escape_double = FALSE, col_types = cols(X9 = col_number()),
                     locale = locale(decimal_mark = ",", grouping_mark = ".",
                                     encoding = "LATIN1"), trim_ws = TRUE)

defeso <- janitor::clean_names(defeso)

#gráfico de ranking dos estados por quantidade de beneficiários
defeso %>%
  filter(!is.na(uf)) %>%
  group_by(uf) %>%
  summarise(
    quantidade = n()
  ) %>%
  mutate(uf= reorder(uf,quantidade)) %>%
  ggplot() +
  geom_col(aes(x=quantidade, y=uf))
