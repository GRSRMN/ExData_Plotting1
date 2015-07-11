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

# Plot Graph1 - Plot3.png
png(filename="plot3.png", width=480, height=480,bg = "transparent")
with(df, plot(TS,Sub_metering_1, type="l", xlab="", ylab="Energy Sub metering"))
  points(df$TS, df$Sub_metering_2, type='l',col="red")
  points(df$TS, df$Sub_metering_3, type='l',col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), col=c("black", "red", "blue"))

     

dev.off()

