## Set working directory then import data set##

setwd("C:/Users/skinl/Documents/Coursera/Exploratory Data Analysis")
datafile <- "household_power_consumption.txt"
data <-read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Convert the date variable to Date class ##

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

## Subset the data  to aplicable date ranges ##

datasub <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## Create Plot 1 ##

attach(datasub)
globalActivePower <- as.numeric(datasub$Global_active_power)
hist(globalActivePower, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")

## Save .png file of PLot 1 ##

dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
detach(datasub)
