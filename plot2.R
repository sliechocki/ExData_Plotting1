library(tidyverse)
library(lubridate)

##Read file
getwd()
hh <- read_delim(file = "household_power_consumption.txt",col_names = T,
                   delim = ";",na = "?")
head(hh,n = 3)
hh$Date<-dmy(hh$Date)

date<-dmy(c("01-02-2007","02-02-2007"))

hhdt<-hh%>%
  filter(Date %in% date)%>%
mutate("datetime" = as.POSIXct(paste(hhdt$Date, hhdt$Time)))

#Create plot 2
png(filename = "plot2.png",width = 480,height = 480,units = "px")

plot(hhdt$Global_active_power~hhdt$datetime,hhdt,type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab="")
dev.off()
