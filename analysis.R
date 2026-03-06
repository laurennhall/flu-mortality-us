
library(dplyr)
library(ggplot2)

flu_deaths <- read.csv("data/flu-deaths.csv")

head(flu_deaths)
names(flu_deaths)

ggplot(data = flu_deaths, aes(x = State, y = Crude.Rate)) +
  geom_col()

highest_cmr <- flu_deaths %>%
  arrange(desc(Crude.Rate)) %>%
  head(5)

lowest_cmr <- flu_deaths %>% arrange(Crude.Rate) %>% head(5)

highestandlowest <- bind_rows(highest_cmr, lowest_cmr)

ggplot(data = highestandlowest, aes(x = reorder(State, Crude.Rate), y = Crude.Rate)) +
  geom_col(fill= "steelblue") +
  coord_flip() +
  labs(
    title = "Highest and Lowest Influenza Mortality Rates by State (2018 - 2023)",
    x = "State",
    y = "Crude Mortality Rate"
  )  +
  theme_minimal()
