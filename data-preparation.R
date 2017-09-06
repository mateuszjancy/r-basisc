setwd("/Users/mateusz/Workspace/R/udemy/r_advanced")
getwd()

#basic 
# fin <- read.csv("Future-500.csv")

#NA instead blank string 
fin <- read.csv("Future-500.csv", na.strings = c(""))

str(fin)
fin$Inception <- factor(fin$Inception)
fin$ID <- factor(fin$ID)


ggplot(data=fin, aes(x=Industry, y=Profit)) + 
  geom_point(aes(size=Employees))
summary(fin)

# Factore Value Trap
## from characters
a <- c("1", "2", "3", "3")
typeof(a)
b <- as.numeric(a)
b

## From factor
z <- factor(c("3", "2", "3", "3"))
z
y <- as.numeric(z)
y
# it pick factorizarion y == str(z)
x <- as.numeric(as.character(z))
x

#FVP example
##sub gsub
fin$Expenses <- gsub(" Dollars", "", fin$Expenses)
fin$Expenses <- gsub(",", "", fin$Expenses)
fin$Expenses <- as.numeric(fin$Expenses)
head(fin)

fin$Revenue <- gsub("\\$", "", fin$Revenue)
fin$Revenue <- gsub(",", "", fin$Revenue)
fin$Revenue <- as.numeric(fin$Revenue)

head(fin)
fin$Growth <- gsub("%", "", fin$Growth)
fin$Growth <- as.numeric(fin$Growth)

head(fin)
str(fin)

# NA
NA == FALSE
NA == TRUE
NA == NA

# Localing missing data, Filtering for NA
# Updated import to fin <- read.csv("Future-500.csv", na.strings = c(""))
head(fin, 24)
complete.cases(fin)
fin[!complete.cases(fin), ]

# Filtering 
fin[fin$Revenue == 9746272,] # multiple filter problem, NA included
fin[which(fin$Revenue == 9746272), ] # exclude NA

# Filtering for NA
fin[is.na(fin$Revenue), ]

# Remove missing values
fin_backup <- fin
fin <- fin[!is.na(fin$Industry), ] #oposite of NA
fin

# Reseting df index
rownames(fin)
