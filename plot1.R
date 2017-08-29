plot1.R <- function()
{
  
  setwd('C:/Coursera_04_Exploratory Data Analysis')  
  fh <- file("./data/household_power_consumption.txt")
  dat <- read.table(text = grep("^[1,2]/2/2007", readLines(fh), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)
  dat$Date <- as.Date(dat$Date,"%d/%m/%Y")
  hist(dat$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
  dev.copy(png,file="./data/plot1.png",height=480,width=480)
  dev.off()
  
}