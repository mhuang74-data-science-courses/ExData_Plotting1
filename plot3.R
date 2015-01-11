##################################################################
# Assignment 1 - Plot 3 - Sub Metering Energy Usage vs Time
#  Date range: Limited to 2007-02-01 and 2007-02-02 only
# Exploratory Data Analysis
##################################################################

# Read in household energy dataset, reduced for 2007-02-01 and 2007-02-02
energy <- read.csv("assignment1_data.txt", sep = ";")
# convert into Posix Datetime 
energy$Datetime <- as.POSIXct(strptime(paste(energy$Date, energy$Time, sep = " "), "%d/%m/%Y %H:%M:%S"))
# add Date of Week
energy$DayOfWeek <- weekdays(energy$Datetime)

# init png device
png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA,
    type = c("quartz"))

# plot Global Active Power as function of time
plot(energy$Datetime, 
     energy$Sub_metering_1, 
     col = "black",
     type = "l", 
     ylab = "Energy sub metering", 
     xlab = ""
     )

lines(energy$Datetime, 
     energy$Sub_metering_2, 
     col = "red",
     type = "l"
)

lines(energy$Datetime, 
      energy$Sub_metering_3, 
      col = "blue",
      type = "l"
)

legend("topright", 
       lty = 1,
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)

# turn device off
dev.off()