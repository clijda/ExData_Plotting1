## Read data
Data <- read.table("household_power_consumption.txt", header=TRUE,sep=";",na.strings="?",stringsAsFactors=FALSE)

## convert Date and Time
Data$DateTime <- strptime(paste(Data$Date,Data$Time), format="%d/%m/%Y %H:%M:%S")
Data$Time <- strptime(Data$Time,format="%H:%M:%S")
Data$Date <- as.Date(Data$Date, format="%d/%m/%Y")
Data1 <- Data[Data$Date=="2007-02-01" | Data$Date=="2007-02-02",]

## plot 3: 3 lineplots in 1 graph
with(Data1, plot(DateTime,Sub_metering_1,type="l",col="Black",xlab="",ylab="Energy sub metering"))
lines(Data1$DateTime,Data1$Sub_metering_2,col="Red")
lines(Data1$DateTime,Data1$Sub_metering_3,col="Blue")
legend("topright", lty=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## write to PNG file
dev.copy(png, file = "plot3.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
