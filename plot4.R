setwd("~/Coursera 2021/ExData_Plotting1")

furl<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

if (!file.exists("./data.zip")) {
  download.file(furl, destfile = "./data.zip")
  unzip(zipfile = "./data.zip")
}
library(ggplot2)
library(tidyverse)
library(dplyr)
library(lubridate)
Sys.setlocale("LC_TIME", "english_united states.1252")
data<- read.delim("household_power_consumption.txt", sep = ";" )
as.Date(data$Date, "%d/%m/%Y")
dataplot<-as.data.frame(filter(data, Date %in% c("1/2/2007", "2/2/2007")))
dataplot<-dataplot%>%
  mutate(datetime = dmy_hms(str_c(Date," " ,Time)))
as.numeric(dataplot$Global_active_power)
as.numeric(dataplot$Sub_metering_1)
as.numeric(dataplot$Sub_metering_2)
as.numeric(dataplot$Sub_metering_3)
as.numeric(dataplot$Voltage)

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(dataplot$datetime,dataplot$Global_active_power, type="l", xlab="",
     ylab = "Global Active Power")
plot(dataplot$datetime,dataplot$Voltage, type="l", xlab="datetime",
     ylab = "Voltage")
plot(dataplot$datetime,dataplot$Sub_metering_1, type="l", xlab="",
     ylab = "Energy Submetering")
lines(dataplot$datetime, dataplot$Sub_metering_2, type ="l", col= "red")
lines(dataplot$datetime, dataplot$Sub_metering_3, type ="l", col= "blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
plot(dataplot$datetime,dataplot$Global_reactive_power, type="l", xlab="datetime",
     ylab = "Global_reactive_power")
dev.off()