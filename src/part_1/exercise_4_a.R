cpi <- c(163.3, 165.7, 166.5, 168, 168.4, 169, 
         167.5, 170.1, 173, 172.1, 174.5, 174)

trimester <- seq(1, 12 ) 

# Plot the dataset. 
plot(x=trimester,y=cpi,
     col = "blue",
     cex = 1,
     pch = 16,
     xlim = c(0,12),
     main = "(CPI) per trimester, starting year: 2013 ",
     ylab = "CPI", xlab="trimester")
    

# Apply the lm() function.
relation <- lm(cpi~trimester)

print(relation)
print(summary(relation))

abline(relation, col =  "green", lwd = 2)

# Find weight of a person with height 170.
trimester2016 <- data.frame(trimester = c(13,14,15,16))
predCPI <-  predict(relation,trimester2016)
print(predCPI)

