# Assignment 1
#data source can be changed
library(dplyr)
setwd("~/Documents/Dropbox/Education/Coursera/Decision Science/04 - Exploratory Data Analysis/")

if (!file.exists('Ass1')){
  dir.create('Ass1')
}

  #download the data
  fileUrl<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
  download.file(fileUrl,destfile='Ass1/power_consumption.zip', method = 'curl')
  unzip('Ass1/power_consumption.zip',exdir='Ass1',overwrite=T)
 
#load the data into R
colClass <- c(rep('character',2), rep('numeric',7))
dataset <- read.table('Ass1/household_power_consumption.txt', header = TRUE, sep = ";", na.strings = "?",colClasses = colClass)
colnames(dataset) <- c('Date', 'Time', 'GlobalActivePower', 'GlobalReactivePower','Voltage','GlobalIntensity','SubMetering1','SubMetering2','SubMetering3')
dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

#filter & transform dataset
dataset <- filter(dataset, Date == "2007-02-01" | Date == "2007-02-02")
dataset <- transform(dataset, DateTime = as.POSIXct(paste(Date,Time)), "%d/%m/%Y %H:%M:%S")
dataset <- select(dataset, DateTime, GlobalActivePower:SubMetering3)

attach(dataset)
