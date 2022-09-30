install.packages("microdatasus")

library(microdatasus)
library(tidyverse)


ano_inicio<- 2020
ano_fim <- 2020
mes_inicio<-12
mes_fim<-12
estado<- "GO"

#Traz dados sobre internações hospitalares: SIH-RD
resultado<-microdatasus::fetch_datasus(year_start = ano_inicio,
                                       year_end = ano_fim,
                                       uf = estado,
                                       month_start = mes_inicio,
                                       month_end = mes_fim,
                                       information_system = "SIH-RD")

dados_internacoes<- microdatasus::process_sih(resultado)

dados_internacoes%>%
  filter(COD_IDADE=="Anos")%>% #filtrar para excluir bebês que ainda não completaram um ano
  mutate(IDADE = as.numeric(IDADE))%>%  #converte idade de variável categórica para numérica
  ggplot() +
  geom_boxplot(aes(x=SEXO, y=IDADE)) +
  scale_y_continuous(breaks = seq(0,100,10))

library(questionr)

ano_inicio<- 2020
ano_fim <- 2020
mes_inicio<-12
mes_fim<-12
estado<- "CE"

#Traz dados sobre internações hospitalares: CNES-ST
resultado<-microdatasus::fetch_datasus(year_start = ano_inicio,
                                       year_end = ano_fim,
                                       uf = estado,
                                       month_start = mes_inicio,
                                       month_end = mes_fim,
                                       information_system = "CNES-ST")

dados_hospitais<- microdatasus::process_cnes(resultado)

questionr::freq(dados_hospitais$TPGESTAO, cum = TRUE, sort = "dec", total = TRUE)

