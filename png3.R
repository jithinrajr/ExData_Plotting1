download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","./data")
unzip("data")
dat <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
d <- dat[dat$Date %in% c("1/2/2007","2/2/2007"),]
 t 
d$date_time <- strptime(paste(d$Date, d$Time, sep =" "),format = "%d/%m/%Y %H:%M:%S")



plot(x=d$date_time, y= d$Sub_metering_1, type ="n" , xlab = "", ylab = "Global Active Power(kilowatts)")
points(d$date_time, d$Sub_metering_1, type = "l", col ="black")
points(d$date_time, d$Sub_metering_2, type = "l", col ="red")
points(d$date_time, d$Sub_metering_3, type = "l", col ="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), lwd= c(2,2,2), col = c("black","red", "blue"), cex = .75)


dev.copy(png,"png3.png")
dev.off()