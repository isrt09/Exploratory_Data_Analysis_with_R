# Load Packages
library(tidyverse)
library(ggplot2)

# Load Dataset
coal <- read_csv("coal.csv")

# Omit First Rows from dataset
coal <- read_csv("coal.csv", skip = 2)

# Display Dataset Data Stucture
glimpse(coal)

# Descriptive statistics dataset
summary(coal)

# Data Transformation : Wide to Longer version
coal.long <- gather(coal, "Year", "Coal Consumption", -Region)
coal.long

# Descriptive statistics dataset
summary(coal.long)

# Data Conversion : String to Integer
coal.long$Year <- as.integer(coal.long$Year)
coal.long$`Coal Consumption` <- as.integer(coal.long$`Coal Consumption`)

# Display Region Data
coal.long$Region
unique(coal.long$Region)

# Define Country Regions
non_country <- c("North America", "Central & South America", "Antarctica", "Eurasia",  "Africa", "Europe", "Asia & Oceania","Middle East", "World")

# Match data
match(coal.long$Region, non_country)

is.na(match(coal.long$Region, non_country))

!is.na(match(coal.long$Region, non_country))

which(!is.na(match(coal.long$Region, non_country)))

matches <- which(!is.na(match(coal.long$Region, non_country)))

# create a tibble of country values
coal.county <- coal.long[-matches,]

# create a tibble of region values
coal.region <- coal.long[matches,]

# check them out
coal.county$Region
unique(coal.county$Region)
unique(coal.region$Region)

# visualization on dataset
ggplot(data = coal.region, mapping = aes(x = Year, y = `Coal Consumption`)) +
  geom_point()

ggplot(data = coal.region, mapping = aes(x = Year, y = `Coal Consumption`)) +
  geom_line(mapping = aes(color = Region ))
  
# Clear data in work history
rm(list = ls())

# Clear console
cat("\014")   

# Clear graphics
graphics.off()


