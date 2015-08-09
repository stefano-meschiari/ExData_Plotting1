library(readr)

data <- read_csv('data.csv')

png('plot1.png')
hist(data$Global_active_power, xlab='Global Active Power',
     main='Global Active Power', col='red')
dev.off()

