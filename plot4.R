#loading data table
table_all = read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#getting only the interested data in the table
dates_used = c('1/2/2007','2/2/2007')
rows_used = which(table_all$Date %in% dates_used)
table_all = table_all[rows_used,]

#converting date to Date format
#table_all$Date = as.Date(table_all$Date,format="%d/%m/%Y")
date = mapply(function(s1, s2){as.POSIXct(paste(s1, s2), format = "%d/%m/%Y %H:%M:%S")},table_all$Date,table_all$Time)

#plotting the histogram in a png file
table_all$Global_active_power = as.numeric(table_all$Global_active_power)
png(file="plot4.png",bg="white",width=480,height=480)
par(mfcol=c(2,2))

#first plot
plot(date,table_all$Global_active_power,xaxt = "n",ylab = "Global Active Power (kilowatts)", xlab = "",type="l")
axis.POSIXct(1, as.POSIXct(date, origin="1970-01-01"))

#second plot
plot(date,table_all$Sub_metering_1,xaxt = "n",ylab = "Energy sub metering", xlab = "",type="n")
points(date,table_all$Sub_metering_1,col="black",type="l")
points(date,table_all$Sub_metering_2,col="red",type="l")
points(date,table_all$Sub_metering_3,col="blue",type="l")
axis.POSIXct(1, as.POSIXct(date, origin="1970-01-01"))
legend("topright", col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=1)

#third plot
plot(date,table_all$Voltage,xaxt = "n",ylab = "Voltage", xlab = "datetime",type="l")
axis.POSIXct(1, as.POSIXct(date, origin="1970-01-01"))

#fourth plot
plot(date,table_all$Global_reactive_power,xaxt = "n",ylab = "Global_reactive_power", xlab = "datetime",type="l")
axis.POSIXct(1, as.POSIXct(date, origin="1970-01-01"))

dev.off()

