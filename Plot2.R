## Plot2

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
png("plot2.png", width = 480, height = 480, units = "px")
plot(datetime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()