## PLOT 3
## MY SYSTEM IS IN IRISH, SO FOR TIME SERIES PLOTS, NAME OF WEEKDAYS IS IN IRISH 
## Data is read into R environment from the text files and classes is given to the variables
new_hpc = read.table('household_power_consumption.txt', sep=';', header = TRUE,
                     colClasses = c('character', 'character', 'numeric', 'numeric',
                                    'numeric', 'numeric','numeric', 'numeric', 'numeric'), 
                     na.strings = '?')
## Date and Time variables are combined into a single variable and data is subset as per requirements
## of the assingment.
new_hpc$Date_Time = strptime(paste(new_hpc$Date, new_hpc$Time),"%d/%m/%Y %H:%M:%S")
new_hpc <- subset(new_hpc,as.Date(Date_Time) >= as.Date("2007-02-01") & as.Date(Date_Time) <= as.Date("2007-02-02"))

##Graphic file device is opened (creating a png file)
png("plot3.png", height=480, width=480)

## a plot is generated and lines are created to build a time series.
plot(new_hpc$Date_Time, new_hpc$Sub_metering_1, pch=NA, xlab="", ylab="Energy sub metering")
lines(new_hpc$Date_Time, new_hpc$Sub_metering_1)
lines(new_hpc$Date_Time, new_hpc$Sub_metering_2, col='red')
lines(new_hpc$Date_Time, new_hpc$Sub_metering_3, col='blue')
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c('black', 'red', 'blue'))

##Graphic device png is closed
dev.off()