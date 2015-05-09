library(sqldf)

#load data for 1/2/2007 and 2/2/2007 (loading only column Global_active_power) 
#into data frame named df
df <- read.csv.sql("household_power_consumption.txt", sql = "select Global_active_power from file where Date=='1/2/2007' or Date=='2/2/2007'", 
                   header=TRUE, sep=";", colClasses="character")

#make a histogram
png(filename="plot1.png", width = 480, height = 480, bg="white")
hist(as.numeric(df$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()