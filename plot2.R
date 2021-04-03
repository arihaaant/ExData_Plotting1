givenDATA <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")

USEDdata <- subset(givenDATA, Date %in% c("1/2/2007","2/2/2007"))

USEDdata$Date <- as.Date(USEDdata$Date, format="%d/%m/%Y")

timeanddate <- paste(as.Date(USEDdata$Date), USEDdata$Time)

USEDdata$timeanddate <- as.POSIXct(timeanddate)

##code to make plot 2
with(USEDdata, {
  plot(Global_active_power~timeanddate, type="l", ylab="Global Active Power (kilowatts)", xlab="")
})

dev.copy(png, file="plot2.png", height=480, width=480)