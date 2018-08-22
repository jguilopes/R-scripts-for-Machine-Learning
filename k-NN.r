# Pacote

library(tidyverse)
library(class)

# Função para implementar o k-NN:
?knn()

# Importando dataset:

dataset <- read_delim("C:/Users/lopes/Dropbox/Introducao a Mineracao de Dados/Capítulo 3/3.1 - Classificacao/k-NN-dataset.csv", ";", escape_double = FALSE, locale = locale(decimal_mark = ","), trim_ws = TRUE)

# Separando dataset de treinamento e variavel com as classes:

treinamento <- dataset[2:12, 2:3]
rotulos <- dataset[2:12, 4:4]

# Separando observação(exemplar) cuja classe deve ser prevista pelo algoritmo k-NN:

teste <- dataset[1:1, 2:3]

# Executando o k-NN:

(classe_estimada <- knn(treinamento, teste, rotulos$CLASSE, 3))

classe_estimada

CrossTable(x = rotulos$CLASSE, y = classe_estimada, prop.chisq = FALSE)