ds <- read.table(text = grep("^[1,2]/2/2007”, readLines("household_power_consumption.txt"), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

## grep makes sure that we extract the required lines. Another approach would have been reading
## the entire dataset and then subsetting it for the required lines.

ds$Date <- as.Date(ds$Date, format = "%d/%m/%Y”)

## date variable in factor format coereced to Date type format
                 
dateandtime <- paste(as.Date(ds$Date), ds$Time)
## combining date and time variables using paste
ds$Datetime <- as.POSIXct(dateandtime)
## coercing to POSIXct format

with(ds, (plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")))

with(ds, lines(Sub_metering_2 ~ Datetime, col = 'Red’))

with(ds, lines(Sub_metering_3 ~ Datetime, col = 'Blue'))

dev.copy(png, file="plot2.png")

## plot copied over from the screen device to a png device. 

dev.off()
