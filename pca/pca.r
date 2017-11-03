# code from Alex Woods' tutorial

library(MASS)
attitude <- attitude
suppressMessages(attach(attitude))
attitude

attitude$rating <- (rating - mean(rating)) / sd(rating)
attitude$complaints <- (complaints - mean(complaints)) / sd(complaints)
attitude$privileges <- (privileges - mean(privileges)) / sd(privileges)
attitude$learning <- (learning - mean(learning)) / sd(learning)
attitude$raises <- (raises - mean(raises)) / sd(raises)
attitude$critical <- (critical - mean(critical)) / sd(critical)
attitude$advance <- (advance - mean(advance)) / sd(advance)

suppressMessages(attach(attitude))

summary(attitude)
sd(privileges)

cov(attitude)

x <- eigen(cov(attitude))
x$vectors

cov(attitude) %*% x$vectors[, 1]
x$values[1] * x$vectors[, 1]

A <- x$vectors[, 1:3]
B <- data.matrix(attitude)

newData <- t(A) %*% t(B)

newData <- t(newData)
newData <- data.frame(newData)
names(newData) <- c("feat1", "feat2", "feat3")
newData

prcomp(attitude)
summary(prcomp(attitude))

plot(prcomp(attitude))

biplot(prcomp(attitude))
