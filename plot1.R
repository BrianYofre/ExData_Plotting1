setwd("~/Coursera 2021/ExData_Plotting1")

furl<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

if (!file.exists("./data.zip")) {
  download.file(furl, destfile = "./data.zip")
  unzip(zipfile = "./data.zip")
}
library(ggplot2)
library(tidyverse)

data<- read.delim("household_power_consumption.txt", sep = ";" )
as.Date(data$Date, "%d/%m/%Y")
dataplot<-filter(data, Date %in% c("1/2/2007", "2/2/2007"))

png("plot1.png", width=480, height=480)
hist(as.numeric(dataplot$Global_active_power), col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)", 
     ylim = c(0,1200), xlim =c(0,6), breaks = 12)
dev.off()

