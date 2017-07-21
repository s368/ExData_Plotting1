library(readr)
library(grDevices)

#load data
hpc_all <- read_delim("household_power_consumption.txt", ";", na = c("?"),
  col_types = cols(Date = col_date(format = "%d/%m/%Y"), Time = col_time(format = "%H:%M:%S")))

#subset only requested 'dates'
hpc<-subset(hpc_all, Date == "2007-02-01" | Date == "2007-02-02")

#drawing
png(file="plot2.png")
plot(strptime(paste(hpc$Date,hpc$Time),"%Y-%m-%d %H:%M:%S"),hpc$Global_active_power,type = "l", 
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
