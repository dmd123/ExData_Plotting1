plot2 <- function(){
## This function downloads and formats that data and produces the plot
## Remove the commments from the next 2 lines to download & unzip the data in your working directory
##  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "temp.zip", method = "internal", mode = "wb")
##  unzip("temp.zip")
  data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
  data$DateTime <- as.POSIXct(paste(data$Date,data$Time,sep=""),format="%d/%m/%Y%H:%M:%S")
  data <- subset(data, DateTime >= "2007-02-01" & DateTime < "2007-02-03")
  png(file ="plot2.png", height = 480, width = 480)
  data$Global_active_power <- as.numeric(as.vector(data$Global_active_power))
## The net line produces the plot
  plot(x=data$DateTime,y=data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
  dev.off()
}