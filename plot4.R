library(readr)
library(lubridate)

# Read in data filtered to by only keeping rows within dates
# [2007-02-01:2007-02-02]
data <- read_csv('filtered_data.csv')

# Convert date & time to datetime
date <- ymd_hms(paste(data$Date, data$Time))

png('plot4.png')
par(mfrow=c(2, 2))

# First subplot
plot(date, data$Global_active_power, type='l', ylab='Global Active Power')

# Second subplot
plot(date, data$Voltage, type='l', ylab='Voltage',
     xlab='datetime')

# Third subplot
meterings <- paste0('Sub_metering_', 1:3)
colors <- c('black', 'red', 'blue')

plot(date, data[[meterings[1]]], ylab="Energy sub metering",
     xlab=NA, type='n')

mapply(function(column, color) lines(date, data[[column]], col=color),
       meterings, colors)
legend('topright', legend=meterings, lwd=1, col=colors, bty='n')

# Fourth plot
plot(date, data$Global_reactive_power, type='l', ylab='Global_reactive_power',
     xlab='datetime')

dev.off()
par(mfrow=c(1, 1))
