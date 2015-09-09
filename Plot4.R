#Read the data from big file
bigdata <- read.csv("household_power_consumption.txt", sep= ";", stringsAsFactors = FALSE, dec=".", na.strings="?",nrows=2075259, check.names = F,comment.char="", quote='\"')


#change date field to date format

bigdata$Date <- as.Date(bigdata$Date, format= "%d/%m/%Y")

#extract only the date between 2-1-2007 and 2-2-2007
dataUse <- subset(bigdata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

rm(bigdata)

#Converting dates
date_time <- paste(as.Date(dataUse$Date), dataUse$Time)
data$Stamptime <- as.POSIXct(date_time)


##Plot 4
par(mfrow = c( 2, 2))
with(dataUse,{
  
    plot(dataUse$Global_active_power~dataUse$Stamptime, type= "l", ylab ="Global Active Power" , xlab = "")  
    plot(dataUse$Voltage~ dataUse$Stamptime, type ="l", ylab= "Voltage", xlab = "datetime")
  
    plot(dataUse$Sub_metering_1~dataUse$Stamptime, type= "l",ylab="Global Active Power (kilowatts)",xlab="")
    lines(dataUse$Sub_metering_2~dataUse$Stamptime, col = 'Red')
    lines(dataUse$Sub_metering_3~dataUse$Stamptime, col = 'Blue')
    legend("topright", col=c("black", "red", "blue"), lty= 1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
    
    plot(dataUse$Global_reactive_power~dataUse$Stamptime, type="l", ylab= "Global_Reactive_power", xlab = "datetime")
})

dev.copy(png, file="Plot4.png", height = 480, width = 480)

dev.off()






