# Reading and subsetting data
library(data.table)
household<-fread("household_power_consumption.txt")
sub_household<-household[household$Date %in% c("1/2/2007", "2/2/2007"),]
global_active_power<-as.numeric(sub_household$Global_active_power)

# Producing graph
png("plot1.png", width=480, height=480)
hist(global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
