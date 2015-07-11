library("dplyr")
library("sqldf")

# Data Read section
file <- "./household_power_consumption.txt"
datafile<-file(file)
df<-sqldf("select * from datafile Where Date = '1/2/2007' or Date = '2/2/2007'",
          file.format=list(head=TRUE, sep=";"))
close(datafile)

# Clean Data
# Transform date 
df$TS<-paste(df$Date,df$Time)
df$TS<-strptime(df$TS, format="%d/%m/%Y %H:%M:%S")

# Plot Graph4 - Plot4.png
png(filename="plot4.png", width=480, height=480,bg = "transparent")
par(mfrow=c(2,2), mar= c(4,4,4,2))

#Sub Plot 1 - Global Active Power By Day
plot(df$TS, df$Global_active_power, ylab="Global Active Power", xlab="",type="l" )

#Sub Plot 2 - Voltage By Day
plot(df$TS, df$Voltage, ylab="Voltage", xlab="datetime",type="l")

#Sub Plot 3 - Sub_metering By Day
with(df, plot(TS,Sub_metering_1, type="l",xlab="", ylab="Energy Sub metering"))
points(df$TS, df$Sub_metering_2, type='l',col="red")
points(df$TS, df$Sub_metering_3, type='l',col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), col=c("black", "red", "blue"), bty='n')

#Sub Plot 4 - Sub_metering By Day
plot(df$TS, df$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime",type="l")




dev.off()

