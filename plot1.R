
raw <- read.csv("./data/household_power_consumption.txt", header = TRUE, sep = ";")

## Only data from 2007-02-01 and 2007-02-02 will be used
dataFeb2007 <- subset(raw, as.Date(raw$Date, "%d/%m/%Y") <= as.Date("2007-02-02", "%Y-%m-%d") 
                      & as.Date(raw$Date, "%d/%m/%Y") >= as.Date("2007-02-01", "%Y-%m-%d"))

## Plot 1
par(mfrow = c(1,1))
hist(as.numeric(dataFeb2007$Global_active_power), col = "red", breaks = 12
     , main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")  
dev.off() 
