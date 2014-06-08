## Course Projects 
##
##
## Project 1
## Colocar el directorio de trabajo en la carpeta correspondiente al modulo de estudio
##
setwd("~/Documents/MichyFus/Cursos/Coursera/4 Exploratory Data Analysis")
##
##
## Ahora si a trabajar:
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
sub$h <- strptime(paste(sub$Date2, sub$Time),format="%d/insta%m/%Y %H:%M:%S")

household2 <- fread("./W1/P1.txt", sep=";", header =T, na.strings=c("NA","N/A","","?"))
h <- as.matrix(household2)

## whe I use the function fread() I have 6 waring massage; when use read.table it work fine
## bouth of them work and I have all the data in RStudio. In bouth case I have a data frame
## class
## Paste two variables in one (DateTime) and then proced to subset data
sub <- subset(household, Date2 == "2007-02-01" | Date2 == "2007-02-02")
sub$h <- strptime(paste(sub$Date, sub$Time),format="%d/%m/%Y %H:%M:%S")
## Plot2:
plot(sub$h,as.numeric(sub$Global_active_power),type="l", lwd = 1, main="",
     xlab="",ylab="Global Active Power (kilowatts)")
