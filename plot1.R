Sys.setlocale("LC_TIME", "en_US.UTF-8")
library(lubridate)
data_num = read.csv('household_power_consumption.txt', sep = ';')
time_start = as.Date('2007-02-01','%Y-%m-%d')
time_stop = as.Date('2007-02-03', '%Y-%m-%d')
t = paste(data_num$Date, data_num$Time)
data_num$Datetime = dmy_hms(t)
data_num = data_num[data_num$Datetime <= time_stop & data_num$Datetime > time_start,]
data_num[,3:9] = apply(data_num[,3:9],2, function(x) as.numeric(x, na.rm=TRUE))

hist(data_num$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)',
     ylab = 'Frequency', main = "Global Active Power")
dev.copy(png, file = "plot1.png",width = 480, height = 480)
dev.off()
