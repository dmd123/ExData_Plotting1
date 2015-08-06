plot1 <- function(){
## This function downloads and formats that data and produces the plot
## Remove the commments from the next 2 lines to download & unzip the data in your working directory
##  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "temp.zip", method = "internal", mode = "wb")
##  unzip("temp.zip") 
## The next 4 lines process the data
  data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
  data$DateTime <- as.POSIXct(paste(data$Date,data$Time,sep=""),format="%d/%m/%Y%H:%M:%S")
  data <- subset(data, DateTime >= "2007-02-01" & DateTime < "2007-02-03")
  png(file ="plot1.png", height = 480, width = 480)
  data$Global_active_power <- as.numeric(as.vector(data$Global_active_power))
## plot is produced with this line
  hist(data$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")
  dev.off()
}