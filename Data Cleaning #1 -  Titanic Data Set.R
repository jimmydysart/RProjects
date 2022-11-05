setwd("~/Documents/Github/RProjects")

titanic.train <- read.csv(file = "train.csv", stringsAsFactors = FALSE,header = TRUE)
titanic.test <- read.csv(file = "test.csv", stringsAsFactors = FALSE,header = TRUE)

titanic.train$IsTrainSet <- TRUE
titanic.test$IsTrainSet <- FALSE

titanic.test$Survived <- NA

titanic.full <- rbind(titanic.train, titanic.test)

titanic.full[titanic.full$Embarked == '', "Embarked"]

table(is.na(titanic.full$Age))

age.median <-median(titanic.full$Age, na.rm = TRUE)

titanic.full[is.na(titanic.full$Age),"Age"] <- age.median

table(is.na(titanic.full$Fare))

Fare.median <- median(titanic.full$Fare, na.rm = TRUE)

titanic.full[is.na(titanic.full$Fare),"Fare"] <- Fare.median

### categorical casting

as.factor(titanic.full$Pclass)


titanic.train<- titanic.full[titanic.full$IsTrainSet == TRUE,]
titanic.test<- titanic.full[titanic.full$IsTrainSet == FALSE,]



