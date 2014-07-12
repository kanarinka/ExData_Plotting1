# Read data
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
df<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses = c("myDate","character",rep("numeric",7)))

# Filter on date
day1 = as.Date("2007-02-01")
day2 = as.Date("2007-02-02")
df = subset(df, Date %in% c(day1, day2))

# Concatenate date and time
df$datetime = strptime( paste(df$Date,df$Time), format="%Y-%m-%d %H:%M:%S")

png(filename ="plot3.png", width = 500, height = 500)

# Plot Data
with(df, plot(datetime, Sub_metering_1, type="n", xlab="", ylab="Energy submetering")) 
lines(df$datetime,df$Sub_metering_1,type = "l", col = "black")
lines(df$datetime,df$Sub_metering_2,type = "l", col = "red")
lines(df$datetime,df$Sub_metering_3,type = "l", col = "blue")

# legend
legend("topright", col = c("black", "red", "blue"), lty= "solid", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

# Write to file
dev.off()