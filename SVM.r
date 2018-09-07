library(tidyverse)
library(caTools)
library(e1071)

# Data --------------------------------------------------------------------

vers.virg <- filter(iris, Species != "setosa")


# Separating into training and test sets ----------------------------------


svm_sample <- sample.split(vers.virg$Species, SplitRatio = .75)

training.set <- subset(vers.virg, svm_sample == TRUE)
test.set <- subset(vers.virg, svm_sample == FALSE)


# Training the SVM --------------------------------------------------------


?e1071::svm

svm_model <- svm(Species ~ Petal.Width + Petal.Length, data=training.set,
                 method = "C-classification", kernel = "linear")

svm_model



# Plotting the SVM --------------------------------------------------------

plot(svm_model, data = training.set[, c(3,4,5)],
     formula = Petal.Width ~ Petal.Length)

# Testing the SVM ---------------------------------------------------------

pred.training <- predict(svm_model, training.set)
mean(pred.training == training.set$Species)

pred.test <- predict(svm_model, test.set)
mean(pred.test == test.set$Species)