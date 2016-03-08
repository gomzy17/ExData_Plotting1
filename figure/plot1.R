
ds <- read.table(text = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), value = TRUE), sep=";", header = TRUE, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3”))

## grep makes sure that we extract the required lines. Another approach would have been reading
## the entire dataset and then subsetting it for the required lines.
                                      
hist(ds$Global_active_power, col="red", main=title("Global Active Power"), xlab = "Global Active Power (kilowatts)”)

dev.copy(png,file=“plot1.png”)
   
## plot copied over from the screen device to a png device.    

dev.off()


