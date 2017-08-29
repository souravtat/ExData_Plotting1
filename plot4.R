plot4.R <- function()
{
  setwd('C:/Coursera_04_Exploratory Data Analysis')
  fh <- file("./data/household_power_consumption.txt")
  dat <- read.table(text = grep("^[1,2]/2/2007", readLines(fh), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

  
  dat$Date <- as.Date(dat$Date,"%d/%m/%Y")
  dat$datetime <- paste(dat$Date,dat$Time)
  dat$datetime <- as.POSIXct(dat$datetime)
  
  par(mfrow = c(2, 2),mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
  with(dat, {
    plot(Global_active_power~datetime,ylab="Global Active Power",xlab="",type="l")
    plot(dat$Voltage~datetime,ylab="Voltage",type="l")
    plot(Sub_metering_1~datetime, type="l",ylab="Energy sub metering", xlab="")
      lines(Sub_metering_2~datetime,col='Red')
      lines(Sub_metering_3~datetime,col='Blue')
      legend("topright",lty=1,lwd=c(1,1,1),col=c("black","blue","red"),legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
      
    plot(Global_reactive_power~datetime,ylab="Global_reactive_power",type="l")
    
  })
  
    dev.copy(png,file="./data/plot4.png",height=480,width=480)
  dev.off()
  
}