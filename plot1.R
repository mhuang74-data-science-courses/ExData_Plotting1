##################################################################
# Assignment 1 - Plot 1 - Density (Count) of Global Active Power 
#  Date range: Limited to 2007-02-01 and 2007-02-02 only
# Exploratory Data Analysis
##################################################################

# Read in household energy dataset, reduced for 2007-02-01 and 2007-02-02
energy <- read.csv("../assignment1_data.txt", sep = ";")

# init png device
png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA,
    type = c("quartz"))

# plot Histogram using Base plotting system
hist(energy$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

# turn off device
dev.off()

