plot4 <- function(){
  ## This function downloads and formats that data and produces the plot
  ## Remove the comments from the next 2 lines to download & unzip the data in your working directory
  ##  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "temp.zip", method = "internal", mode = "wb")
  ##  unzip("temp.zip")
  ## This section processes the data
  data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
  data$DateTime <- as.POSIXct(paste(data$Date,data$Time,sep=""),format="%d/%m/%Y%H:%M:%S")
  data <- subset(data, DateTime >= "2007-02-01" & DateTime < "2007-02-03")
  ## The next 2 lines are to prepare for plotting
  png(file ="plot4.png", height = 480, width = 480)
  par(mfrow=c(2,2))
  ## More data processing
  data$Global_active_power <- as.numeric(as.vector(data$Global_active_power))
  data$Voltage <- as.numeric(as.vector(data$Voltage))
  ## Create the 1st plot
  plot(x=data$DateTime,y=data$Global_active_power,type="l",ylab="Global Active Power",xlab="")
  ## Create the 2nd plot
  plot(x=data$DateTime,y=data$Voltage,type="l",ylab="Voltage",xlab="dateline")
  data$Sub_metering_1 <- as.numeric(as.vector(data$ Sub_metering_1))
  data$Sub_metering_2 <- as.numeric(as.vector(data$ Sub_metering_2))
  data$Sub_metering_3 <- as.numeric(as.vector(data$ Sub_metering_3))
  ## Create the 3rd plot
  plot(x=data$DateTime,y=data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
  lines(x=data$DateTime,y=data$Sub_metering_2,col="red")
  lines(x=data$DateTime,y=data$Sub_metering_3,col="blue")
  legend("topright", legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),bty="n", cex=.75)
  ## Create the 4th plot
  plot(x=data$DateTime,y=data$Global_active_power,type="l",ylab="plot 4",xlab="dateline")
  dev.off()
}
