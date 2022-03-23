## plot 4

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
