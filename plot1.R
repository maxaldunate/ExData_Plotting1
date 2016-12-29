#load data necessary lines only
hhPower <- read.table("household_power_consumption.txt", skip=66637, nrows=2880, header=FALSE, sep=";",
                      col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                                    "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                      colClasses= c("character","character","double","double","double","double",
                                    "double","double","numeric"),
                      stringsAsFactors = FALSE, na.strings="?")
hhPower$DateTime <- strptime(paste(hhPower$Date,hhPower$Time), "%d/%m/%Y %H:%M:%S")
hhPower$Date <- as.Date(strptime(hhPower$Date, "%d/%m/%Y"))

#1
png(file = "plot1.png", width = 480, height = 480, units = "px")

hist(hhPower$Global_active_power, main = "Global Active Power", 
     ylab = "Frequency", xlab = "Global Active Power (kilowatts)", col = "red")

dev.off()