setwd("/Users/mateusz/Workspace/R/udemy")
movies <- read.csv("Movie-Ratings.csv")
head(movies)
tail(movies)
colnames(movies) <- c("Film", "Gerne", "CriticRating", "AudienceRating", "BudgetMilion", "Year")
str(movies)
summary(movies)
movies$Year <- factor(movies$Year)

#------Astetics
library(ggplot2)
ggplot(
  data=movies, 
  aes(x=CriticRating, y=AudienceRating)
)

# Add geom
ggplot(
  data=movies, 
  aes(x=CriticRating, y=AudienceRating)
) + geom_point()

# Add colour
ggplot(
  data=movies, 
  aes(
      x=CriticRating, 
      y=AudienceRating, 
      color=Gerne
    )
) + geom_point()


# Add size
ggplot(
  data=movies, 
  aes(
    x=CriticRating, 
    y=AudienceRating, 
    color=Gerne,
    size=BudgetMilion
  )
) + geom_point()

# Overriding ascetics

q <- ggplot(
  data=movies, 
  aes(
    x=CriticRating, 
    y=AudienceRating, 
    color=Gerne,
    size=BudgetMilion
  )
) 

## Add geom layer
q + geom_point(aes(size=CriticRating, x=BudgetMilion)) + xlab("Budget")

# Mapping vs setting
r <- ggplot(
  data=movies, 
  aes(
    x=CriticRating, 
    y=BudgetMilion
  )
)


# mapping
r + geom_point(aes(color=AudienceRating))

# Histogram and Density
s <- ggplot(
  data=movies, 
  aes(
    x=BudgetMilion
  )  
)

s + geom_histogram(binwidth = 10, aes(fill=Gerne), color="Black")

# 
t <- ggplot(
  data=movies,
  aes(x=AudienceRating)  
)

?geom_histogram
t + geom_histogram(
  binwidth = 2, 
  fill="White",
  color="Black"
)

# Trends
u <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Gerne))
u + geom_point() + geom_smooth(fill=NA)

# Boxplots
u <- ggplot(
  data=movies, 
  aes(
    x=Gerne,
    y=AudienceRating,
    colour=Gerne
  )
)

u + geom_boxplot(size=1.2) + geom_jitter() # moves around on x axies

u +  geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)# moves around on x axies

#Facets
#1) init
v <- ggplot(data=movies, aes(x=BudgetMilion))
v + geom_histogram(binwidth = 10, aes(fill=Gerne), colour="Black")
#2) Facrt
v + 
  geom_histogram(
    binwidth = 10, 
    aes(fill=Gerne), 
    colour="Black"
  ) + 
  facet_grid(Gerne~., scales="free")
  
#scatter plots
w <- ggplot(data=movies, aes(x=CriticRating, y=AudienceRating, color=Gerne))
w + geom_point(size=3) + facet_grid(.~Year)
w + geom_point(size=3) + facet_grid(Gerne~.)
w + geom_point(size=3) + facet_grid(Gerne~Year)
w + geom_point(aes(size=BudgetMilion)) + geom_smooth(fill=NA) + facet_grid(Gerne~Year)

#limits zoom
z <- ggplot(
  data=movies, 
  aes(
    x=CriticRating,
    y=AudienceRating,
    size=BudgetMilion,
    color=Gerne
  )  
)

z + geom_point() + xlim(50, 100) + ylim(50,100)

# instead zoom
ggplot(
  data=movies, 
  aes(
    x=CriticRating
  )
) + 
  geom_histogram(binwidth = 10, aes(fill=Gerne), colour="Black") + 
  coord_cartesian(ylim=c(0, 50))

w + 
  geom_point(aes(size=BudgetMilion)) + 
  geom_smooth(fill=NA) + 
  facet_grid(Gerne~Year) + 
  coord_cartesian(ylim=c(0, 100))

# Theme
n <- ggplot(data=movies, aes(x=BudgetMilion))
n + 
  geom_histogram(binwidth = 10, aes(fill=Gerne), color="Black") + 
  xlab("Money") + 
  ylab("NumOfMovies") +
  ggtitle("Movies dist.") + 
  theme(
    axis.title.x = element_text(colour = "Red"), 
    axis.title.y = element_text(colour = "Blue"),
    axis.text.x = element_text(size = 20),
    axis.text.y = element_text(size = 20),
    #Legend
    legend.title = element_text(size = 20),
    legend.text = element_text(size = 10),
    legend.position = c(1, 1),
    legend.justification = c(1, 1),
    
    #Title
    plot.title = element_text(size = 40, colour = "Blue")
  )

?theme
