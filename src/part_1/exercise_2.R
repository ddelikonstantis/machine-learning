faithfull <- read.delim("Datasets/faithfull.txt", 
                       header=TRUE, 
                       sep="",
                       dec = ".")
# Plot the dataset. 
plot(x=faithfull$waiting,y=faithful$eruptions,
     col = "blue",
     cex = 1,
     pch = 16,
     main = "Eruption per waiting",
     ylab = "eruptions", xlab="waiting time")


# Apply the lm() function.
lm_faithfull <- lm(eruptions~waiting, data = faithful)

print(lm_faithfull)
print(summary(lm_faithfull))

abline(lm_faithfull, col =  "green", lwd = 2)

residuals <- resid(lm_faithfull) 
plot(faithful$waiting, residuals, ylab="Residuals", xlab="Waiting Time",   main="Eruptions") 
abline(0, 0) 


# Find weight of a person with height 170.
waiting80 <- data.frame(waiting = c(80))
pred <-  predict(lm_faithfull,waiting80)
print(pred)


summary(aov(lm_faithfull))

plot(lm_faithfull, which=1, col=c("blue")) 

plot(lm_faithfull, which=2, col=c("red"))  # Q-Q Plot

plot(lm_faithfull, which=3, col=c("blue"))  # Scale-Location Plot
