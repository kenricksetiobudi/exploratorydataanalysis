#plot4.R

#load data
setwd("~/Documents/Dropbox/Education/Coursera/Decision Science/04 - Exploratory Data Analysis/")
source('Ass1/04_A1 Assignment 1.R')
if(!file.exists('Ass1/plots')) {
  dir.create('Ass1/plots')
}

#open PNG device / canvas
png(filename='Ass1/plots/plot4.png', width = 480, height = 480, units = 'px')

# create the charts
par(mfrow=c(2,2))

# 1st plot
plot(DateTime, GlobalActivePower, type = 'l', xlab='', ylab = 'Global Active Power (kilowatts)')

# 2nd plot
plot(DateTime, Voltage, type = 'l', xlab = 'datetime')

# 3rd plot
plot(DateTime, SubMetering1, type = 'l', xlab='', ylab = 'Energy sub metering')
lines(DateTime, SubMetering2, type = 'l', col = 'red')
lines(DateTime, SubMetering3, type = 'l', col = 'blue')
legend("topright", legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), bty = 'n', col = c('black', 'red','blue'), lty = 'solid')

#4th plot
plot(DateTime, GlobalReactivePower, type='l', xlab = 'datetime', ylab= 'Global_reactive_power')
x<- dev.off()