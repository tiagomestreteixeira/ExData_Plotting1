#plot1
plot1<- function(){
  
  names_data <- names(read.table("household_power_consumption.txt", sep=";", header=TRUE, skip= 0, nrow=1))
  data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, skip= 66636, nrow=2880)
  names(data)<-names_data
  data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
  date<-data$Date
  data<-subset(data,select=Global_active_power:Sub_metering_3)
  data<-cbind(date,data)
  names(data)[1]<-"Date" 
  png(filename="plot1.png",width = 480,height = 480)
  par(mar=c(5,5,2,2))
  #with(data,plot(Date,Global_active_power))
  hist(data$Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")
  dev.off()
}