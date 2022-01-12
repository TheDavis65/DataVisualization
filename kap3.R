pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes,
               ggvis,httr, lubridate, plotly, rio, rmarkdown, shiny,
               stringr, tidyr, caret, lars, tidyverse, psych, dygraphs,
               vioplot, gapminder, nycflights13, gapminder, Lahman, ISLR2,
               hms, feather, haven, readxl, DBI, jsonlite, xml2, lvplot 
)
library(scales)
library(gapminder)

# geom_point()
p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                         y = lifeExp))
p + geom_point()


# Smother
p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
p + geom_smooth()

# Smother + geom_point()
p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
p + geom_point() + geom_smooth()

# Smother + geom_point() +lm liner model
p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
p + geom_point() + geom_smooth(method = "lm")

# Smother + geom_point() + scale_x_log10()
p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
p + geom_point() + geom_smooth(method = "gam") + scale_x_log10()

# Smother + geom_point() + scale_x_log10() + lable() med lib sale for brug af $ tegn VIRKER IKKE
p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
p + geom_point() +
  geom_smooth(method = "gam") +
  scale_x_log10(lables = scales::dollar)

# Smother + geom_point() + scale_x_log10() + lable() 
p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp,
                          color = "red"))
p + geom_point() +
  geom_smooth(method = "loess") +
  scale_x_log10()


# Smother + geom_point() + scale_x_log10() + lable() 
p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp,
                          color = continent))
p + geom_point() +
  geom_smooth(method = "gam") +
  scale_x_log10()

# Smother + geom_point() + scale_x_log10() + lable() + color 
p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
p + geom_point(color = "purple") +
  geom_smooth(method = "loess") +
  scale_x_log10()

# Smother + geom_point() + scale_x_log10() + lable() + color + lm model 
p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
p + geom_point(alpha = 0.3) +
  geom_smooth(color = "orange", se = FALSE, size = 8, method = "lm") +
  scale_x_log10()

# Den ploerede version
p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
p + geom_point(alpha = 0.3) +
  geom_smooth(method = "gam") +
  scale_x_log10(labels = scales::dollar) + 
  labs(x = "GDP Per Capita", y = "Life Expectancy in Years",
title = "Economic Growth and Life Expectancy",
subtitle = "Data points are country-years",
caption = "Source: Gapminder.")


p <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y=lifeExp))
p + geom_point(alpha = 0.3) +
  geom_smooth(method = "gam") +
  scale_x_log10(labels = scales::dollar) +
  labs(x = "GDP Per Capita", y = "Life Expectancy in Years",
       title = "Economic Growth and Life Expectancy",
       subtitle = "Data points are country-years",
       caption = "Source: Gapminder.")

# med farver for nationer
#Figure 3.14: Mapping the continent variable to the color aesthetic.
p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp,
                          color = continent))
p + geom_point() +
  geom_smooth(method = "loess") +
  scale_x_log10()

# med farver for nationer med brug af fill = farver også usikkerhed Figure 3.15: Mapping the continent variable 
#to the color aesthetic, and correcting the error bars using the fill aesthetic.
p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp,
                          color = continent,
                          fill = continent))
p + geom_point() +
  geom_smooth(method = "loess") +
  scale_x_log10()

## Aesthetics can be mapped per geom
# her er gennemsnit med usikkerhed med lande stadig i farver

#Figure 3.16: Mapping aesthetics on a per-geom basis. Here color is mapped to continent 
#for the points but not the smoother.
p <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp))

p + geom_point(mapping = aes(color = continent)) +
  geom_smooth(method = "loess") + 
  scale_x_log10()

# med farve skalering
#Figure 3.17: Mapping a continuous variable to color.
#Figure 3.18: Guides and legends faithfully reflect the mappings they represent.
p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
p + geom_point(mapping = aes(color = log(pop))) +
  scale_x_log10()

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