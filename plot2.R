#########################
# Course Project 1 - Exploratory Data Analysis Course
# Plot 2
#########################

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
png(file="plot2.png",bg="white",width=480,height=480)
par(mfrow=c(1,1))

plot(date,table_all$Global_active_power,xaxt = "n",ylab = "Global Active Power (kilowatts)", xlab = "",type="l")
axis.POSIXct(1, as.POSIXct(date, origin="1970-01-01"))

dev.off()

