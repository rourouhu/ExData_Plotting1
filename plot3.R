# Read dataset from folder
setwd("C:/Users/Laptop/Desktop/data scientist track/4. Exploratory data analysis/HW1")
power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?")
x <- paste(power$Date, power$Time)
DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
power$DateTime <- DateTime
power$Date <- as.Date(power$Date, format="%d/%m/%Y")


# Subset dataset to include only date 2/1/2007 and 2/2/2007
power1 <- subset(power,power$Date == "2007-02-01" | power$Date == "2007-02-02")

# Code for plot 3
png(filename = "plot3.png", height = 480, width = 480)
plot(power1$DateTime, power1$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(power1$DateTime, power1$Sub_metering_2, col="red")
lines(power1$DateTime, power1$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=1)
dev.off()