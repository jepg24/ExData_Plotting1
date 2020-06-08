## Plot1

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

## Getting the plot
png("plot1.png", width = 480, height = 480, units = "px")
hist(df$Global_active_power, main = "Global Active Power", xlab = "Global Active Power(kilowatts)", col = "red")
dev.off()