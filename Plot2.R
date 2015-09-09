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


##Plot 2
plot(dataUse$Global_active_power~dataUse$Stamptime, type= "l",ylab="Global Active Power (kilowatts)",xlab="")


dev.copy(png, file= "Plot2.png", height = 480, width = 480)
dev.off()




