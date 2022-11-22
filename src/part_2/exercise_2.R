library(ggplot2)
options(scipen = 999)       
 

Capital <- read.delim("Datasets/capital.csv", 
                     header=TRUE, 
                     sep=";",
                     dec = ".")

balance <- Capital$balance
bins <- seq(0,1500,by=500)
balance_bins <- cut(balance, bins,dig.lab=10)

balance_gender_freq <- table(balance_bins, Capital$gender, dnn = c("cBalance", "cGender"))


balance_gender_relfreq <- prop.table(balance_gender_freq,1)
balance_gender_relfreq


 
# Frequency Bar Plot
balance_levels <- ordered(rep(levels(balance_bins),2),levels = levels(balance_bins))
gender_levels <-  c("1","1","1","2","2","2") 
values <- c(balance_gender_relfreq[,1],balance_gender_relfreq[,2])
data <- data.frame(balance_levels,gender_levels,values)

ggplot(data, aes(fill=gender_levels, y=values, x=balance_levels)) + 
  geom_bar(position="dodge", stat="identity") +
  ggtitle('Frequency Plot - Balance Group per Gender')
 

# Pie Charts - Balance Group per Gender 
balance_levels <- rep(levels(balance_bins)[1],2) 
gender_levels <-  c("1","2") 
values <-  balance_gender_relfreq[1,]
data <- data.frame(balance_levels,gender_levels,values)


pie1 <- ggplot(data, aes(x="", y=values, fill=gender_levels))+
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start=0) +
  ggtitle("Balance Group (0-500]")
pie1


balance_levels <- rep(levels(balance_bins)[2],2) 
gender_levels <-  c("1","2") 
values <-  balance_gender_relfreq[2,]
data <- data.frame(balance_levels,gender_levels,values)


pie2 <- ggplot(data, aes(x="", y=values, fill=gender_levels))+
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start=0) +
  ggtitle("Balance Group (500-1000]")
pie2


balance_levels <- rep(levels(balance_bins)[3],2) 
gender_levels <-  c("1","2") 
values <-  balance_gender_relfreq[3,]
data <- data.frame(balance_levels,gender_levels,values)


pie3 <- ggplot(data, aes(x="", y=values, fill=gender_levels))+
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start=0) +
  ggtitle("Balance Group (1000-1500]")
pie3



# Boxplots
par(mfrow=c(1,2))
boxplot(Capital$balance, xlab="Balance")
stripchart(Capital$balance, 
           vertical = TRUE,  
           method = "jitter", 
           add = TRUE,  
           col="blue", 
           pch = 20, 
           cex = 0.8 )

boxplot(Capital$gender, xlab="Gender")
stripchart(Capital$gender, 
           vertical = TRUE,  
           method = "jitter", 
           add = TRUE,  
           col="blue", 
           pch = 20, 
           cex = 0.8 )

par(mfrow=c(1,1))
boxplot(balance~gender,data=Capital, main="Balance per Gender",
        xlab="Gender", ylab="Balance") 


# Summary of datasets
summary(Capital)
sd(Capital$balance)
sd(Capital$gender)


# Check normal distribution
qqnorm(Capital$balance, main="Balance")
qqline(Capital$balance, col="red")

shapiro.test(Capital$balance)

#Shapiro-Wilk normality test

#data:  Capital$balance
#W = 0.99167, p-value = 0.08909

# p-value 0.089 > 0.05, implying that the distribution of the data
# are not significantly different from normal distribution.
# We can assume normality.