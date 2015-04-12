## plot2

## read the desired data from 01/02/2007 to 02/02/2007
data <- read.table("household_power_consumption.txt", header=FALSE, sep=";", skip=66637, nrows=2880)

## read the column headers and assign to the data column headers
header <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=1)
colnames(data) <- colnames(header)

# Combine Date and Time column and convert them to POSIXct format, name the column properly
data<- cbind(strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S"), data)
colnames(data) <- c("DateTime", colnames(data[2:10]))

# create png file
png(file="plot2.png", height=480, width=480)

# draw plot 2
plot(data$DateTime, data$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")

# close file
dev.off()