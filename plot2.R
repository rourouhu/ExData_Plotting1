# Read dataset from folder
setwd("C:/Users/Laptop/Desktop/data scientist track/4. Exploratory data analysis/HW1")
power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
x <- paste(power$Date, power$Time)
DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
power$DateTime <- DateTime
power$Date <- as.Date(power$Date, format="%d/%m/%Y")


# Subset dataset to include only date 2/1/2007 and 2/2/2007
power1 <- subset(power,power$Date == "2007-02-01" | power$Date == "2007-02-02")

# Code for plot 2
png(filename = "plot2.png", height = 480, with = 480)
plot(y=power1$Global_active_power, x=power1$DateTime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()