install.packages ("neuralnet", repos = "http://cran.us.r-project.org")
library(neuralnet)
normalize <- function(x) {return ((x - min(x)) / (max(x) - min(x))) }
sm <- read.csv("/Users/aleksander/Documents/macbooki_dane.csv")
cena <- normalize(sm$cena)
pamiec_RAM <- normalize(sm$pamiec_RAM)
dysk <- normalize(sm$dysk)
sm <- sm[,-1]
sm <- sm[,-4]
sm <- sm[,-4]
sm <- sm[,-4]
sm
sm <-cbind(sm, cena, pamiec_RAM, dysk)
net.price <-neuralnet(cena~pamiec_RAM+dysk, sm, hidden=c(8,7,6,7), threshold = 0.01)
plot(net.price)