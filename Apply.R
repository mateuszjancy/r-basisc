setwd("./Workspace/R/udemy/r_advanced/Weather Data/")

#Read 
Chicago <- read.csv("Chicago-F.csv", row.names = 1)
NewYork <- read.csv("NewYork-F.csv", row.names = 1)
Houston <- read.csv("Houston-F.csv", row.names = 1)
SanFrancisco <- read.csv("SanFrancisco-C.csv", row.names = 1)

#Convert to matrix
Chicago <- as.matrix(Chicago)
NewYork <- as.matrix(NewYork)
Houston <- as.matrix(Houston)
SanFrancisco <- as.matrix(SanFrancisco)

#Put to list
Wather <- list(Chicago=Chicago, NewYork=NewYork, Houston=Houston, SanFrancisco=SanFrancisco)
Wather

# AVG 
?apply
apply(Chicago, 1, mean) # Row
apply(Chicago, 2, max) # Columns

# lapply for list or vectors
lapply(Wather, t)
lapply(Wather, rbind, NewRow=1:12) # second ano another parameters
lapply(Wather, rowMeans)

# Filtering
Wather$Chicago[1, 1] 
lapply(Wather, "[", 1, 1)
lapply(Wather, "[", 1,)
lapply(Wather, "[", , 3)

# Adding own functions
lapply(Wather, function(x, n){x[n,]}, 1)
lapply(Wather, function(z) z[1,] - z[2,])
lapply(Wather, function(z) round((z[1,] - z[2,])/z[2,], 2))

# sapply
lapply(Wather, "[", 1, 7)
sapply(Wather, "[", 1, 7)

lapply(Wather, "[", 1, c(10,11,12))
sapply(Wather, "[", 1, c(10,11,12))

lapply(Wather, rowMeans)
round(sapply(Wather, rowMeans), 2)

lapply(Wather, function(z) round((z[1,] - z[2,])/z[2,], 2))
sapply(Wather, function(z) round((z[1,] - z[2,])/z[2,], 2))

# Nesting apply function
sapply(Wather, rowMeans)
apply(Chicago, 1, max)
lapply(Wather, apply, 1, max)
sapply(Wather, apply, 1, max)
sapply(Wather, function(x)apply(x, 1, max))


?which.max
Chicago[1,]
names(which.max(Chicago[1,]))

apply(Chicago, 1, function(x) names(which.max(x)))

sapply(Wather, function(y)apply(y, 1, function(x) names(which.max(x))))



