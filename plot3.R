library(readr)
library(grDevices)

#load data
hpc_all <- read_delim("household_power_consumption.txt", ";", na = c("?"),
  col_types = cols(Date = col_date(format = "%d/%m/%Y"), Time = col_time(format = "%H:%M:%S")))

#subset only requested 'dates'
hpc<-subset(hpc_all, Date == "2007-02-01" | Date == "2007-02-02")

#drawing: plot + lines + lines + legend
png(file="plot3.png")
plot(strptime(paste(hpc$Date,hpc$Time),"%Y-%m-%d %H:%M:%S"),hpc$Sub_metering_1,type = "l", 
     xlab = "",
     ylab = "Energy sub metering")
lines(strptime(paste(hpc$Date,hpc$Time),"%Y-%m-%d %H:%M:%S"),hpc$Sub_metering_2,col = "red")
lines(strptime(paste(hpc$Date,hpc$Time),"%Y-%m-%d %H:%M:%S"),hpc$Sub_metering_3,col = "blue")
legend("topright", lty = 1 , col = c("black","red","blue"), legend = c(names(hpc[,7:9])))
dev.off()
