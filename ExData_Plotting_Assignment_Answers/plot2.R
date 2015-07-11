library("dplyr")
library("sqldf")

# Data Read section
file <- "./household_power_consumption.txt"
datafile<-file(file)
df<-sqldf("select Date, Time, Global_active_power from datafile Where Date = '1/2/2007' or Date = '2/2/2007'",
          file.format=list(head=TRUE, sep=";"))
close(datafile)

# Clean Data
# Transform date 
df$TS<-paste(df$Date,df$Time)
df$TS<-strptime(df$TS, format="%d/%m/%Y %H:%M:%S")

#Plot Graph1 - Plot2.png
png(filename="plot2.png", width=480, height=480,bg = "transparent")
plot.background=
with(df, plot(TS,Global_active_power, type="l",
              ylab="Global Active Power (kilowatts)"))
dev.off()
