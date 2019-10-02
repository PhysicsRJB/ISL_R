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


