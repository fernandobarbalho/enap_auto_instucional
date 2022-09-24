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
library(dados)
glimpse(dados::questionario)


