# install.packages("factoextra")
library(factoextra)

iris <- read.csv(file = 'Datasets/iris.csv')
head(iris)

 
# EDA
par(mar=c(4,2,3,2),mfrow=c(2,2))
for (i in 1:4) boxplot(iris[,i] ~ iris[,5],
                       col = 1:3, main = names(iris)[i])

iris_pca <- princomp(iris[,c('sepal_length', 'sepal_width', 'petal_length', 'petal_width')], 
                     scores=TRUE, cor=TRUE)

fviz_eig(iris_pca)

summary(iris_pca)
# From the summary, first PC explains about 92% of total variables.
# By the time we reach the second PC 98% of total variance is explained.


loadings(iris_pca)
 
 
fviz_pca_var(iris_pca,
             col.var = "contrib", # Color by contributions to the PC
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
             repel = TRUE     # Avoid text overlapping
)


groups <- as.factor(iris$species)
fviz_pca_ind(iris_pca,
             col.ind = groups, # color by groups
             #palette = c("#00AFBB",  "#FC4E07"),
             addEllipses = TRUE, # Concentration ellipses
             #ellipse.type = "confidence",
             legend.title = "Groups",
             repel = TRUE
)
