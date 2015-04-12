## plot1

## read the desired data from 01/02/2007 to 02/02/2007
data <- read.table("household_power_consumption.txt", header=FALSE, sep=";", skip=66637, nrows=2880)

## read the column headers and assign to the data column headers
header <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=1)
colnames(data) <- colnames(header)

# create png file
png(file="plot1.png", height=480, width=480)

# draw plot 1
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

# close file
dev.off()
