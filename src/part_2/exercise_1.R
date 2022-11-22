find.package('rpart')
data("kyphosis", package = 'rpart')

values <- boxplot(kyphosis$Number,xlab="kyphosis$Number")
 

outliers <- values$out
outliers
# [1]  9 10

which(kyphosis$Number %in% outliers)
# [1] 43 53


x <- seq_along(kyphosis$Number)
y <- kyphosis$Number

plot(x, y, main="kyphosis$Number",
     xlab="Index", ylab="kyphosis$Number", pch=19) 

identify(x, y,   plot=TRUE)

kyphosis$Number[43]
kyphosis$Number[53]
