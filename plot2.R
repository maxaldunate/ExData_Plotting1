#load data necessary lines only
hhPower <- read.table("household_power_consumption.txt", skip=66637, nrows=2880, header=FALSE, sep=";",
                      col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                                    "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                      colClasses= c("character","character","double","double","double","double",
                                    "double","double","numeric"),
                      stringsAsFactors = FALSE, na.strings="?")
hhPower$DateTime <- strptime(paste(hhPower$Date,hhPower$Time), "%d/%m/%Y %H:%M:%S")
hhPower$Date <- as.Date(strptime(hhPower$Date, "%d/%m/%Y"))

#2
png(file = "plot2.png", width = 480, height = 480, units = "px")

plot(x = hhPower$DateTime, y = hhPower$Global_active_power, 
     type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()
