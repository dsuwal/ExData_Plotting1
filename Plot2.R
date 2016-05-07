#Set working directory
setwd("C:/WorkSpace/DataScience/4.ExploratoryDataAnalysis/Project/Assignment1")

#Reading and subsetting data
PCDataFile <- "../Data/household_power_consumption.txt"
PowerConsumData <- read.table(PCDataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
SubsetPowerConsumData <- PowerConsumData[PowerConsumData$Date %in% c("1/2/2007","2/2/2007") ,]
DateTime <- strptime(paste(SubsetPowerConsumData$Date, SubsetPowerConsumData$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(SubsetPowerConsumData$Global_active_power)

#Plotting graph
png("plot2.png", width=480, height=480)
plot(DateTime, GlobalActivePower, type = "l", xlab = "", ylab = "Global Active Power (kilo-Watts)")

#Closing graph device
dev.off()
