#Read the data from big file
bigdata <- read.table("household_power_consumption.txt", sep= ";" )

#change date field to date format
bigdata$V1 <- as.Date(bigdata$V1, "%d/%m/%Y")

#extract only the date between 2-1-2007 and 2-2-2007
dataToUse <- bigdata[bigdata$V1 >= "2007-2-1" & bigdata$V1 <= "2007-2-2", ]

#Change to numeric
dataToUse$V3 <- as.numeric(as.character(dataToUse$V3))

# Plot the histogram
hist(dataToUse$V3, main = "Global Active Power", xlab = "Global Active Power (kiloWatts)",  col = "red")


# Create the pnf file
dev.copy(png, file = "Plot1.png")
dev.off()
