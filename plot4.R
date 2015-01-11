##################################################################
# Assignment 1 - Plot 4 - Panel of 4 plots
#  Date range: Limited to 2007-02-01 and 2007-02-02 only
# Exploratory Data Analysis
##################################################################

# Read in household energy dataset, reduced for 2007-02-01 and 2007-02-02
energy <- read.csv("../assignment1_data.txt", sep = ";")
# convert into Posix Datetime 
energy$Datetime <- as.POSIXct(strptime(paste(energy$Date, energy$Time, sep = " "), "%d/%m/%Y %H:%M:%S"))
# add Date of Week
energy$DayOfWeek <- weekdays(energy$Datetime)

# init png device
png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA,
    type = c("quartz"))

# set up panel of 2 x 2 plots
par(mfrow = c(2,2))

# plot Global Active Power as function of time
plot(energy$Datetime, energy$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

# Plot Voltage vs Time
with(energy, plot(Datetime, Voltage, type = "l"))

# plot Global Active Power as function of time
with(energy, plot(Datetime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(energy, lines(Datetime, Sub_metering_2, col = "red", type = "l"))
with(energy, lines(Datetime, Sub_metering_3, col = "blue", type = "l"))

legend("topright", lty = 1, bty = "n",
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)


# Plot Global Reactive Power vs Time
with(energy, plot(Datetime, Global_reactive_power, type = "l"))

# turn device off
dev.off()