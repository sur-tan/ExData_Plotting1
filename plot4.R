## read the desired data from 01/02/2007 to 02/02/2007
data <- read.table("household_power_consumption.txt", header=FALSE, sep=";", skip=66637, nrows=2880)

## read the column headers and assign to the data column headers
header <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=1)
colnames(data) <- colnames(header)

## plot4

# Combine Date and Time column and convert them to POSIXct format, name the column properly
data<- cbind(strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), data)
colnames(data) <- c("DateTime", colnames(data[2:10]))

# create png file
png(file="plot4.png", height=480, width=480)

# set the layout for four graphs
layout(matrix(c(1,2,3,4), nrow=2, ncol=2))

# draw plot 1
plot(data$DateTime, data$Global_active_power, ylab="Global Active Power", xlab="", type="l")

# draw plot 2
plot(data$DateTime, data$Sub_metering_1, col="black", ylab="Energy sub metering", xlab="", type="l")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", null, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=c(1,1,1))

# draw plot 3
plot(data$DateTime, data$Voltage, ylab="Voltage", xlab="datetime", type="l")

# draw plot 4
plot(data$DateTime, data$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")

# close file
dev.off()
