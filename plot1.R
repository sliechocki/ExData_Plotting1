library(tidyverse)
library(lubridate)

##Read file
getwd()
hhdt <- read_delim(file = "household_power_consumption.txt",col_names = T,
                   delim = ";",na = "?")
head(hhdt,n = 3)
hhdt$Date<-dmy(hhdt$Date)

date<-dmy(c("01-02-2007","02-02-2007"))

hhdt<-hhdt%>%
  filter(Date %in% date)

#Create plot 1
png(filename = "plot1.png",width = 480,height = 480,units = "px")

hist(hhdt$Global_active_power,main = "Global Active Power",
     col = "red",xlab = "Global Active Power (kilowatts)")
dev.off()






  

