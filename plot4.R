 # read all data from file
 allData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", 
 colClasses = c("character", "character","numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric" ))

 # filter data for required days
 useData <- allData[allData$Date=="1/2/2007" |allData$Date=="2/2/2007", ]

 # convert Date column type as date
 useData$Date <- as.Date(useData$Date,"%d/%m/%Y")
 
 # add new column for DateTime
 useData<-cbind(useData, "DateTime" = as.POSIXct(paste(useData$Date, useData$Time)))
 
 # devide window into 2x2 matrix for 4 graph
 par(mfrow=c(2,2))
 
 # draw graph for Global Active power in Top Left part of window 
 plot(useData$Global_active_power ~ useData$DateTime, type="l", xlab= "", ylab="Global Active power ")
 
 # draw graph for Voltage in Top Right part of window 
 plot(useData$Voltage ~ useData$DateTime, type="l", xlab= "datetime", ylab="Voltage")
 
 # draw graph for Energy Sub Metering in Bottom Left part of window 
 plot(useData$Sub_metering_1 ~ useData$DateTime, type="n", xlab="", ylab = "Energy Sub Metering")
 lines(useData$Sub_metering_1 ~ useData$DateTime)
 lines(useData$Sub_metering_2 ~ useData$DateTime, col="red")
 lines(useData$Sub_metering_3 ~ useData$DateTime, col="blue")
 legend("topright", col=c("black","red","blue"), legend = c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=1, lwd=1, cex=.5, bty="n")
 
 # draw graph for Global_reactive_power in Bottom Right part of window 
 plot(useData$Global_reactive_power ~ useData$DateTime, type="l", xlab= "datetime", ylab="Global_reactive_power ")
 
 # save graph in PNG file plot4.png
 dev.copy( png, file ="plot4.png", width=480, height =480 )  
 dev.off()