## Set working directory then import data set##

setwd("C:/Users/skinl/Documents/Coursera/Exploratory Data Analysis")
datafile <- "household_power_consumption.txt"
data <-read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Convert the date variable to Date class ##

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Subset the data  to aplicable date ranges ##

datasub <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Convert dates and times ##

datasub$datetime <- strptime(paste(datasub$Date, datasub$Time), "%Y-%m-%d %H:%M:%S")

## Create Plot 4 ##

datasub$datetime <- as.POSIXct(datasub$datetime)
par(mfrow = c(2, 2))
attach(datasub)
plot(Global_active_power ~ datetime, type = "l", ylab = "Global Active Power", 
     xlab = "")
plot(Voltage ~ datetime, type = "l")
plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", 
     xlab = "")
lines(Sub_metering_2 ~ datetime, col = "Red")
lines(Sub_metering_3 ~ datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

plot(Global_reactive_power ~ datetime, type = "l")

## Save .png file of Plot 4 ##

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
detach(datasub)
