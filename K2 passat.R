#Load packages we need
library(ggplot2)
library(ggthemes)
library(ggrepel)
library(hrbrthemes)
library(readxl)
library(plotly)

theme_set(theme_minimal())

options(scipen = 999)

#Change name of dataset
vwpas <- passat

#Plot the data
ggplot(vwpas, aes(x = km_per_liter, y = price)) +
  geom_point()

#Add size of engine 
ggplot(vwpas, aes(x = km_per_liter, y = price, size = motor_size)) +
  geom_point()


cols <- c("Privat" = "blue", "Forhandler" = "red")

#Edit axis
ggplot(vwpas, aes(x = km_per_liter, y = price, size = motor_size, colour = dealer_type)) +
  geom_point() +
  scale_colour_manual(values = cols)

#Adjust labels and theme
plot1 <- ggplot(vwpas, aes(x = km_per_liter, y = price, size = motor_size, colour = dealer_type)) +
  geom_point() +
  scale_colour_manual(values = cols) +
  labs(x = "Kilometers per liter",
       y = "Price of the car",
       title = "VW Passat's for sale on bilbasen",
       subtitle = "Data-set from Big Data class",
       caption = "Source = bilbasen.dk") +
  theme(legend.position = "bottom",
        axis.title = element_text(size =15),
        plot.title = element_text(size = 15),
        plot.subtitle = element_text(size = 10),
        plot.caption = element_text(size = 8),
        legend.title = element_blank())

plot1

plot1 + geom_text_repel(aes(label = ifelse(motor_size>1.5 & year>2014, as.character(car),'')),
                        hjust = 0, vjust = 0,
                        size = 3,
                        colour = "black")


  #Try a new theme
theme_set(theme_minimal())

ggplot(vwpas, aes(x = km_per_liter, y = price, size = motor_size, colour = dealer_type)) +
  geom_point() +
  scale_colour_manual(values = cols) +
  labs(x = "Kilometers per liter",
       y = "Price of the car",
       title = "VW Passat's for sale on bilbasen",
       subtitle = "Data-set from Big Data class",
       caption = "Source = bilbasen.dk") +
  theme(legend.position = "bottom",
        axis.title = element_text(size =15),
        plot.title = element_text(size = 15),
        plot.subtitle = element_text(size = 10),
        plot.caption = element_text(size = 8),
        legend.title = element_blank()) +
  geom_text_repel(aes(label = ifelse(motor_size>1.5 & year>2014,as.character(car),'')),
                  hjust = 0, vjust = 0,
                  size = 3,
                  colour = "black")

#Plot gr? punkter
plot2 <- ggplot(vwpas, aes(x = km_per_liter, y = price)) +
  geom_point(color = "grey70", alpha = 0.5) +
  labs(x = "Kilometers per liter",
       y = "Price of the car",
       title = "VW Passat's for sale on bilbasen",
       subtitle = "Data-set from Datavisualization class",
       caption = "Source = bilbasen.dk") +
  theme(legend.position = "bottom",
        axis.title = element_text(size =15),
        plot.title = element_text(size = 15),
        plot.subtitle = element_text(size = 10),
        plot.caption = element_text(size = 8),
        legend.title = element_blank())

plot2  

#Highlight points
plot3 <- plot2 + geom_point(data = subset(vwpas, motor_size>1.5 & year>2014),
                            aes(x = km_per_liter, y = price))
plot3

#Add text
plot4 <- plot3 + geom_text_repel(aes(label = ifelse(motor_size>1.5 & year>2014, as.character(car),'')),
                  hjust = 0, vjust = 0,
                  size = 3,
                  colour = "black") 

plot4

plotly4 <- ggplotly(plot4)

plotly4
