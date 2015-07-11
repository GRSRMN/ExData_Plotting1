library("dplyr")
library("sqldf")

# Data Read section
file <- "./household_power_consumption.txt"
datafile<-file(file)
df<-sqldf("select Date, Global_active_power from datafile Where Date = '1/2/2007' or Date = '2/2/2007'",
          file.format=list(head=TRUE, sep=";"))
close(datafile)

# Clean Data
# Transform date 
mutate(df, Date = as.Date(strptime( 
  as.character(Date), format="%d/%m/%Y")))
png
#Plot Graph1 - Plot1.png
png(filename="plot1.png", width=480, height=480,bg = "transparent")
with(df, hist(Global_active_power, col="red", 
              main="Global Active Power", 
              xlab="Global Active Power (kilowatts)",
              ylab="Frequency"))
dev.off()