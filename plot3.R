#Sys.setlocale("LC_TIME", "English")

library(sqldf)

#load data for 1/2/2007 and 2/2/2007 (loading 5 columns: Date, Time and Sub_metering columns) 
#into data frame named df
df <- read.csv.sql("household_power_consumption.txt", sql = "select Date, Time, Sub_metering_1, Sub_metering_2, Sub_metering_3 from file where Date=='1/2/2007' or Date=='2/2/2007'", 
                   header=TRUE, sep=";", colClasses="character")

#paste date and time into one variable DateTime; DateTime is class character
DateTime <- paste(df$Date, df$Time)
#convert variable DateTime from class character to class "POSIXlt"
x <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")

#make plot and store it in a png file called plot3
png(filename="plot3.png", width = 480, height = 480, bg="white")
plot(x, df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines(x, df$Sub_metering_2, type="l", col="red")
lines(x, df$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), box.lty=1)
dev.off()
