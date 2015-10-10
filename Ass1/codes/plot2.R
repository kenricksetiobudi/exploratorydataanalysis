#plot2.R

#load data
setwd("~/Documents/Dropbox/Education/Coursera/Decision Science/04 - Exploratory Data Analysis/")
source('Ass1/04_A1 Assignment 1.R')
if(!file.exists('Ass1/plots')) {
  dir.create('Ass1/plots')
}

#open PNG device / canvas
png(filename='Ass1/plots/plot2.png', width = 480, height = 480, units = 'px')

# create time series
plot(DateTime, GlobalActivePower, type = 'l', xlab='', ylab = 'Global Active Power (kilowatts)')
x<-dev.off()
