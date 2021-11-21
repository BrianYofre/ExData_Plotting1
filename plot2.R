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
as.numeric(dataplot$Global_active_power)
dataplot<-dataplot%>%
  mutate(datetime = dmy_hms(str_c(Date," " ,Time)))

png("plot2.png", width=480, height=480)
plot(dataplot$datetime,dataplot$Global_active_power, type="l", xlab="",
     ylab = "Global Active Power (kilowatts)")
dev.off()