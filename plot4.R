library(readr)
library(grDevices)

#load data
hpc_all <- read_delim("household_power_consumption.txt", ";", na = c("?"),
  col_types = cols(Date = col_date(format = "%d/%m/%Y"), Time = col_time(format = "%H:%M:%S")))

#subset only requested 'dates'
hpc<-subset(hpc_all, Date == "2007-02-01" | Date == "2007-02-02")

#drawing: plot + lines + lines + legend
png(file="plot4.png")
par(mfrow = c(2,2))

#1
plot(strptime(paste(hpc$Date,hpc$Time),"%Y-%m-%d %H:%M:%S"),hpc$Global_active_power,type = "l", 
     xlab = "",
     ylab = "Global Active Power")

#2
plot(strptime(paste(hpc$Date,hpc$Time),"%Y-%m-%d %H:%M:%S"),hpc$Voltage,type = "l", 
     xlab = "datetime",
     ylab = names(hpc[,5]))

#3
plot(strptime(paste(hpc$Date,hpc$Time),"%Y-%m-%d %H:%M:%S"),hpc$Sub_metering_1,type = "l", 
     xlab = "",
     ylab = "Energy sub metering")
lines(strptime(paste(hpc$Date,hpc$Time),"%Y-%m-%d %H:%M:%S"),hpc$Sub_metering_2,col = "red")
lines(strptime(paste(hpc$Date,hpc$Time),"%Y-%m-%d %H:%M:%S"),hpc$Sub_metering_3,col = "blue")
legend("topright", lty = 1 , bty = "n",col = c("black","red","blue"), legend = c(names(hpc[,7:9])))

#4
plot(strptime(paste(hpc$Date,hpc$Time),"%Y-%m-%d %H:%M:%S"),hpc$Global_reactive_power,type = "l", 
     xlab = "datetime",
     ylab = names(hpc[,4]))

dev.off()
