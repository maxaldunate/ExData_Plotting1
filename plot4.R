#load data necessary lines only
hhPower <- read.table("household_power_consumption.txt", skip=66637, nrows=2880, header=FALSE, sep=";",
                      col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                                    "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                      colClasses= c("character","character","double","double","double","double",
                                    "double","double","numeric"),
                      stringsAsFactors = FALSE, na.strings="?")
hhPower$DateTime <- strptime(paste(hhPower$Date,hhPower$Time), "%d/%m/%Y %H:%M:%S")
hhPower$Date <- as.Date(strptime(hhPower$Date, "%d/%m/%Y"))

#4
png(file = "plot4.png", width = 480, height = 480, units = "px")

oldMfrow <- par("mfrow")
par(mfrow=c(2,2))

plot(x = hhPower$DateTime, y = hhPower$Global_active_power, 
     type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
plot(x = hhPower$DateTime, y = hhPower$Voltage,
     type = "l", ylab = "Voltage", xlab="datetime")
plot(x = hhPower$DateTime, y = hhPower$Sub_metering_1,
     type = "l", ylab = "Energy sub metering", xlab = "")

lines(x = hhPower$DateTime, y = hhPower$Sub_metering_2, col = "red")
lines(x = hhPower$DateTime, y = hhPower$Sub_metering_3, col = "blue")

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty = "l", col = c("black", "red", "blue"), lwd = 2, cex = 0.4)

plot(hhPower$DateTime, hhPower$Global_reactive_power, 
     type = "l", main = "", xlab = "datetime")

dev.off()
par(mfrow = oldMfrow)