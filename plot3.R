 # read all data from file
 allData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", 
 colClasses = c("character", "character","numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric" ))
 
 # filter data for required days
 useData <- allData[allData$Date=="1/2/2007" |allData$Date=="2/2/2007", ]
 
 # convert Date column type as date
 useData$Date <- as.Date(useData$Date,"%d/%m/%Y")
 
 # add new column for DateTime
 useData<-cbind(useData, "DateTime" = as.POSIXct(paste(useData$Date, useData$Time)))
 
 # draw graph
 plot(useData$Sub_metering_1 ~ useData$DateTime, type="n", xlab="", ylab = "Energy Sub Metering")
 lines(useData$Sub_metering_1 ~ useData$DateTime)
 lines(useData$Sub_metering_2 ~ useData$DateTime, col="red")
 lines(useData$Sub_metering_3 ~ useData$DateTime, col="blue")
 
 # add legend with 3 colors
 legend("topright", col=c("black","red","blue"), legend = c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=1, lwd=1, cex=1, pt.cex = 1)
 
 # save graph in PNG file plot3.png
 dev.copy( png, file ="plot3.png", width=480, height =480 ) 
 dev.off()