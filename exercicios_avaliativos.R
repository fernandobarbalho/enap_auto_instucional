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
library(tidyverse)
dados_gapminder %>%
  filter(pais=="Brasil") %>%
  ggplot()+
  geom_point(aes(x=pib_per_capita, y=expectativa_de_vida))


library(dados)
library(tidyverse)
dados_gapminder %>%
  filter(ano==2007) %>%
  slice_max(order_by = expectativa_de_vida, n=10) %>%
  mutate(pais = reorder(pais,expectativa_de_vida)) %>%
  ggplot()+
  geom_col(aes(x=expectativa_de_vida, y=pais))

library(dados)
library(tidyverse)
dados_gapminder %>%
  filter(pais=="Brasil") %>%
  ggplot()+
  geom_line(aes(x=ano, y=pib_per_capita))


library(dados)
library(tidyverse)
dados_gapminder %>%
  filter(pais=="Brasil") %>%
  ggplot()+
  geom_line(aes(x=ano, y=expectativa_de_vida))

library(dados)
library(tidyverse)
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




library(siconfiBD)
library(basedosdados)
library(tidyverse)

siconfiBD::setup_siconfi(project_id = "nice-diorama-306223")

pop_municipios<-basedosdados::bdplyr("br_ibge_populacao.municipio")

pop_municipios<-
pop_municipios%>%
  dplyr::filter(ano==2020)%>%
  basedosdados::bd_collect()

gastos_perc_saude<-
  siconfiBD::get_perc_function_exp_municipality(year=2020,gov_function = "saúde", expense_stage = "Despesas Pagas")


#prepraração do dado
dados_saude_municipio<-
gastos_perc_saude %>%
  inner_join(pop_municipios)

dados_saude_municipio %>%
  readr::write_csv("data/dados_saude_municipio.csv")

#testes para verificar a viabilidade do uso em exercícios
dados_saude_municipio%>%
  ggplot()+
  geom_point(aes(x=populacao, y=perc))+
  scale_x_log10()

cor(dados_saude_municipio$populacao, dados_saude_municipio$perc)

cor(log10(dados_saude_municipio$populacao), dados_saude_municipio$perc)

dados_saude_municipio%>%
  ggplot()+
  geom_point(aes(x=populacao, y=valor))+
  scale_x_log10() +
  scale_y_log10()

cor(dados_saude_municipio$populacao, dados_saude_municipio$valor)

cor(log10(dados_saude_municipio$populacao), log(dados_saude_municipio$valor))

#exercícios

library(tidyverse)

url<- "https://raw.githubusercontent.com/fernandobarbalho/enap_auto_instucional/main/data/dados_saude_municipio.csv"

dados_saude_municipio<-
  read_csv(url)

dados_saude_municipio%>%
  ggplot()+
  geom_point(aes(x=populacao, y=perc))+
  scale_x_log10()

cor(log10(dados_saude_municipio$populacao), dados_saude_municipio$perc)



library(tidyverse)

url<- "https://raw.githubusercontent.com/fernandobarbalho/enap_auto_instucional/main/data/dados_saude_municipio.csv"

dados_saude_municipio<-
  read_csv(url)

dados_saude_municipio%>%
  ggplot()+
  geom_point(aes(x=populacao, y=valor))+
  scale_x_log10() +
  scale_y_log10()

cor(log10(dados_saude_municipio$populacao), log10(dados_saude_municipio$valor))




##Dados abertos de dados.gov.br

#url do dado
url_habitacao<- "http://sishab.mdr.gov.br/dados_abertos/_contratacoes_pcmv_pcva.csv"

#download do dado a partir do endereço da url
download.file(url = url_habitacao, destfile = "contratacoes_pcmv_pcva.csv", mode="wb")

library(readr)
library(tidyverse)

#gera um dataframe a partir do arquivo csv baixado
contratacoes_pcmv_pcva <- read_delim("contratacoes_pcmv_pcva.csv",
                                     delim = ";", escape_double = FALSE, locale = locale(encoding = "LATIN1"),
                                     trim_ws = TRUE) #sugestão: procure ler sobre encoding

contratacoes_2021<-
  contratacoes_pcmv_pcva %>%
  filter(num_ano_assinatura_contrato==2021)

library(questionr)

questionr::freq(contratacoes_2021$txt_faixa_grupo_renda, cum = TRUE, sort = "dec", total = TRUE)


library(rtn)
library(tidyverse)

#Códigos de contas associadas a despesas obrigatórias com controle de fluxo
despesas_obrigatorias<- c("4.4.1.1", "4.4.1.2", "4.4.1.3","4.4.1.4","4.4.1.5" )

dados<-
  rtn::get_12_month_accumulated_account_data_by_month(despesas_obrigatorias,
                                                      month = c(1:12), #indica que quer o valor acumulado para todos os 12 meses do ano
                                                      match_required = FALSE) #indica que vai fazer o match sem precisar do nome completo da conta

#gera valores acumulados em 12 meses para as contas selecionadas
rtn::get_12_month_accumulated_account_data_by_month(despesas_obrigatorias,
                                                    month = c(1:12), #indica que quer o valor acumulado para todos os 12 meses do ano
                                                    match_required = FALSE)%>% #indica que vai fazer o match sem precisar do nome completo da conta
  rtn::plot_rtn_series() #gera o gráfico de linha


library(Rcofog)
library(tidyverse)

funcoes<- c("Saúde","Educação")

Rcofog::dataTimeSeries(funcoes) %>%
  Rcofog::graphTimeSeries()


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



library(microdatasus)
library(tidyverse)
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


library(tidyverse)

url_dados_2021<- "https://download.inep.gov.br/dados_abertos/microdados_censo_escolar_2021.zip"

download.file(url= url_dados_2021,destfile = "censo_escolar_2021.zip", mode="wb")

unzip("censo_escolar_2021.zip")

microdados_ed_basica_2021 <- read_delim("2021/dados/microdados_ed_basica_2021.csv",
                                        delim = ";", escape_double = FALSE, locale = locale(encoding = "LATIN1"),
                                        trim_ws = TRUE)

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


library(tidyverse)

url_dados_2021<- "https://download.inep.gov.br/dados_abertos/microdados_censo_escolar_2021.zip"

download.file(url= url_dados_2021,destfile = "censo_escolar_2021.zip", mode="wb")

unzip("censo_escolar_2021.zip")

microdados_ed_basica_2021 <- read_delim("2021/dados/microdados_ed_basica_2021.csv",
                                        delim = ";", escape_double = FALSE, locale = locale(encoding = "LATIN1"),
                                        trim_ws = TRUE)



#TP_DEPENDENCIA
#1 - Federal
#2 - Estadual
#3 - Municipal
#4 - Privada


library(viridis)
microdados_ed_basica_2021 %>%
  group_by( SG_UF, TP_DEPENDENCIA) %>%
  mutate(TP_DEPENDENCIA = as.factor(TP_DEPENDENCIA)) %>%
  summarise(
    quantidade  = n()
  ) %>%
  ungroup() %>%
  mutate(SG_UF = reorder(SG_UF, quantidade)) %>%
  ggplot() +
  geom_col(aes(x=quantidade, y=SG_UF, fill= TP_DEPENDENCIA)) +
  scale_fill_viridis(discrete = TRUE) +
  scale_x_continuous(breaks = seq(0,35000,5000))




library(tidyverse)

url_dados_ideb<- "https://download.inep.gov.br/educacao_basica/portal_ideb/planilhas_para_download/2019/divulgacao_anos_finais_escolas_2019.zip"

download.file(url= url_dados_ideb,destfile = "ideb_2019.zip", mode="wb")

unzip("ideb_2019.zip")

