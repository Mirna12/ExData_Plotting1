#Sys.setlocale("LC_TIME", "English")

library(sqldf)

#load data for 1/2/2007 and 2/2/2007 (loading only columns: Date, Time and Global_active_power) 
#into data frame named df
df <- read.csv.sql("household_power_consumption.txt", sql = "select Date, Time, Global_active_power from file where Date=='1/2/2007' or Date=='2/2/2007'", 
                   header=TRUE, sep=";", colClasses="character")

#paste date and time into one variable DateTime; DateTime is class character
DateTime <- paste(df$Date, df$Time)
#convert variable DateTime from class character to class "POSIXlt"
x <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")

#make plot and store it in a png file called plot2
png(filename="plot2.png", width = 480, height = 480, bg="white")
plot(x, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()


