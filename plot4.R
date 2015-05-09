#Sys.setlocale("LC_TIME", "English")

library(sqldf)

#loading data into data frame df
df <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date=='1/2/2007' or Date=='2/2/2007'", 
                   header=TRUE, sep=";", colClasses="character")

#paste date and time into one variable DateTime; DateTime is class character
DateTime <- paste(df$Date, df$Time)
#convert variable DateTime from class character to class "POSIXlt"
x <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")

#make plot and store it in a png file called plot4
png(filename="plot4.png", width = 480, height = 480, bg="white")
par(mfrow=c(2,2))
#first plot
plot(x, df$Global_active_power, type="l", xlab="", ylab="Global Active Power")
#second plot
plot(x, df$Voltage, type="l", xlab="datetime", ylab="Voltage")
#third plot
plot(x, df$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines(x, df$Sub_metering_2, type="l", col="red")
lines(x, df$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty='n', lty=1, col=c("black", "red", "blue"))
#fourth plot
plot(x, df$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
