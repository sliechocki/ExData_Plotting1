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

#Create plot 4
png(filename = "plot4.png",width = 480,height = 480,units = "px")

par(mfrow= c(2,2),mar=c(2.5,5,2,1))

plot(hhdt$Global_active_power~hhdt$datetime,hhdt,type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab="")

plot(hhdt$Voltage~hhdt$datetime,hhdt,type = "l",
     ylab = "Voltage",
     xlab="")

plot(hhdt$Sub_metering_1~hhdt$datetime, type="l",xlab="",
     ylab="Energy sub metering")
points(hhdt$Sub_metering_2~hhdt$datetime, type="l", col="blue")
points(hhdt$Sub_metering_3~hhdt$datetime, type="l", col="red")
legend("topright",lty=1,col=c("gray","blue","red"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n",
       cex = 1)

plot(hhdt$Global_reactive_power~hhdt$datetime,hhdt,type = "l",
     ylab = "Global_reactive_power",
     xlab="")
dev.off()
