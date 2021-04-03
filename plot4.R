givenDATA <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                      nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')

USEDdata <- subset(givenDATA, Date %in% c("1/2/2007","2/2/2007"))

USEDdata$Date <- as.Date(USEDdata$Date, format="%d/%m/%Y")

timeanddate <- paste(as.Date(USEDdata$Date), USEDdata$Time)

USEDdata$timeanddate <- as.POSIXct(timeanddate)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(USEDdata, {
  plot(Global_active_power~timeanddate, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~timeanddate, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~timeanddate, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~timeanddate,col='Red')
  lines(Sub_metering_3~timeanddate,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~timeanddate, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

dev.copy(png, file="plot4.png", height=480, width=480)