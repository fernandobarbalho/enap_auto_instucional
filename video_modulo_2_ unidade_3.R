#podemos criar conjuntos de valores consecutivos usando a notação valor_inicial:valor_final.
#no exemplo abaixo criamos um conjunto de 100 números variando de 1 a 100
1:100

#Quando trabalhamos com estatística não é raro que precisemos gerar valores aleatórios.
#Para que valores aleatórios sejam repetidos em execuções consecutivas utilizamos a função set.seed
#A função set.seed pede que o analista informe um número inteiro qualquer para marcar qual é a semente da geração do valor aleatório
set.seed(1972)


#A função sample gera números aleatórios. São necessários pelo menos os seguintes parâmetros para se gerar esse números
#x: um conunto de valores que os números podem assumir
#size: o tamanho do conjunto de números aleatórios que desejamos criar

#gera um conjunto com 50 números aleatórios entre 1 e 100
valores_aleatorios<- sample(x=1:100, size = 50)

valores_aleatorios

#A função sum soma todos os valores de um conjunto. Na linha abaixo, somamos so valores entre 1 e 3
sum(1:3)

#A função NROW indica o número de linhas de um conjunto ou o número de linhas de um datafrme.
NROW(1:3)

#Podemos usar as funções sum e NROW para calcular a média dos números no objeto valores_aleatorios
sum(valores_aleatorios)/NROW(valores_aleatorios)

#Mas o R disponibiliza a função mean que faz esse cálculo de forma mais prática.
#Basta informar no parâmetro x qual o conjunto que se quer calcular a média
mean(x= valores_aleatorios)

#Já para a mediana utiliza-se a função median
median(x= valores_aleatorios)

#As medidas de dispersão também são simples no R

#O valor mínimo é dado pela função min
min(valores_aleatorios)

#O valor máximo é dado pela função max
max(valores_aleatorios)

#E a amplitude você calcula pela valor máximo menos o valor mínimo
max(valores_aleatorios) - min(valores_aleatorios)

#Já o desvio padrão é dado pela função sd
sd(valores_aleatorios)
