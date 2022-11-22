Census <- read.delim("Datasets/Census.txt", 
                     header=TRUE, 
                     sep="",
                     dec = ".")
summary(Census)


lmCensus <- lm(LIFE ~ MALE + BIRTH + DIVO + BEDS + EDUC + INCO, data = Census)
summary(lmCensus)

summary(aov(lmCensus))
 
 
# Boxplots
par(mfrow=c(2,3))
boxplot(Census$MALE, xlab="MALE")
stripchart(Census$MALE, 
           vertical = TRUE,  
           method = "jitter", 
           add = TRUE,  
           col="blue", 
           pch = 20, 
           cex = 0.8 )

boxplot(Census$BIRTH,xlab="BIRTH")
stripchart(Census$BIRTH, 
           vertical = TRUE,  
           method = "jitter", 
           add = TRUE,  
           col="blue", 
           pch = 20, 
           cex = 0.8 )

boxplot(Census$DIVO,xlab="DIVO")
stripchart(Census$DIVO, 
           vertical = TRUE,  
           method = "jitter", 
           add = TRUE,  
           col="blue", 
           pch = 20, 
           cex = 0.8 )

boxplot(Census$BEDS, xlab="BEDS")
stripchart(Census$BEDS, 
           vertical = TRUE,  
           method = "jitter", 
           add = TRUE,  
           col="blue", 
           pch = 20, 
           cex = 0.8 )

boxplot(Census$EDUC,xlab="EDUC")
stripchart(Census$EDUC, 
           vertical = TRUE,  
           method = "jitter", 
           add = TRUE,  
           col="blue", 
           pch = 20, 
           cex = 0.8 )

boxplot(Census$INCO,xlab="INCO")
stripchart(Census$INCO, 
           vertical = TRUE,  
           method = "jitter", 
           add = TRUE,  
           col="blue", 
           pch = 20, 
           cex = 0.8 )



plot(x=lmCensus$residuals, y=lmCensus$BEDS, pch = 16, col = "red")

Census$predicted <- predict(lmCensus)   # Save the predicted values
Census$residuals <- residuals(lmCensus) # Save the residual values


library(ggplot2)

ggplot(Census, aes(x =  BEDS, y =  LIFE)) +
   
    geom_segment(aes(xend = BEDS, yend = predicted), alpha = .2) +  # alpha to fade lines
    geom_point() +
    geom_point(aes(y = predicted), shape = 1) +
    ggtitle("Residuals") +
    theme_bw()  # Add theme for cleaner look

 

