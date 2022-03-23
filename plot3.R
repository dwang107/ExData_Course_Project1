## plot 3
par(mfrow = c(1,1))
plot3data <- data.frame(DateTime = dmy_hms(paste(dataFeb2007$Date, dataFeb2007$Time), tz = "UTC"),
                        sub_meeting1 = as.numeric(dataFeb2007$Sub_metering_1),
                        sub_meeting2 = as.numeric(dataFeb2007$Sub_metering_2),
                        sub_meeting3 = as.numeric(dataFeb2007$Sub_metering_3))
plot(plot3data$DateTime, plot3data$sub_meeting1, type = "l", col = "black", xlab = " ", ylab = "Energy sub meeting")
lines(plot3data$DateTime, plot3data$sub_meeting2, col = "red")
lines(plot3data$DateTime, plot3data$sub_meeting3, col = "blue")
legend("topright",
       inset = c(0.05,0),
       cex = 0.7,
       lwd = c(2,2,2),
       col = c("black", "red", "blue"), 
       bty = "n",
       legend = c("Sub_meeting_1", "Sub_meeting_2", "Sub_meeting_3"))
dev.copy(png, file = "plot3.png")  
dev.off()  

