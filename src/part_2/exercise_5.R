 

OctopusF <- read.delim("Datasets/OctopusF.txt", 
                        header=TRUE, 
                        sep="",
                        dec = ".")

summary(OctopusF)
sd(OctopusF$Weight)


hist(OctopusF$Weight)
 
# Check normal distribution
qqnorm(OctopusF$Weight, main="Weight")
qqline(OctopusF$Weight, col="red")

shapiro.test(OctopusF$Weight)

#data:  OctopusF$Weight
#W = 0.88612, p-value = 1.863e-12

# p-value 1.863e-12 < 0.05, implying that the distribution of the data
# are significantly different from normal distribution.
# We can not assume normality.

