## plot 2
## First need to generate the datetime column from the dataset dataFeb2007
library(lubridate)
par(mfrow = c(1,1))
plot2data <- data.frame(DateTime = dmy_hms(paste(dataFeb2007$Date, dataFeb2007$Time), tz = "UTC"), 
                   Power = as.numeric(dataFeb2007$Global_active_power))
plot(plot2data, type = "l", xlab = " ", ylab =  "Global Active Power (kilowatts)" )
dev.copy(png, file = "plot2.png")
dev.off() 
