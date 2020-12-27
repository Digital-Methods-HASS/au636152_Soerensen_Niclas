#Imports 
library(tidyverse)
library(gganimate)

#Creating an object of all the males in the dataset
men <- subset(Parish_book_Sonderborg, Male=="Y")

#Filtering out the men who died before and after 28. juli 1914 and returning their ages
menPre <- subset(men, Day_of_death<'1914-07-28 00:00:00', c(Age))
menDuring <- subset(men, Day_of_death>'1914-07-28 00:00:00', c(Age))

#Calculate average ages 
avgMenPre <- colMeans(menPre, na.rm = TRUE)
avgMenDuring <- colMeans(menDuring, na.rm = TRUE)


#Calculating total number of deaths pre 28. juli 1914. 
nrOfMenPre <- nrow(menPre)
totalDeathPre <- nrow(subset(Parish_book_Sonderborg,Day_of_death<'1914-07-28 00:00:00'))

#Calculating the percentage of male death of pre 28. juli 1914
percentMenPre<- (nrOfMenPre/totalDeathPre)*100

#Calculating total number of deaths post 28. juli 1914
nrOfMenDuring <- nrow(menDuring)
totalDeathDuring <- nrow(subset(Parish_book_Sonderborg,Day_of_death>'1914-07-28 00:00:00'))
percentMenDuring <- (nrOfMenDuring/totalDeathDuring)*100

#Calculating child mortality rate pre and during 28. juli 1914
nrOfDeadChildrenPre <- nrow(subset(menPre, Age<15))
nrOfDeadChildrenDuring <- nrow(subset(menDuring, Age<15))

(nrOfDeadChildrenPre/nrOfMenPre)*100
(nrOfDeadChildrenDuring/nrOfMenDuring)*100

#Plotting the average age chart
plotDataAvg <- data.frame(
  average_age_of_males_pre_and_during_ww1=c("Average age of males pre ww1","Average age of males during ww1"),
  age_in_numbers=c(38.4,43.1)
  )
chartAvgAge<-ggplot(data=plotDataAvg, aes(x=average_age_of_males_pre_and_during_ww1, y=age_in_numbers)) +
  geom_bar(stat="identity")+
  labs(title="Average age of males")
chartAvgAge

#plotting the number of dead males chart
plotDataNrDead <- data.frame(
  number_of_dead_males_pre_and_during_ww1=c("Number of death pre ww1","Number of death during ww1"),
  total_number_of_death=c(155,149)
)
chartNrDead <- ggplot(data=plotDataNrDead, aes(x=number_of_dead_males_pre_and_during_ww1, y=total_number_of_death))+
  geom_bar(stat = "identity")+
labs(title = "Number of male death")
chartNrDead

#plotting the percentage of male death chart
plotDataPercentDead <- data.frame(
  percentage_of_male_death_pre_and_during_ww1=c("Percentage of men dead pre ww1","Percentage of men dead during ww1"),
  total_percentage_of_death=c(50.2,57.8)
)
chartPercentDead <- ggplot(data=plotDataPercentDead, aes(x=percentage_of_male_death_pre_and_during_ww1, y=total_percentage_of_death))+
  geom_bar(stat = "identity")+
  labs(title ="Percentage of male death")
chartPercentDead
