## Change work directory
##
setwd("~/Documents/MichyFus/Cursos/Coursera/4 Exploratory Data Analysis")
##
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
## Plot1:
## 
hist(sub$Global_active_power, col="red",
     main="Global Active Power", xlab="Global Active Power (kilowatts)")