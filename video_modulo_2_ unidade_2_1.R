#A função c() cria um objeto que se associa a um conjunto de valores de um memsmo tipo

#na linha abaixo criamos um conjunto chamado nome_escola composto por três elementos tipo texto
nome_escola<- c("Elefante Branco", "Liceu", "Pedro II")
nome_escola

#na linha abaixo criamos um conjunto chamado quantidade_alunos_inscritos composto por três elementos tipo numérico discreto
quantidade_alunos_inscritos<- c(200, 250, 300)
quantidade_alunos_inscritos

#na linha abaixo criamos um conjunto chamado media_escola composto por três elementos tipo numérico contínuo
media_escola<- c(400.34 , 453.27, 425.32)
media_escola

#No R um dos tipos de tabela que usamos é o dataframe.
#Para criar um data.frame usamos a função data.frame.
#Na função data.frame, para cada coluna você deve indicar o nome da coluna seguido pelo símbolo "="
#e pelo conjunto de dados referente a essa coluna

#na linha abaixo criamos um data.frame chamado df_enem que é formada pela combinação dos três conjuntos criados anteriormente
df_enem<- data.frame(nome_escola=nome_escola, #nome da coluna = conjunto de dados da coluna
                     quantidade_alunos_inscritos=quantidade_alunos_inscritos, #nome da coluna = conjunto de dados da coluna
                     media_escola=media_escola) #nome da coluna = conjunto de dados da coluna

df_enem


###########################################

#Para instalar um novo pacote no R usamos a função install.package
#A linha abaixo instala o pacote questionr
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
#sort: indicação se você quer que os valores sejam ordenados em ordem crescente ("asc") ou descrescente ("dec")

#Na linha abaixo geramos uma tabela de frequência sobre os dados de rede hospitalar, com frequência acumulada em ordem decrescente
questionr::freq(x= hospitais$rede_hospitalar, cum = TRUE, sort = "dec")
