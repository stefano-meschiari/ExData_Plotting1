# Reduce size of dataset by only keeping rows within dates
# [2007-02-01:2007-02-02]

# Looks like I hit a bug in dplyr, so I did the manipulation manually (gross!)
library(readr)
#library(dplyr)
library(lubridate)

data <- read_delim('household_power_consumption.txt', delim=';')
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)

data <- data[data$Date >= ymd("2007-02-01") & data$Date <= ymd("2007-02-02"), ]

data$Date <- as.character(data$Date)
data$Time <- sprintf("%s:%s:%s", hour(data$Time), minute(data$Time),
                    second(data$Time))

write.csv(file='filtered_data.csv', data)
