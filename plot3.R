plot3 <- function() {
  
  names_data <- names(read.table("household_power_consumption.txt", sep=";", header=TRUE, skip= 0, nrow=1))
  data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, skip= 66636, nrow=2880)
  names(data)<-names_data
  data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
  date<-data$Date
  data<-subset(data,select=Global_active_power:Sub_metering_3)
  data<-cbind(date,data)
  names(data)[1]<-"Date" 
  png(filename="plot3.png",width = 480,height = 480)   
  plot(data$Date,data$Sub_metering_1, xlab = "", ylab="Energy sub metering", type="l")
  lines(data$Date,data$Sub_metering_2, col="red")
  lines(data$Date,data$Sub_metering_3, col="blue")
  legend("topright",col=c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), pch ="_")
  dev.off()
}