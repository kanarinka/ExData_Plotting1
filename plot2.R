# Read data
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
df<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",colClasses = c("myDate","character",rep("numeric",7)))

# Filter on date
day1 = as.Date("2007-02-01")
day2 = as.Date("2007-02-02")
df = subset(df, Date %in% c(day1, day2))

# Concatenate date and time
df$datetime = strptime( paste(df$Date,df$Time), format="%Y-%m-%d %H:%M:%S")

# Plot Data
with(df, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")) 

# Write to file
dev.copy(png, file = "plot2.png")
dev.off()