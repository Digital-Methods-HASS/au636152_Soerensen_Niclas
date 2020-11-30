# Downloading and loading the packages 


library(tidyverse)
library(gganimate)
library(gapminder)



unique(gapminder$year)
head(gapminder)

#Plotting the contries 1952
theme_set(theme_bw()) #Setting a white theme 

ggplot(subset(gapminder, year == 1952), aes(gdpPercap, lifeExp, size = pop)) +
  geom_point() +
  scale_x_log10() 

#Q1: Why does it make sense to have a log10 scale on x axis? 
#Q1 answer: It makes sense considering the large mumbers in the dataset. 

#Q2: What country is the richest in 1952 (far right on x axis)? 
#Q2 answer: 
#After different trial and error, the following code works. The richest country in 1952 is Kuwait with a gdp of 108382.

gapminder %>%
  filter(year==1952) %>% 
  group_by(country, gdpPercap) %>% 
  arrange(desc(gdpPercap))


view(gapminder)
  
#Q3: Can you differentiate the continents by color and fix the axis labels?
#Q3 answer: 

#making a new plot with the date for the next question + adding the differentiation of the continents + fixing the labels to make more sense 
ggplot(subset(gapminder, year == 2007), aes(gdpPercap, lifeExp, color = continent,  size = pop)) +
  geom_point() +
  scale_x_log10() +
  labs ( x="GDP per capita ", y = "Life expectancy")

#Q4: What are the five richest countries in the world in 2007? 
#Q4 answer: The method is the same as question 2 and the result is the following:1. Norway, 2. Kuwait, 3. Singapore, 4. United States, 5. Ireland

gapminder %>%
  filter(year==2007) %>% 
  group_by(country, gdpPercap) %>% 
  arrange(desc(gdpPercap))

#Option 1: Animate using transition_states()  
#Answer: For some reason my gganimate did not work even after downloading and installing the packages. 
#I tried reopening the program, reloading the packages but nothing worked.
#The following errorcode is outputted in the console:file_renderer failed to copy frames to the destination directory 
#After reopening the program and loading the libraries, it worked (dont know why)

#Creating the object
anim <- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop)) +
  geom_point() +
  scale_x_log10() 

#Spiltting into years
anim + transition_states(year, 
                         transition_length = 1,
                         state_length = 1)
anim

#Option 2: Animate using transition_time()
#creating the object
anim2 <- ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop)) +
  geom_point() +
  scale_x_log10() + # convert x to log scale
  transition_time(year)
anim2

#This works fine 

#WQ5: Can you add a title to one or both of the animations above that will change in sync with the animation?
#Q5 answer: Frustration began to be too much here. Gave up on the rest. 

