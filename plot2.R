 # read all data from file
 allData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", 
 colClasses = c("character", "character","numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric" ))
 
 # filter data for required days
 useData <- allData[allData$Date=="1/2/2007" |allData$Date=="2/2/2007", ]
 
 # convert Date column type as date
 useData$Date <- as.Date(useData$Date,"%d/%m/%Y")
 
 # add new column for DateTime
 useData<-cbind(useData, "DateTime" = as.POSIXct(paste(useData$Date, useData$Time)))
 
 # draw the graph
 plot(useData$Global_active_power ~ useData$DateTime, type="l", xlab= "", ylab="Global Active power (kilowatts)")
 
 # save graph in PNG file plot2.png
 dev.copy( png, file ="plot2.png", width=480, height =480 )
 dev.off()