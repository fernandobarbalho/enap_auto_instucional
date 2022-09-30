library(tidyverse)

#Endereço onde está o arquivo com dadois de censo escolar
url_dados_2021<- "https://download.inep.gov.br/dados_abertos/microdados_censo_escolar_2021.zip"

#Faz o download do arquivo
download.file(url= url_dados_2021,destfile = "censo_escolar_2021.zip", mode="wb")

#Descompacta o arquivo zio
unzip("censo_escolar_2021.zip")


#lê o arquivo csv que estava no arquivo zip e alimenta o dataframe
microdados_ed_basica_2021 <- read_delim("2021/dados/microdados_ed_basica_2021.csv",
                                        delim = ";", escape_double = FALSE, locale = locale(encoding = "LATIN1"),
                                        trim_ws = TRUE)

#Verificar uma amostra dos dados presentes no dataframe
glimpse(microdados_ed_basica_2021)

#Gera gráfico de ranking no número de escolas
microdados_ed_basica_2021 %>%
  group_by(SG_UF) %>%
  summarise(
    quantidade  = n()
  ) %>%
  mutate(SG_UF = reorder(SG_UF, quantidade)) %>%
  ungroup() %>%
  ggplot() +
  geom_col(aes(x=quantidade, y=SG_UF)) +
  scale_x_continuous(breaks = seq(0,35000,5000))
