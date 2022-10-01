#A função c() cria um objeto que se associa a um conjunto de valores de um memsmo tipo

#na linha abaixo criamos um conjunto chamado nome_escola composto por três elementos tipo texto
obj_nome_escola<- c("Elefante Branco", "Liceu", "Pedro II")
obj_nome_escola

#na linha abaixo criamos um conjunto chamado quantidade_alunos_inscritos composto por três elementos tipo numérico discreto
obj_quantidade_alunos_inscritos<- c(200, 250, 300)
obj_quantidade_alunos_inscritos

#na linha abaixo criamos um conjunto chamado media_escola composto por três elementos tipo numérico contínuo
obj_media_escola<- c(400.34 , 453.27, 425.32)
obj_media_escola

#No R um dos tipos de tabela que usamos é o dataframe.
#Para criar um data.frame usamos a função data.frame.
#Na função data.frame, para cada coluna você deve indicar o nome da coluna seguido pelo símbolo "="
#e pelo conjunto de dados referente a essa coluna

#na linha abaixo criamos um data.frame chamado df_enem que é formada pela combinação dos três conjuntos criados anteriormente
df_enem<- data.frame(nome_escola=obj_nome_escola, #nome da coluna = conjunto de dados da coluna
                     quantidade_alunos_inscritos=obj_quantidade_alunos_inscritos, #nome da coluna = conjunto de dados da coluna
                     media_escola=obj_media_escola) #nome da coluna = conjunto de dados da coluna

df_enem


