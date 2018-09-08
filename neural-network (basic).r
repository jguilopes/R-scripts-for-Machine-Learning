library(nnet)
library(caTools)
library(NeuralNetTools)

set.seed(810)


# Dividing the dataset: training x test -----------------------------------

sample <- sample.split(iris$Species, SplitRatio = .70)

iris.train <- subset(iris, sample == TRUE)
iris.test <- subset(iris, sample == FALSE)


# Creating the net --------------------------------------------------------

nni <- nnet(Species ~ Petal.Length + Petal.Width, iris.train, size = 4)

summary(nni)


# Plotting the net --------------------------------------------------------

plotnet(nni, bias = F)


# Evaluating the network --------------------------------------------------

pred <- predict(nni, iris.test, type = "class")

table(iris.test$Species, pred)
