sourceData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetData <- sourceData[sourceData$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subsetData$Global_active_power)
globalReactivePower <- as.numeric(subsetData$Global_reactive_power)
voltage <- as.numeric(subsetData$Voltage)
subMtrg1 <- as.numeric(subsetData$Sub_metering_1)
subMtrg2 <- as.numeric(subsetData$Sub_metering_2)
subMtrg3 <- as.numeric(subsetData$Sub_metering_3)
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMtrg1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMtrg2, type="l", col="red")
lines(datetime, subMtrg3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()