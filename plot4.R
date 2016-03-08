par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
## mfrow sets the layout to accomodate 4 plots in 2 rows and 2 columns

with(ds, {
  plot(Global_active_power ~ Datetime, type = "l", ylab = "Global Active Power", xlab = "")
  plot(Voltage ~ Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
  legend("topright", col = c(“Black", “Red", “Blue"), lty = 1, lwd = 2, bty = "n",
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power ~ Datetime, type = "l", ylab = "Global_rective_power", xlab = "datetime")
})

dev.copy(png, file="plot4.png”)
dev.off()