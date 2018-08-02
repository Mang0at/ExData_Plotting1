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

## Create Plot 1 ##

datasub$datetime <- as.POSIXct(datasub$datetime)
attach(datasub)
plot(Global_active_power ~ datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

## Save .png file of Plot 2 ##

dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
detach(datasub)
