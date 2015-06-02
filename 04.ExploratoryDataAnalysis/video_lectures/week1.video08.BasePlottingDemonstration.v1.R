## Base Plotting Demonstration

x <- rnorm(100)
hist(x)

x <- rnorm(100)
y <- rnorm(100)
plot(x, y)

par(mar=c(2,2,2,2))

plot(x, y)
par(mar=c(4,4,2,2))

plot(x, y)
plot(x, y, pch=20)
plot(x, y, pch=19)
plot(x, y, pch=2)
plot(x, y, pch=3)
plot(x, y, pch=4)
example(points)
## Note: 21-25 are similar as the previous ones except that you can 
##       specified both the boundary colour using the col argument 
##       and the filling colour using the bg argument

x <- rnorm(100)
y <- rnorm(100)
plot(x, y, pch=20)
title("Scatterplot")
text(-2, -2, "label")
legend("topleft", legend="Data", pch=20)
fit <- lm(y~x)
abline(fit)
abline(fit, lwd=3)
abline(fit, lwd=3, col="blue")
plot(x, y, xlab="Weight", ylab="Height", main="Scatterplot", pch=20)
legend("topright", legend="Data", pch=20)
fit <- lm(y~x)
abline(fit, lwd=3, col="red")

z <- rpois(100,2)
par(mfrow=c(2,1))
plot(x, y, pch=20)
plot(x, z, pch=19)
par("mar")
par(mar=c(2,2,1,1))
plot(x, y, pch=20)
plot(x, z, pch=20)

par(mfrow=c(1,2))
plot(x, y, pch=20)
plot(x, z, pch=20)
par(mar=c(4,4,2,2))
plot(x, y, pch=20)
plot(x, z, pch=20)

## Add plots in the following order, (1,1), (1,2), (2,1), (2,2)
par(mfrow=c(2,2))
plot(x, y)
plot(x, z)
plot(z, x)
plot(y, x)

## Add plots in the following order, (1,1), (2,1), (1,2), (2,2)
par(mfcol=c(2,2))
plot(x, y)
plot(x, z)
plot(z, x)
plot(y, x)

par(mfcol=c(1,1))
x <- rnorm(100)
y <- x+rnorm(100)
g <- gl(2, 50)
g <- gl(2, 50, labels=c("Male", "Female"))
str(g)
plot(x, y)
## To generate a plot and add colour to "Male" and "Female" group data differently 
## The idea is to generate a plot but not plot anything first. Then add the "Male"
## data and colour it. Then add the "Female" data and colour it differently.
par(mfrow=c(2,1))
plot(x, y, type="n") # type="n": don't put any data in the plot but set up everything
points(x[g=="Male"], y[g=="Male"], col="green")
points(x[g=="Female"], y[g=="Female"], col="blue", pch=19)


