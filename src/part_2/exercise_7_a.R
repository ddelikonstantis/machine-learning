# install.packages("readxl")
# install.packages("caret")
# install.packages("neuralnet")
library("readxl")
library("caret")

data <- read_excel("Datasets/Concrete_Data.xls")
summary(data)


preproc1 <- preProcess(data,  method=c("range"))
norm_data <- predict(preproc1, data)
summary(norm_data)


## 75% of the sample size
sample_size <- floor(0.75 * nrow(norm_data))


set.seed(123)
train_ind <- sample(seq_len(nrow(norm_data)), size = sample_size)

train <- norm_data[train_ind, ]
test <- norm_data[-train_ind, ]


#Neural Network

#Using neuralnet to "regress" the dependent "dividend" variable 
#against the other independent variables
#Setting the number of hidden layers to (2,1) 
#based on the hidden=(2,1) formula
#The linear.output variable is set to FALSE, given the impact of the independent 
#variables on the dependent variable (dividend) is assumed to be non-linear
#The threshold is set to 0.01, meaning that if the change in error during an 
#iteration is less than 1%, then no further optimization will be carried out 
#by the model


# Neural Network 1
library(neuralnet)
nn <- neuralnet(Concrete ~ Cement + Slag + Ash + Water + Superplasticizer +
                  CoarseAggregate + FineAggregate + Age, 
                data=train, 
                hidden=c(3,1), 
                linear.output=TRUE, 
                threshold=0.01)
nn$result.matrix
plot(nn) 

## Prediction using neural network
Predict <- compute(nn,test)
Predict2 <- predict(nn,test)

 

RMSE <- (sum((test$Concrete - Predict$net.result)^2) / nrow(test)) ^ 0.5
RMSE


deviation=((test$Concrete-Predict$net.result)/test$Concrete)
deviation[which(!is.finite(deviation))] <- 0
accuracy=1-abs(mean(deviation))
accuracy


# Neural Network 2
nn2 <- neuralnet(Concrete ~ Cement + Slag + Ash + Water + Superplasticizer +
                  CoarseAggregate + FineAggregate + Age, 
                data=train, 
                hidden=c(3,3,2), 
                linear.output=TRUE, 
                threshold=0.01)

## Prediction using neural network
Predict <- compute(nn2,test)

nn2$result.matrix
plot(nn2)


deviation=((test$Concrete-Predict$net.result)/test$Concrete)
deviation[which(!is.finite(deviation))] <- 0
accuracy=1-abs(mean(deviation))
accuracy


cor(norm_data)


 
 


 
