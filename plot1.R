## Read data
Data <- read.table("household_power_consumption.txt", header=TRUE,sep=";",na.strings="?",stringsAsFactors=FALSE)

## convert Date and Time
Data$DateTime <- strptime(paste(Data$Date,Data$Time), format="%d/%m/%Y %H:%M:%S")
Data$Time <- strptime(Data$Time,format="%H:%M:%S")
Data$Date <- as.Date(Data$Date, format="%d/%m/%Y")
Data1 <- Data[Data$Date=="2007-02-01" | Data$Date=="2007-02-02",]

## Plot 1: histogram of global active power
hist(Data1$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="Red")

## write to PNG file
dev.copy(png, file = "plot1.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
