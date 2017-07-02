setwd("/Users/mateusz/Workspace/R/wbk")
hist <- read.csv("historia_2017-07-01_2490.csv")
str(hist)

#Util
expenses <- function (amount) {
  if (amount < 0) {
    amount * -1 
  }
  else {
    0
  }
}

income <- function (amount, account) {
  if (amount > 0 & account != "17 1090 1476 0000 0001 0859 8373") {
    amount 
  }
  else {
    0
  }
}

savings <- function (amount, account) {
  if (amount < 0 & account == "17 1090 1476 0000 0001 0859 8373") {
    amount * -1 
  }
  else {
    0
  }
}


#Num
hist$Amount <- as.numeric(gsub(",", ".", as.character(hist$Amount)))
hist$Balance <- as.numeric(gsub(",", ".", as.character(hist$Balance)))
hist$Expenses <- mapply(expenses, hist$Amount)
hist$Income <- mapply(income, hist$Amount, hist$RecipientAccount)
hist$Savings <- mapply(savings, hist$Amount, hist$RecipientAccount)

#Date
hist$PostingDate <- as.Date( as.character(hist$PostingDate), "%d-%m-%Y")
hist$ValueDate <- as.Date( as.character(hist$ValueDate), "%d-%m-%Y")
hist$YearMonthDate <- format(hist$PostingDate, "%Y-%m")

#Graphs Expenses
ggplot(data=hist, aes(x=YearMonthDate, y=Expenses)) +
  geom_bar(stat="identity")

#Graphs Income
ggplot(data=hist, aes(x=YearMonthDate, y=Income)) +
  geom_bar(stat="identity")

#Graphs Savings
ggplot(data=hist, aes(x=YearMonthDate, y=Savings)) +
  geom_bar(stat="identity")

