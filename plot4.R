main <- function() {
    load_data()
    prep_plot()
    plot1()
    plot2()
    plot3()
    plot4()
    finilaze()
}

load_data <- function() {
    library(sqldf)
    data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", eol = "\n", header = TRUE, sep = ";")
    data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S") 
    data
}

prep_plot <- function() {
    png(filename = "plot4.png")
    par(mfrow = c(2, 2))
}

plot1 <- function() {
    plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", cex.lab = 0.75)
}

plot2 <- function() {
    plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", cex.lab = 0.75)
}

plot3 <- function() {
    plot(data$DateTime, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering", cex.lab = 0.75)
    points(x = data$DateTime, y = data$Sub_metering_1, type = "l", col = "black", lwd = 2)
    points(x = data$DateTime, y = data$Sub_metering_2, type = "l", col = "red", lwd = 2)
    points(x = data$DateTime, y = data$Sub_metering_3, type = "l", col = "blue", lwd = 2)
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1), cex = 0.75)
}

plot4 <- function() {
    plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive Power", cex.lab = 0.75)
}

finilaze <- function() {
    dev.off()    
}
