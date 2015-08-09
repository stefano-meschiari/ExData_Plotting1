library(readr)
library(lubridate)

# Read in data filtered to by only keeping rows within dates
# [2007-02-01:2007-02-02]
data <- read_csv('filtered_data.csv')

# Convert date & time to datetime
date <- ymd_hms(paste(data$Date, data$Time))

png('plot2.png')
plot(date, data$Global_active_power, ylab="Global Active Power (kilowatts)",
     xlab=NA, type='l')
dev.off()

