data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, format="%H:%M:%S")
data_filter <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]

png("plot4.png", width=480, height=480)
oldpar <- par(mfrow=c(2,2))


par(lab=c(7, 4, 7), mfg=c(1, 1, 2, 2))
plot(data_filter$Global_active_power, main="",
    xlab="", ylab="Global Active Power",
    type="l", col="black", ,xaxt="n")
axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"))

par(lab=c(7, 4, 7), mfg=c(2, 1, 2, 2))
plot(data_filter$Sub_metering_1, main="",
    xlab="", ylab="Energy sub metering",
    ylim=c(0, max(data_filter$Sub_metering_1)), type="l", col="black", ,xaxt="n")
par(new=TRUE)
plot(data_filter$Sub_metering_2, main="",
    xlab="", ylab="Energy sub metering",
    ylim=c(0, max(data_filter$Sub_metering_1)), type="l", col="red", ,xaxt="n")
par(new=TRUE)
plot(data_filter$Sub_metering_3, main="",
    xlab="", ylab="Energy sub metering",
    ylim=c(0, max(data_filter$Sub_metering_1)), type="l", col="blue", ,xaxt="n")
axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"))
legend("topright", col=c("black", "red", "blue"), lty=1, bty="n",
    legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

par(lab=c(7, 7, 7), mfg=c(1, 2, 2, 2))
plot(data_filter$Voltage, main="",
    xlab="datetime", ylab="Voltage",
    type="l", col="black", ,xaxt="n")
axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"))

par(lab=c(7, 6, 7), mfg=c(2, 2, 2, 2))
plot(data_filter$Global_reactive_power, main="",
    xlab="datetime", ylab="Global_reactive_power",
    type="l", col="black", ,xaxt="n")
axis(1, at=c(0, 1440, 2880), labels=c("Thu", "Fri", "Sat"))

dev.off()
