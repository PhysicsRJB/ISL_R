#Exercise 8
college = read.csv("College.csv", header = T)
fix(college)
rownames(college) = college[ , 1]
college = college[ , -1]
fix(college)

summary(college)
pairs(college[ , 1:10])

attach(college)
plot(as.factor(Private), Outstate, varwidth = T, col = "Red")

Elite = rep("No", nrow(college))
Elite[Top10perc>50] = "Yes"
Elite = as.factor(Elite)
college = data.frame(college, Elite)
summary(Elite)
par(mfrow = c(2, 2))
hist(PhD, col = 2, breaks = 30)
hist(Books, col = 3, breaks = 30)
hist(perc.alumni, col = 4, breaks = 30)
hist(S.F.Ratio, col = 5, breaks = 30)

#Exercise 9
Auto = read.csv("Auto.csv", header = T, na.strings = "?")
fix(Auto)
Auto = na.omit(Auto)
length(colnames(Auto))
for (i in seq(1,length(colnames(Auto)))){
  print(colnames(Auto)[i])
  print(range(Auto[, i]))
  }

summary(Auto)

summary(Auto[ -c(10:85), ])

pairs(Auto[ , -9])

cor(Auto[ , -9])
#to predict mpg, I'd use displacement, horsepower, displacement and weight, as they seem very corellated.
#Also, cylinders might be useful. These predictors show highest correlation

#Exercise 10
library(MASS)
Boston
?Boston
pairs(Boston)
cor(Boston)
#Crime per capita is correlated ith access to highways and property tax rate
#meaning there's more crime in rich neighbourhood with easy escape routes

for (i in seq(1,length(colnames(Boston)))){
  print(colnames(Boston)[i])
  print(range(Boston[, i]))
}

Boston[Boston$crim > 80, ]
Boston[Boston$tax > 700, ]
Boston[Boston$ptratio > 21.5, ]

dim(Boston[Boston$chas > 0, ])
#35 bound to river

summary(Boston)
#Median ptratio 19.05

min(Boston$medv)
Boston[Boston$medv == min(Boston$medv), ]

Boston[Boston$rm > 8, ]
#These suburbs have small crime rate and are mainly in Afro-American populated areas
