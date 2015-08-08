#readdata
File <- "./household_power_consumption.txt"
data <- read.table(File, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str
datetime <- strptime(paste(subData$Date, subData$Time), format = "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subData$Global_active_power)
subMetering1 <- as.numeric(subData$Sub_metering_1)
subMetering2 <- as.numeric(subData$Sub_metering_2)
subMetering3 <- as.numeric(subData$Sub_metering_3)

png("plot3.png", width = 480, height = 480)
plot(datetime, subMetering1, type = "l", xlab = "", ylab = "Energy Submetering")
lines(datetime, subMetering2, type = "l", col = "red")
lines(datetime, subMetering3, type = "l", col = "blue")
dev.off()