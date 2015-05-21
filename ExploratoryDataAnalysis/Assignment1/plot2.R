data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, format="%H:%M:%S")
data_filter <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]

png("plot2.png", width=480, height=480)
par(lab=c(7, 4, 7))
plot(data_filter$Global_active_power, main="",
    xlab="", ylab="Global Active Power (kilowatts)",
    type="l", col="black", ,xaxt="n")
axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
dev.off()
