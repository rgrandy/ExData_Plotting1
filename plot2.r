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
png(filename = "plot2.png",
    units = "px",
    width = 480,
    height = 480)
# Create Plot
plot(datasubset$datetime, datasubset$Global_active_power, 
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
#close the graphic device
dev.off()