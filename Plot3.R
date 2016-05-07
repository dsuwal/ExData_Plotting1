#Set working directory
setwd("C:/WorkSpace/DataScience/4.ExploratoryDataAnalysis/Project/Assignment1")

#Reading and subsetting data
PCDataFile <- "../Data/household_power_consumption.txt"
PowerConsumData <- read.table(PCDataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
SubsetPowerConsumData <- PowerConsumData[PowerConsumData$Date %in% c("1/2/2007","2/2/2007") ,]
DateTime <- strptime(paste(SubsetPowerConsumData$Date, SubsetPowerConsumData$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(SubsetPowerConsumData$Global_active_power)

#Plotting graph
png("plot3.png", width=480, height=480)
plot(DateTime, as.numeric(SubsetPowerConsumData$Sub_metering_1), type = "l", ylab = "Energy Submetering", xlab = "")
lines(DateTime, as.numeric(SubsetPowerConsumData$Sub_metering_2), type = "l", col = "red")
lines(DateTime, as.numeric(SubsetPowerConsumData$Sub_metering_3), type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))

#Closing graph device
dev.off()

