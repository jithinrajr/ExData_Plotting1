# reading data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","./data")
unzip("data")
dat <- read.table(file = "household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
d <- dat[dat$Date %in% c("1/2/2007","2/2/2007"),]


#applying strptime and adding date_time variable
d$date_time <- strptime(paste(d$Date, d$Time, sep =" "),format = "%d/%m/%Y %H:%M:%S")

#plotting

plot(d$date_time, d$Global_active_power, type = "l", ylab = "Global Active Power(kilowatts)")

dev.copy(png,"png2.png")
dev.off()
