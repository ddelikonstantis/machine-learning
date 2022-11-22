mu <- 10000
sdev <- 120
n <- 30
x_sample <- 9900
a <- 0.05

# H0 : mu = 10000
# H1 : mu > 10000

Z <- ((x_sample - mu)*sqrt(n))/sdev

Z_a <- qnorm(1-a)

Z > Z_a

#We can not reject the H0 hypothesis, so we reject the company's statement(H1)