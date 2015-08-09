library(readr)
library(lubridate)

# Read in data filtered to by only keeping rows within dates
# [2007-02-01:2007-02-02]
data <- read_csv('filtered_data.csv')

# Convert date & time to datetime
date <- ymd_hms(paste(data$Date, data$Time))

png('plot3.png')
meterings <- paste0('Sub_metering_', 1:3)
colors <- c('black', 'red', 'blue')

plot(date, data[[meterings[1]]], ylab="Energy sub metering",
     xlab=NA, type='n')

mapply(function(column, color) lines(date, data[[column]], col=color),
       meterings, colors)
legend('topright', legend=meterings, lwd=1, col=colors)

dev.off()

