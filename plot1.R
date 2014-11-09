#########################
# Course Project 1 - Exploratory Data Analysis Course
#########################

#loading data table
table_all = read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#getting only the interested data in the table
dates_used = c('1/2/2007','2/2/2007')
rows_used = which(table_all$Date %in% dates_used)
table_all = table_all[rows_used,]

#plotting the histogram in a png file
table_all$Global_active_power = as.numeric(table_all$Global_active_power)
png(file="plot1.png",bg="white",width=480,height=480)
par(mfrow=c(1,1))
hist(table_all$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()