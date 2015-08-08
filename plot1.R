# download data

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "elec_pow_con.zip", method = "curl")

File <- "./household_power_consumption.txt"
data <- read.table(File, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

globalActivePower <- as.numeric(subData$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(globalActivePower, col = "red", main = "Global Acitve Power", xlab = "Global Active Power (kilowatts)")
dev.off()
