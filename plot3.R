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
  filter(Date %in% date)
hhdt<-hhdt%>%mutate("datetime" = as.POSIXct(paste(hhdt$Date, hhdt$Time)))


#Create plot 3
png(filename = "plot3.png",width = 480,height = 480,units = "px")

plot(hhdt$Sub_metering_1~hhdt$datetime, type="l",xlab="",
     ylab="Energy sub metering")
points(hhdt$Sub_metering_2~hhdt$datetime, type="l", col="blue")
points(hhdt$Sub_metering_3~hhdt$datetime, type="l", col="red")
legend("topright",lty=1,col=c("gray","blue","red"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n")
dev.off()



