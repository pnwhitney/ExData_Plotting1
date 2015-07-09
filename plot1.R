main <- function() {
    library(sqldf)
    data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", eol = "\n", header = TRUE, sep = ";")dat$DateTime <- strptime(paste(dat$Date, dat$Time), "%d/%m/%Y %H:%M") 
    data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S") 
    png(filename = "plot1.png")
    hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (killowatts)", ylab = "Frequency")
    dev.off()
}

