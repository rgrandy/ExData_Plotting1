#SET WD
setwd("c:/Users/Rose/documents/coursera/exploredata")
#FILE has the data.  Read this in.
file = "household_power_consumption.txt"
data <- read.table(file,
                   header = TRUE,
                   sep = ";",
                   na.strings = "?",
                   stringsAsFactors = FALSE,
                   nrows = 100000 )
# Create DATETIME from date and time
data$datetime  <-  as.POSIXct(paste(data$Date, data$Time), 
                              format = "%d/%m/%Y %H:%M:%S")
# Subset data
datasubset <- subset(data, (datetime >= as.POSIXct("2007-02-01 00:00:00") &
                              datetime < as.POSIXct("2007-02-03 00:00:00"))) 
# Set Device - PNG
png(filename = "plot4.png",
    units = "px",
    width = 480,
    height = 480)

# 4 Plots, 2 rows, 2 columns
par(mfcol=c(2,2))

# add top left plot  
plot(datasubset$datetime, datasubset$Global_active_power, 
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")

# add bottom left plot
plot(datasubset$datetime, datasubset$Sub_metering_1, 
     type = "n",
     ylab = "Energy sub metering",
     xlab = "")
lines(datasubset$datetime, datasubset$Sub_metering_1,
      col = "black")
lines(datasubset$datetime, datasubset$Sub_metering_2,
      col = "red")
lines(datasubset$datetime, datasubset$Sub_metering_3,
      col = "blue")
#  Legend, no box, topright
legend("topright", 
       lty = 1, 
       col=c("black","red","blue"),
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"),
       bty = "n")

# top right plot  
with(datasubset, 
     plot(datetime, Voltage, 
          type = "l"))

# bottom right plot 
with(datasubset, 
     plot(datetime, Global_reactive_power, 
          type = "l"))

# Reset the plot area  
par(mfrow=c(1,1))
#close the graphic device
dev.off()