plot3 <- function(){
  ## This function downloads and formats that data and produces the plot
  ## Remove the commments from the next 2 lines to download & unzip the data in your working directory
  ##  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "temp.zip", method = "internal", mode = "wb")
  ##  unzip("temp.zip")
  data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
  data$DateTime <- as.POSIXct(paste(data$Date,data$Time,sep=""),format="%d/%m/%Y%H:%M:%S")
  data <- subset(data, DateTime >= "2007-02-01" & DateTime < "2007-02-03")
  png(file ="plot3.png", height = 480, width = 480)
  data$Sub_metering_1 <- as.numeric(as.vector(data$ Sub_metering_1))
  data$Sub_metering_2 <- as.numeric(as.vector(data$ Sub_metering_2))
  data$Sub_metering_3 <- as.numeric(as.vector(data$ Sub_metering_3))
  ## The net line produces the plot
  plot(x=data$DateTime,y=data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
  lines(x=data$DateTime,y=data$Sub_metering_2,col="red")
  lines(x=data$DateTime,y=data$Sub_metering_3,col="blue")
  dev.off()
}