#Para instalar um novo pacote no R usamos a função install.package
#A linha abaixo instala o pacote questionr.
install.packages("questionr")

#a linha abaixo carrega o pacote na memória
library(questionr)

#Cria dois conjuntos de dados: nome_hospital, rede_hospital
nome_hospital<- c("São Sebastião","João Paulo II","Trindade","São Clemente","Hospital Regional", "Hospital Geral")
rede_hospitalar<- c("municipal","municipal","federal","estadual","estadual","municipal")

#cria o data.frame hospitais com as colunas nome_hospital e rede_hospital
hospitais<- data.frame(nome_hospital= nome_hospital, rede_hospitalar= rede_hospitalar)


#para se verifica o conteúdo de uma coluna específica de um data.frame use a notação <data.frame>$<nome_coluna>
#Na linha abaixo você vai ver o conteúdo da coluna nome_hospital
hospitais$nome_hospital

#Na linha abaixo você vai ver o conteúdo da coluna rede_hospitalar
hospitais$rede_hospitalar

#A função freq presente no pacote questionr possibilita gerar uma tabela de frequência
#A função freq pede que você informe alguns parâmetros, os principais são:
#x:  o conjunto de dados que você deseja fazer a tabela de frequência
#cum: indicação se você quer que a tabela de frequência apareça ou não os valores acumulados (TRUE/FALSE)
#sort: indicação se você quer que os valores sejam ordenados em ordem crescente ("inc") ou descrescente ("dec")

#Na linha abaixo geramos uma tabela de frequência sobre os dados de rede hospitalar, com frequência acumulada em ordem decrescente
questionr::freq(x= hospitais$rede_hospitalar, cum = TRUE, sort = "inc")
