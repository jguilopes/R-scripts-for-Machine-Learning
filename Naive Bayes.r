## Naive Bayes ##

# Importando os dados

library(xlsx)

planejamento <- readxl::read_xlsx("C:\\Users\\lopes\\Dropbox\\Introducao a Mineracao de Dados\\Capítulo 3 - Análise Preditiva\\3.1 - Classificacao\\Naive Bayes.xlsx")
head(planejamento)

exemplar_teste <- data.frame(PREVISAO="sol", TEMPERATURA="frio", HUMIDADE="normal", VENTO="sim")

# Carregando pacote que implementa o Naive Bayes

library(e1071)
?naiveBayes # para construir o classificador ("modelo")
?predict.naiveBayes # implementa a predição usando o Naive Bayes (pode-se usar somente a função predict() )

# Criando o modelo

modelo_NB <- naiveBayes(planejamento[1:4], planejamento$VENDA)

modelo_NB

# Implementando a classificação utilizando a função predict():

# type="raw" e sem correção de Laplace:

p <- predict(modelo_NB, exemplar_teste, type="raw")

p