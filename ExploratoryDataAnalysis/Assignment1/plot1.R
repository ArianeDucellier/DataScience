data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Time <- strptime(data$Time, format="%H:%M:%S")
data_filter <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]

png("plot1.png", width=480, height=480)
par(lab=c(4, 7, 7))
hist(data_filter$Global_active_power, main="Global Active Power",
    xlim=c(0, 7), ylim=c(0, 1200), xlab="Global Active Power (kilowatts)",
    ylab="Frequency", col="red")
dev.off()
