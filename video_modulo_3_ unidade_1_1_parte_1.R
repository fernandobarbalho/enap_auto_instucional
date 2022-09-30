#Você deve instalar o pacote tidyverse para executar o script
#Lembre-se que a instalação precisa ser feita apenas uma vez.
#Se você for executar esse script mais de uma vez, insira um # antes da linha logo abaixo a partir da segunda execução.
install.packages("tidyverse")

#Carrega o pacote tidyverse para a memória
library(tidyverse)

#O objeto arquivo abaixo indica onde está na internet a tabela com os dados sobre municípios brasileiros
arquivo<- "https://raw.githubusercontent.com/fernandobarbalho/enap_auto_instucional/main/data/dados_municipios.csv"


#A função read_csv permite a leitura de um arquivo e a transformação do arquivo em um data.frame
#É necessário pelo menos a indicação do seguinte parâmetro para se usar a função read_scv:
#file: caminho completo para se chegar a um arquivo. O caminho deve terminar com o nome do arquivo
#Deve-se observar que file pode conter um caminho para um endereço na internet ou para uma pasta

#Gera o data.frame dados_municipios a partir do que está presente no endereço representado pelo objeto arquivo
dados_municipios<- read_csv(file= arquivo)

#Mostra o conteúdo de dados municipios
dados_municipios

