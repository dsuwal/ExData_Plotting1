#Set working directory
setwd("C:/WorkSpace/DataScience/4.ExploratoryDataAnalysis/Project/Assignment1")

#Reading and subsetting data
PCDataFile <- "../Data/household_power_consumption.txt"
PowerConsumData <- read.table(PCDataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
SubsetPowerConsumData <- PowerConsumData[PowerConsumData$Date %in% c("1/2/2007","2/2/2007") ,]
DateTime <- strptime(paste(SubsetPowerConsumData$Date, SubsetPowerConsumData$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(SubsetPowerConsumData$Global_active_power)
GlobalReactivePower <- as.numeric(SubsetPowerConsumData$Global_reactive_power)

#Plotting Graph
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(DateTime, GlobalActivePower, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)
plot(DateTime, as.numeric(SubsetPowerConsumData$Voltage), type = "l", xlab = "datetime", ylab = "Voltage")
plot(DateTime, SubsetPowerConsumData$Sub_metering_1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(DateTime, SubsetPowerConsumData$Sub_metering_2, type = "l", col = "red")
lines(DateTime, SubsetPowerConsumData$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty =, lwd = 2.5, col = c("black", "red", "blue"), bty = "o")
plot(DateTime, GlobalReactivePower, type = "l", xlab = "datetime", ylab = "Global_Reactive_Power")

#Closing graph device.
dev.off()

