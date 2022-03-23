## plot 2
## First need to generate the datetime column from the dataset dataFeb2007
library(lubridate)
raw <- read.csv("./data/household_power_consumption.txt", header = TRUE, sep = ";")

## Only data from 2007-02-01 and 2007-02-02 will be used
dataFeb2007 <- subset(raw, as.Date(raw$Date, "%d/%m/%Y") <= as.Date("2007-02-02", "%Y-%m-%d") 
                      & as.Date(raw$Date, "%d/%m/%Y") >= as.Date("2007-02-01", "%Y-%m-%d"))

par(mfrow = c(1,1))
plot2data <- data.frame(DateTime = dmy_hms(paste(dataFeb2007$Date, dataFeb2007$Time), tz = "UTC"), 
                   Power = as.numeric(dataFeb2007$Global_active_power))
plot(plot2data, type = "l", xlab = " ", ylab =  "Global Active Power (kilowatts)" )
dev.copy(png, file = "plot2.png")
dev.off() 
