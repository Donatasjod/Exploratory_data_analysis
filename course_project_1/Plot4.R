# Reading and subsetting data
library(data.table)
household<-fread("household_power_consumption.txt")
sub_household<-household[household$Date %in% c("1/2/2007", "2/2/2007"),]
global_active_power<-as.numeric(sub_household$Global_active_power)
date_time<-strptime(paste(sub_household$Date, sub_household$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sub_metering_1<-as.numeric(sub_household$Sub_metering_1)
sub_metering_2<-as.numeric(sub_household$Sub_metering_2)
sub_metering_3<-as.numeric(sub_household$Sub_metering_3)
voltage<-as.numeric(sub_household$Voltage)
global_reactive_power<-as.numeric(sub_household$Global_reactive_power)

#Producing graphs
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#1
plot(date_time, global_active_power, type="l", ylab="Global Active Power", xlab = "")
#2
plot(date_time, voltage, type = "l", ylab = "Voltage", xlab = "datetime")
#3
plot(date_time, sub_metering_1, type="l", ylab="Energy sub metering", xlab = "")
lines(date_time, sub_metering_2, col="red")
lines(date_time, sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
#4
plot(date_time, global_reactive_power, type="l", ylab="Global Reactive Power", xlab = "datetime")
dev.off()
