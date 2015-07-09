main <- function() {
    library(sqldf)
    data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", eol = "\n", header = TRUE, sep = ";")
    data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S") 
    png(filename = "plot3.png")
    plot(data$DateTime, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
    points(x = data$DateTime, y = data$Sub_metering_1, type = "l", col = "black", lwd = 2)
    points(x = data$DateTime, y = data$Sub_metering_2, type = "l", col = "red", lwd = 2)
    points(x = data$DateTime, y = data$Sub_metering_3, type = "l", col = "blue", lwd = 2)
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1))
    dev.off()
}