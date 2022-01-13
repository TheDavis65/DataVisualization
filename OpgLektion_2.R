pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes,
               ggvis,httr, lubridate, plotly, rio, rmarkdown, shiny,
               stringr, tidyr, caret, lars, tidyverse, psych, dygraphs,
               vioplot, gapminder, nycflights13, gapminder, Lahman, ISLR2,
               hms, feather, haven, readxl, DBI, jsonlite, xml2, lvplot 
)
library(scales)
library(gapminder)
library(ggplot2)
library(ggthemes)
library(ggrepel)
library(hrbrthemes)
library(readxl)
library(plotly)

biler

biler <- read_excel("data/passat.xlsx")
bilerMororSize <- filter(biler, motor_size > 1.5)
biler2014 <- filter(bilerMororSize, year >= 2014)


view(biler2014)

cols <- c("Privat" = "blue", "Forhandler" = "red")
biler <- read_excel("data/passat.xlsx") %>% 
filter(motor_size > 1.5) %>% 
   filter(year >= 2014)
car <- ggplot(data = biler, mapping = aes(x = km_per_liter, y = price, size = motor_size, colour = dealer_type)) +
  geom_point() +
  scale_color_manual(values = cols) +
  labs(x = "Km. Pr.Liter",
       y = "Pris",
       title = "Salg af VW Passat på bilbasen",
       subtitle = "Data fra bilbasen",
       caption = "kilde: bilbasen.dk") +
  theme(axis.title = element_text(size = 15),
        plot.title = element_text(size = 15 ),
        plot.subtitle = element_text(size = 10),
        plot.caption = element_text(size = 9),
        legend.title = element_blank())
  
car



view(biler)
biler

cols <- c("Privat" = "blue", "Forhandler" = "red")
biler <- read_excel("data/passat.xlsx") %>% 
  filter(motor_size > 1.5) %>% 
  filter(year >= 2014)
car2 <- ggplot(data = biler, mapping = aes(x = km_per_liter, y = price, size = motor_size, colour = dealer_type)) +
  geom_point() +
  scale_color_manual(values = cols) +
  labs(x = "Km. Pr.Liter",
       y = "Pris",
       title = "Salg af VW Passat på bilbasen",
       subtitle = "Data fra bilbasen",
       caption = "kilde: bilbasen.dk") +
  theme(axis.title = element_text(size = 15),
        plot.title = element_text(size = 15 ),
        plot.subtitle = element_text(size = 10),
        plot.caption = element_text(size = 9),
        legend.title = element_blank()) 

  car2 + geom_text_repel(aes(label = ifelse(motor_size>1.5 & year>2014, as.character(car),'')),
                          hjust = 0, vjust = 0,
                          size = 3,
                          colour = "black")

car2


## 3
cols <- c("Privat" = "blue", "Forhandler" = "red")
biler <- read_excel("data/passat.xlsx") %>% 
  filter(motor_size > 1.5) %>% 
  filter(year >= 2014)
theme_set(theme_minimal())

ggplot(biler, aes(x = km_per_liter, y = price, size = motor_size, colour = dealer_type)) +
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



## 4
plot2 <- ggplot(biler, aes(x = km_per_liter, y = price)) +
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

plot3 <- plot2 + geom_point(data = subset(biler, motor_size>1.5 & year>2014),
                            aes(x = km_per_liter, y = price))
plot3
plot4 <- plot3 + geom_text_repel(aes(label = ifelse(motor_size>1.5 & year>2014, as.character(car),'')),
                                 hjust = 0, vjust = 0,
                                 size = 3,
                                 colour = "black") 

plot4

plotly4 <- ggplotly(plot4)

plotly4
# CLEAN UP #################################################

# Clear environment
rm(list = ls()) 

# Clear packages
p_unload(all)  # Remove all add-ons
detach("package:datasets", unload = TRUE)  # For base

# Clear plots
dev.off()  # But only if there IS a plot

# Clear console
cat("\014")  # ctrl+L

# Clear mind :)