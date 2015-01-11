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
# Create subset of data
datasubset <- subset(data, (datetime >= as.POSIXct("2007-02-01 00:00:00") &
                              datetime < as.POSIXct("2007-02-03 00:00:00"))) 
# Set Device - PNG
png(filename = "plot3.png",
    units = "px",
    width = 480,
    height = 480)

# Plot shell
plot(datasubset$datetime, datasubset$Sub_metering_1, 
     type = "n",
     ylab = "Energy sub metering",
     xlab = "")
# Lines for Sub_metering_1
lines(datasubset$datetime, datasubset$Sub_metering_1,
      col = "black")
# Lines for Sub_metering_2 
lines(datasubset$datetime, datasubset$Sub_metering_2,
      col = "red")
# Lines for Sub_metering_3
lines(datasubset$datetime, datasubset$Sub_metering_3,
      col = "blue")
# Legend - topright
legend("topright", 
       lty = 1, 
       col=c("black","red","blue"),
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"))
#close the graphic device
dev.off()