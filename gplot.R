setwd("/Users/mateusz/Workspace/R/udemy")
getwd()

stats <- read.csv("DemographicData.csv")
stats
nrow(stats)
ncol(stats)
head(stats)
tail(stats)
levels(stats$Country.Name)

head(stats[stats$Country.Name == "Malta",])


library(ggplot2)
qplot(data=stats, x=Income.Group, y=Internet.users, size=I(3), colour=I("blue"))

qplot(data=stats, x=Income.Group, y=Internet.users, geom="boxplot")
 
qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(3))

qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(3), colour=I("red"))

qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(3), colour=Income.Group)

#--Creating dataframes
mydf <- data.frame(
  Countries_2012_Dataset, 
  Codes_2012_Dataset, 
  Regions_2012_Dataset
)

head(mydf)
 colnames(mydf) <- c("Country", "Code", "Region")

 
 rm(mydf)
 
 mydf <- data.frame(
   Country=Countries_2012_Dataset, 
   Code=Codes_2012_Dataset, 
   Region=Regions_2012_Dataset
 )
 
 summary(mydf)
 
 #---merge
 head(stats)
 head(mydf)
 
 merged <- merge(stats, mydf, by.x="Country.Code", by.y="Code")

merged$Country <- NULL
head(merged) 
str(merged) 


#---Visualize 

qplot(data=merged, x=Internet.users, y=Birth.rate, size=I(3), colour=Region)

#1. Shapes
qplot(
  data=merged, 
  x=Internet.users, 
  y=Birth.rate, 
  size=I(3), 
  colour=Region,
  shape=I(17)
)
 
#2. Transparency
qplot(
  data=merged, 
  x=Internet.users, 
  y=Birth.rate, 
  size=I(3), 
  colour=Region,
  alpha=I(0.5)
)

#3. Title
qplot(
  data=merged, 
  x=Internet.users, 
  y=Birth.rate, 
  size=I(3), 
  colour=Region,
  alpha=I(0.5),
  main="Title"
)

