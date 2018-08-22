## Naive Bayes ##

# Importando os dados

library(xlsx)

planejamento <- readxl::read_xlsx("C:\\Users\\lopes\\Dropbox\\Introducao a Mineracao de Dados\\Cap�tulo 3 - An�lise Preditiva\\3.1 - Classificacao\\Naive Bayes.xlsx")
head(planejamento)

exemplar_teste <- data.frame(PREVISAO="sol", TEMPERATURA="frio", HUMIDADE="normal", VENTO="sim")

# Carregando pacote que implementa o Naive Bayes

library(e1071)
?naiveBayes # para construir o classificador ("modelo")
?predict.naiveBayes # implementa a predi��o usando o Naive Bayes (pode-se usar somente a fun��o predict() )

# Criando o modelo

modelo_NB <- naiveBayes(planejamento[1:4], planejamento$VENDA)

modelo_NB

# Implementando a classifica��o utilizando a fun��o predict():

# type="raw" e sem corre��o de Laplace:

p <- predict(modelo_NB, exemplar_teste, type="raw")

p