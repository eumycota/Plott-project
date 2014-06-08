Plott-project
=============

Excersive for coursera course
 In this project you can see how to plot with R project:
 
 First, you can see the R code of the plots in this project then you can see the png files with that plots.
 ## Download the data
##
fileUrl<- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,
              destfile="./W1/project1.zip",
              method="curl")
## When I have it, I unzipp with MacOS Sysyem... more easy 
##
## Then read the data, I use two funciton, read.table (my secon option) and fread (my first
## option)

library(data.table)
household <- read.table("./W1/P1.txt", sep=";", header =T, na.strings=c("NA","N/A","","?"))
household$Date2 <- as.Date(household$Date, format="%d/%m/%Y")
sub <- subset(household, Date2 == "2007-02-01" | Date2 == "2007-02-02")
sub$h <- strptime(paste(sub$Date2, sub$Time),format="%d/%m/%Y %H:%M:%S")
## whe I use the function fread() I have 6 waring massage; when use read.table it work fine
## bouth of them work and I have all the data in RStudio. In bouth case I have a data frame
## class
## Paste two variables in one (DateTime) and then proced to subset data
sub <- subset(household, Date2 == "2007-02-01" | Date2 == "2007-02-02")
sub$h <- strptime(paste(sub$Date2, sub$Time),format="%d/insta%m/%Y %H:%M:%S")
##

## Plot4:
par(mfrow = c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(sub,{
        plot(sub$h, sub$Global_active_power, type="l",xlab="",ylab="Global Active Power")
        plot(sub$h, sub$Voltage, type="l", xlab="Date time", ylab="Voltage")
        plot(sub$h, sub$Global_reactive_power, type="l",xlab="Date time", ylab="Global Reactive Power")
        with(sub,{plot(sub$h, sub$Sub_metering_1, axes=T, col="black",xlab="",ylab="",type="l",ann=T)
                  lines(sub$h, sub$Sub_metering_3, type="l",col="blue")
                  lines(sub$h, sub$Sub_metering_2, type="l",col="red")
                  legend("topright",pch="-",col= c("black","red","blue"), legend=x)
                  
        })
        mtext("Plot4", outer = T)
})

