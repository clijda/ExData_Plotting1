## Read data
Data <- read.table("household_power_consumption.txt", header=TRUE,sep=";",na.strings="?",stringsAsFactors=FALSE)

## convert Date and Time
Data$DateTime <- strptime(paste(Data$Date,Data$Time), format="%d/%m/%Y %H:%M:%S")
Data$Time <- strptime(Data$Time,format="%H:%M:%S")
Data$Date <- as.Date(Data$Date, format="%d/%m/%Y")
Data1 <- Data[Data$Date=="2007-02-01" | Data$Date=="2007-02-02",]

## plot 4: 4 plots
par(mfcol=c(2,2), ps=12, mar = c(4, 4, 2, 1), oma = c(0, 0, 0, 0))
plot(Data1$DateTime, Data1$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
with(Data1, plot(DateTime,Sub_metering_1,type="l",col="Black",xlab="",ylab="Energy sub metering"))
lines(Data1$DateTime,Data1$Sub_metering_2,col="Red")
lines(Data1$DateTime,Data1$Sub_metering_3,col="Blue")
legend("topright", lty=1, bty="n",col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(Data1$DateTime, Data1$Voltage, type="l", ylab="Voltage",xlab="datetime")
plot(Data1$DateTime, Data1$Global_reactive_power, type="l", ylab="Global_reactive_power",xlab="datetime")

## write to PNG file
dev.copy(png, file = "plot4.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
