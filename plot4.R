## PLOT 4
## MY SYSTEM IS IN IRISH, SO FOR TIME SERIES PLOTS, NAME OF WEEKDAYS IS IN IRISH 
## Data is read into R environment from the text files and classes is given to the variables
new_hpc = read.table('household_power_consumption.txt', sep=';', header = TRUE,
                     colClasses = c('character', 'character', 'numeric', 'numeric',
                                    'numeric', 'numeric','numeric', 'numeric', 'numeric'), 
                     na.strings = '?')

## Date and Time variables are combined into a single variable and data is subset as per requirements
## of the assingment.
new_hpc$Date_Time = strptime(paste(new_hpc$Date, new_hpc$Time),"%d/%m/%Y %H:%M:%S")
new_hpc = subset(new_hpc,as.Date(Date_Time) >= as.Date("2007-02-01") &as.Date(Date_Time) <= as.Date("2007-02-02"))

##Graphic file device is opened (creating a png file)
png("plot4.png", height=480, width=480)
 
##provided global graphics parameters, 2 graphs in each row
par(mfrow=c(2,2))

## a plot is generated for Global Active Power and lines are created to build a time series.
plot(new_hpc$Date_Time, new_hpc$Global_active_power, pch=NA, xlab="", ylab="Global Active Power (kilowatts)")
lines(new_hpc$Date_Time, new_hpc$Global_active_power)

## a plot is generated for Voltage and lines are created to build a time series.
plot(new_hpc$Date_Time, new_hpc$Voltage, ylab="Voltage", xlab="datetime", pch=NA)
lines(new_hpc$Date_Time, new_hpc$Voltage)

## a plot is generated for sub_metering and lines are created to build a time series.
plot(new_hpc$Date_Time,new_hpc$Sub_metering_1, pch=NA,xlab="", ylab="Energy sub metering")
lines(new_hpc$Date_Time, new_hpc$Sub_metering_1)
lines(new_hpc$Date_Time, new_hpc$Sub_metering_2, col='red')
lines(new_hpc$Date_Time, new_hpc$Sub_metering_3, col='blue')
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = c(1,1,1),col = c('black', 'red', 'blue'), bty = 'n')

## a plot is generated Global Reactive Power and lines are created to build a time series.
with(new_hpc, plot(Date_Time, Global_reactive_power, xlab='datetime', pch=NA))
with(new_hpc, lines(Date_Time, Global_reactive_power))

##Graphic device png is closed
dev.off()

