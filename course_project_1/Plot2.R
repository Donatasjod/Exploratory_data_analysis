# Reading and subsetting data
library(data.table)
household<-fread("household_power_consumption.txt")
sub_household<-household[household$Date %in% c("1/2/2007", "2/2/2007"),]
global_active_power<-as.numeric(sub_household$Global_active_power)
date_time<-strptime(paste(sub_household$Date, sub_household$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Producing graph
png("plot2.png", width=480, height=480)
plot(date_time, global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
