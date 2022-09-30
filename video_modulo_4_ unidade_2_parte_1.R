#A instalação do pacote RTN requer a execução das duas linhas seguintes
install.packages("devtools")
devtools::install_github("tchiluanda/rtn")

library(rtn)
library(tidyverse)

#Busca todas as contas
rtn::get_full_account_name()

#conta de despesa de pessoal
despesa_beneficios_previdenciarios<- "4.1  Benefícios Previdenciários"

#Busca quanto se gastou em despesas de pessoal nos meses de dezembro, mês 12
get_account_data_by_month(despesa_beneficios_previdenciarios,month = 12)

#Busca quanto se gastou em despesas de pessoal em todos os meses: 1:12
dados_previdenciarios<-get_account_data_by_month(despesa_beneficios_previdenciarios,month = 1:12)

#gera gráfico da série temporal de dados de despesa de pessoal
dados_previdenciarios%>%
  plot_rtn_series()

#ou ainda
get_account_data_by_month(despesa_beneficios_previdenciarios,month = 1:12) %>%
  plot_rtn_series()

#Busca novamente todas as contas
get_full_account_name()


#Códigos de contas associadas a despesas obrigatórias com controle de fluxo
despesas_obrigatorias<- c("4.4.1.1", "4.4.1.2", "4.4.1.3","4.4.1.4","4.4.1.5" )

#gera valores acumulados em 12 meses para as contas selecionadas
get_12_month_accumulated_account_data_by_month(despesas_obrigatorias,
                                                    month = c(1:12), #indica que quer o valor acumulado para todos os 12 meses do ano
                                                    match_required = FALSE)%>% #indica que vai fazer o match sem precisar do nome completo da conta
  plot_rtn_series() #gera o gráfico de linha
