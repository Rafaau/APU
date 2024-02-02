install.packages ("neuralnet", repos = "http://cran.us.r-project.org")
library(neuralnet)
normalize <- function(x) {return ((x - min(x)) / (max(x) - min(x))) }
x <- as.data.frame(runif(10, min = 0, max = 2*pi))
result <- abs(sin(x))^cos(x)
trainingData <- cbind(result, x)
colnames(trainingData) <- c("Output", "Result")
maxmindf<- as.data.frame(lapply(trainingData, normalize))
net.price <- neuralnet(Result~Output, maxmindf, hidden = c(2,3,4,3), threshold = 0.01)
plot(net.price)