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
# Convert date
data$Date <- as.Date (data$Date, "%d/%m/%Y")
# Subset Data
datasubset <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
# Set Device - PNG
png(filename = "plot1.png",
    units = "px",
    width = 480,
    height = 480)
# create the histogram 
hist(datasubset$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")

#close the graphic device
dev.off()