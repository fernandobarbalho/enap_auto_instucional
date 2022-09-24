library(basedosdados)
library(tidyverse)

basedosdados::set_billing_id("nice-diorama-306223")

query <- bdplyr("br_ibge_populacao.municipio")
pop_municipios <- bd_collect(query)

query <- bdplyr("br_bd_diretorios_brasil.municipio")
municipios <- bd_collect(query)

pop_municipios <-
  pop_municipios%>%
  filter(ano==2020)

pop_total<-
  pop_municipios %>%
  inner_join(municipios)%>%
  mutate(municipios= "municipios")
