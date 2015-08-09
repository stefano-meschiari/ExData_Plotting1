library(readr)

# Read in data filtered to by only keeping rows within dates
# [2007-02-01:2007-02-02]
data <- read_csv('filtered_data.csv')

png('plot1.png')
hist(data$Global_active_power, xlab='Global Active Power (kilowatts)',
     main='Global Active Power', col='red')
dev.off()

