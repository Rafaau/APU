# Wariant 2
# a
a <- 2*log(5)
b <- 3*a
min(a,b)

# b
#?median

# c
a <- 25:45
median(a)

# d
apropos("median")

# e
setwd("/Users/aleksander/Documents")
a <- "macbooki Apple"
save(a, file = "a.RData")
rm(a)
#print(a)
load("a.RData")
print(a)

# f
install.packages("gridExtra", repos = "http://cran.us.r-project.org")
library(gridExtra)
data("Orange")
table <- tableGrob(head(Orange, 10), rows = NULL)
library(grid)
grid.draw(table)
install.packages("gt", repos = "http://cran.us.r-project.org")
library(gt)
data("Orange")
gt(head(Orange, 10))


# g
wektor <- seq(200, 130, by = -5)

# h
a <- 19:5
b <- 11:23
d <- c(b, a)
print(d)

# i
nazwa <- c(
    "MacBook 1", 
    "MacBook 2", 
    "MacBook 3", 
    "MacBook 4", 
    "MacBook 5", 
    "MacBook 6", 
    "MacBook 7", 
    "MacBook 8", 
    "MacBook 9", 
    "MacBook 10"
)
ekran <- c(13, 13, 14, 14, 14, 15, 15, 15, 16, 16)
pamiec_RAM <- c(8, 8, 16, 16, 16, 32, 32, 32, 64, 64)
dysk <- c(128, 128, 256, 256, 516, 516, 516, 1024, 1024, 2048)
cena <- c(3500, 4000, 4500, 5000, 5500, 6000, 6500, 7000, 7500, 8000)
liczba_opinii <- c(20, 30, 40, 20, 30, 40, 5, 10, 50, 15)
macbooki <- data.frame(nazwa, ekran, pamiec_RAM, dysk, cena, liczba_opinii)
avg<- mean(macbooki$cena)

# j
nazwa <- "MacBook 11"
ekran <- 17
pamiec_RAM <- 128
dysk <- 4096
cena <- 10000
liczba_opinii <- 5
new <- data.frame(nazwa, ekran, pamiec_RAM, dysk, cena, liczba_opinii)
macbooki <- rbind(macbooki, new)
new_avg <- mean(macbooki$cena)

# k
macbooki$ocena <- seq(from = 0, to = 5, by = 0.5)[sample(1:11, nrow(macbooki), replace=TRUE)]
avg_oceny <- tapply(macbooki$cena, macbooki$ocena, mean)

# l
new <- data.frame(
  nazwa = c("MacBook 12", "MacBook 13", "MacBook 14", "MacBook 15"),
  ekran = c(16, 16, 16, 17),
  pamiec_RAM = c(32, 64, 64, 128),
  dysk = c(1024, 1024, 2048, 4096),
  cena = c(6500, 7000, 7500, 8000),
  liczba_opinii = c(20, 30, 15, 10),
  ocena = seq(from = 0, to = 5, by = 0.5)[sample(1:15, 4, replace = TRUE)]
)
macbooki <- rbind(macbooki, new)
install.packages("ggplot2", repos = "http://cran.us.r-project.org")
library(ggplot2)
ggplot(macbooki, aes(x = factor(ocena))) +
  geom_bar() +
  labs(x = "ocena", y = "ilość") +
  ggtitle("ilość per ocena") +
  theme_minimal()

# m
ggplot(macbooki, aes(x = "", fill = factor(ocena))) +
  geom_bar(width = 1, color = "white") +
  coord_polar("y", start=0) +
  labs(fill = "ocena") +
  ggtitle("% ocen")
ggplot(macbooki, aes(x = factor(ocena))) +
  geom_bar() +
  labs(x = "ocena", y = "ilość") +
  ggtitle("% ocen") +
  theme_minimal()

# n
macbooki$status_opinii <- cut(
    macbooki$liczba_opinii,
    breaks = c(-Inf, 0, 50, 100, Inf),
    labels = c("nie ma", "mniej niż 50 opinii", "50-100 opinii", "więcej niż 100 opinii"),
    include.lowest = TRUE
)
macbooki$status_opinii <- as.factor(macbooki$status_opinii)
ggplot(macbooki, aes(x = "", fill = status_opinii)) +
  geom_bar(width = 1, color = "white") +
  coord_polar("y", start=0) +
  labs(fill = "status") +
  ggtitle("% udział wg opinii")

# o
zdania <- paste(macbooki$nazwa, "ma ocenę klientów", macbooki$ocena_klientow, "bo ma liczbę opinii", macbooki$liczba_opinii)

# p
write.csv(macbooki, file = "macbooki_dane.csv", row.names = FALSE)
loaded <- read.csv("macbooki_dane.csv")
print(loaded)