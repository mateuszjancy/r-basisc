setwd("/Users/mateusz/Workspace/R/udemy/r_advanced")

util <- read.csv("Machine-Utilization.csv")
head(util, 18)
 str(util)
summary(util)

# Calculate utilization
# util[!is.na(util$Percent.Idle),"Percent.Idle"] <- 1.0 - util[!is.na(util$Percent.Idle),"Percent.Idle"]
util$Utilization <- 1 - util$Percent.Idle

# Handlimg DateTime in R
tail(util)
?POSIXct
util$PosixTime <- as.POSIXct(util$Timestamp, format="%d/%m/%Y %H:%M")

head(util, 10)
# How to rearrange cloumns
util$Timestamp <- NULL
util <- util[,c(4, 1, 2, 3)]
head(util)


# What is list
RL1 <- util[util$Machine=="RL1",]
summary(RL1)
RL1$Machine <- factor(RL1$Machine)
summary(RL1)

# Construct the list
# Character: Machine name
# Vector: (min, max, ...) utilization over month 
# Logical: Has utilization even fallen below 90% 
util_stats_rl1 <- c(min(RL1$Utilization, na.rm = TRUE),
                    mean(RL1$Utilization, na.rm = TRUE),
                    max(RL1$Utilization, na.rm = TRUE))

util_under_90_flag <- length(which (RL1$Utilization < 0.90)) > 0

list_rl1 = list("RL1", util_stats_rl1, util_under_90_flag)
list_rl1

# Name components in list
names(list_rl1) <- c("Machine", "Stats", "LowThreshold")
names(list_rl1)
list_rl1
# Another way of addin names
list_rl1 = list(Machine="RL1", Stats=util_stats_rl1, LowThreshold=util_under_90_flag)
list_rl1

# Extract components from a list
# [] extract componen
# [[]] extract element from component -> returns a vector
# $ the same as [[]]

list_rl1[1]
list_rl1[[1]]
list_rl1$Machine

list_rl1[2]
list_rl1$Stats[3]


# Add elements to list
list_rl1[4] <- "Some element"
list_rl1
# Add via $ data with utilization was unknown
list_rl1$UnknownUtilization <- RL1[is.na(RL1$Utilization), "PosixTime"]


# Remove elements from list

list_rl1[4] <- NULL
list_rl1
#Noticed!!! numeration has shifted

# Add dataframe 
list_rl1$Data <- RL1
list_rl1

summary(list_rl1)
list_rl1$UnknownUtilization[1]

# Subseting of list
list_rl1[c(1, 3)]
list_rl1[1:3]
list_rl1[c("Machine", "Stats")]

# Double squerbrqcakets are not for sub-seting 
list_rl1[[1:3]] #ERROR


# Building time series plot
library(ggplot2)
p <- ggplot(data=util)
myplot <- p + geom_line(aes(x=PosixTime, y=Utilization,
                  color=Machine), size=0.8) + 
  facet_grid(Machine~.) + 
  geom_hline(yintercept = 0.90, 
             color="gray", size=1.2, linetype=3)
  
list_rl1$Plot <- myplot

list_rl1


