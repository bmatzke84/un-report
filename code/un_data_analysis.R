library(tidyverse)

gapminder_data <- read_csv("data/gapminder_data.csv")
View(gapminder_data)

summarize(gapminder_data, averageLifeExp = mean(lifeExp))

# piping function: %>%
gapminder_data %>% summarize(averageLifeExp = mean(lifeExp))

# Exercise: find the mean population of the gapminder dataset
gapminder_data %>% summarize(averagePopulation = mean(pop), recent_year = max(year))

#filter rows where year is 2007
gapminder_data %>% filter(year == 2007) %>% summarize(averageLifeExp = mean(lifeExp))

# Exercise: find the average GDP per capita for the first year in the dataset
gapminder_data %>% summarize(first_year = min(year)) #1952
gapminder_data %>% 
  filter(year == 1952) %>% 
  summarize(averageGDP_Percap = mean(gdpPercap), first_year = min(year))

# we can use : >, <, >=, <=

# group by
gapminder_data %>%
  group_by(year) %>%
  summarize(averageLifeExp = mean(lifeExp))

# Exercise: find the mean life expectancy for each continent
gapminder_data %>%
  group_by(continent) %>%
  summarize(averageLifeExp = mean(lifeExp))

# mutate - add more columns to your dataset
gapminder_data %>%
  mutate(gdp = gdpPercap * pop)

# Exercise: make a new column using mutate() that is population in millions
gapminder_data %>%
  mutate(popInMil = pop / 1000000)

# select() - specify which columns we want to keep
gapminder_data %>%
  select(year, pop)

#drop the continent column
gapminder_data %>%
  select(-continent)

# save transformed data into a new object
yearPop <- gapminder_data %>%
  select(year, pop)

# Exercise: create a dataset with the country, continent, year, and lifeExp columns
gapminder_data %>%
  select(country, continent, year, lifeExp)

gapminder_data %>%
  select(-pop, - gdpPercap)

# arrange(year) - arrange rows

# long vs. wide
# pivot_longer and pivot_wider
gapminder_data %>%
  pivot_wider(names_from = year, values_from = lifeExp)
# got a bunch of NA cells because we have columns getting in the way creating new rows
# need a smaller dataset before piping into the pivot_wide
gapminder_data %>%
  select(country, continent, year, lifeExp) %>%
  pivot_wider(names_from = year, values_from = lifeExp)

# rename() - rename columns

# create a new dataset with only data from the Americas and 2007
# drop the continent and year columns
gapminder_Americas_2007 <- gapminder_data %>%
  filter(year == 2007, continent == "Americas") %>%
  select(-continent, -year)

gapminder_Americas_2007 <- read_csv("data/gapminder_data.csv") %>%
  filter(year == 2007, continent == "Americas") %>%
  select(-continent, -year)

view(gapminder_data)

