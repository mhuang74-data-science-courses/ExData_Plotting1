library(lattice)

#### Assignment 1 
#### Exploratory Data Analysis

# Read in household energy dataset, reduced for 2007-02-01 and 2007-02-02
energy <- read.csv("../assignment1_data.txt", sep = ";")
# convert into Posix Datetime 
energy$Datetime <- strptime(paste(energy$Date, energy$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

## ggplot2
# ggplot(data=energy, aes(x=Global_active_power)) + geom_bar(stat="bin")

## lattice
myadj <- 1.2
p <- histogram(~ energy$Global_active_power, 
               data = energy, 
               type = "count", 
               #endpoints = c(0,8),
               main = "Global Active Power",
               xlab = "Global Active Power (kilowatts)",
               ylab = "Frequency",
               col = "red",
               xlim = c(0,6),
               ylim = c(0, 1300),
               breaks = seq(0, 8, .5),
               
               scales = list(
                   relation = "free",
                   x = list(at = seq(0,6,2)),
                   y = list(at = seq(0,1200,200), rot = 90)
                   ),
               par.settings = list( 
                   axis.line = list(col = 1),
                   layout.widths = list(ylab.axis.padding = 2, 
                                        xlab.axis.padding = 2
                                        ),
                   axis.components = list(
                       #left = list(pad1 = myadj, pad2 = 2 - myadj),
                       #bottom = list(pad1 = myadj, pad2 = 2 - myadj),
                       #top = list(pad1 = myadj, pad2 = 2 - myadj),
                       #right = list(pad1 = myadj, pad2 = 2 - myadj)
                   )
               ),
#                axis = function(side, line.col, ...) {
#                    # Only draw axes on the left and bottom
#                    if(side %in% c("left","bottom")) {
#                        # Call default axis drawing function
#                        axis.default(side = side, line.col = "black", ...)
#                    }
#                }
               
)

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA,
    type = c("quartz"))
print(p)
dev.off()

