library(caret)
setwd("/Users/ariane/Documents/Travail/Coursera/DataScience/PracticalMachineLearning/")
training <- read.csv("pml-training.csv", na.strings=c("","NA"))
testing <- read.csv("pml-testing.csv", na.strings=c("","NA"))

nbNA <- vector(length=160)
for(i in 1:160){nbNA[i] <- sum(is.na(training[,i]))}
keep <- c(1:160)[nbNA==0]
keep <- keep[keep>=8]
training2 <- data.frame(user_name=as.factor(training$user_name), num_window=as.factor(training$num_window), training[,keep])
testing2 <- data.frame(user_name=as.factor(testing$user_name), num_window=as.factor(testing$num_window), testing[,keep])

preProc <- preProcess(training2[,-c(1,2,55)], method="pca", thresh=0.80)
training3 <- predict(preProc, training2[,-c(1,2,55)])
training4 <- data.frame(user_name=training2$user_name, num_window=training2$num_window, training3, classe=training2$classe)
testing3 <- predict(preProc, testing2[,-c(1,2,55)])
testing4 <- data.frame(user_name=testing2$user_name, num_window=testing2$num_window, testing3)

model1 <- train(classe ~ ., method="rpart", data=training4)
pred1 <- predict(model1, newdata=training4)
matrix1 <- confusionMatrix(pred1, training4$classe)

model2 <- train(classe ~ ., method="rf", data=training2)
pred2 <- predict(model2, newdata=training2)
confusionMatrix(pred2, training2$classe)