## plot 4
raw <- read.csv("./data/household_power_consumption.txt", header = TRUE, sep = ";")
library(lubridate)
## Only data from 2007-02-01 and 2007-02-02 will be used
dataFeb2007 <- subset(raw, as.Date(raw$Date, "%d/%m/%Y") <= as.Date("2007-02-02", "%Y-%m-%d") 
                      & as.Date(raw$Date, "%d/%m/%Y") >= as.Date("2007-02-01", "%Y-%m-%d"))
plot2data <- data.frame(DateTime = dmy_hms(paste(dataFeb2007$Date, dataFeb2007$Time), tz = "UTC"), 
                   Power = as.numeric(dataFeb2007$Global_active_power))
plot3data <- data.frame(DateTime = dmy_hms(paste(dataFeb2007$Date, dataFeb2007$Time), tz = "UTC"),
                        sub_meeting1 = as.numeric(dataFeb2007$Sub_metering_1),
                        sub_meeting2 = as.numeric(dataFeb2007$Sub_metering_2),
                        sub_meeting3 = as.numeric(dataFeb2007$Sub_metering_3))
plot4data1 <- data.frame(DateTime = dmy_hms(paste(dataFeb2007$Date, dataFeb2007$Time), tz = "UTC"),
                         Voltage = as.numeric(dataFeb2007$Voltage))
plot4data2 <- data.frame(DateTime = dmy_hms(paste(dataFeb2007$Date, dataFeb2007$Time), tz = "UTC"),
                         Reactive_power = as.numeric(dataFeb2007$Global_reactive_power))
par(mfrow = c(2,2))
plot(plot2data, type = "l", xlab = " ", ylab =  "Global Active Power (kilowatts)" )
plot(plot4data1, type = "l")
plot(plot3data$DateTime, plot3data$sub_meeting1, type = "l", col = "black", xlab = " ", ylab = "Energy sub meeting")
lines(plot3data$DateTime, plot3data$sub_meeting2, col = "red")
lines(plot3data$DateTime, plot3data$sub_meeting3, col = "blue")
legend(x = 1170338000,
       y = 40,
       lwd = c(2,2,2),
       col = c("black", "red", "blue"), 
       legend = c("Sub_meeting_1", "Sub_meeting_2", "Sub_meeting_3"),
       bty = "n")
plot(plot4data2, type = "l", ylab= "Global_reactive_power")
dev.copy(png, file = "plot4.png") 
dev.off()  
