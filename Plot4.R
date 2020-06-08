## Plot4

## Reading the Data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "data.zip", method = "curl")
file <- unzip("data.zip", unzip = "internal")

## Installing packages
install.packages("data.table")
library(data.table)

## Subsetting the data
df <- subset(Data,Data$Date == "1/2/2007" | Data$Date == "2/2/2007")
Data <- data.table::fread("household_power_consumption.txt", stringsAsFactors = FALSE, dec = ".")
datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Getting the plot
png("plot4.png", width = 480, height = 480, units = "px")
par(mfcol = c(2,2))
## Plot1
hist(as.numeric(df$Global_active_power), main = "", xlab = "Global Active Power(kilowatts)", col = "red")
## Plot2
plot(datetime, df$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
lines(datetime, df$Sub_metering_2, col = "red")
lines(datetime, df$Sub_metering_3, col = "blue")
legend("topright", lty = 1, c("Sub_meting_1", "Sub_meting_2", "Sub_meting_3"), col = c("black", "red", "blue"))
## Plot3
plot(datetime, df$Voltage, type = "l", ylab = "Voltage", xlab = "")
## Plot4
plot(datetime, df$Global_reactive_power, type = "l", ylab = "Global Reactive Power", xlab = "")
dev.off()