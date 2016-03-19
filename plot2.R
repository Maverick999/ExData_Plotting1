##Exploratory Data Analysis Project #1

##Downloading zipped file and unzipping file
if (!file.exists("./ExploratoryAnalysis")){dir.create("./ExploratoryAnalysis")}
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "temp.zip")
unzip("temp.zip", exdir = "./ExploratoryAnalysis/Project1")

##reading data into dataframe
Power  <- read.table("./ExploratoryAnalysis/Project1/household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors = FALSE)
##Coercing Date variable to date object
Power$Date  <- as.Date(Power$Date, format="%d/%m/%Y")

##Subsetting Data Frame to dates of interest
Powermod  <- subset(Power, Date=="2007-02-01"| Date== "2007-02-02")

##Coercing time to Posixlt
Powermod$datetime  <- paste(Powermod$Date, Powermod$Time)
Powermod$datetime  <- strptime(Powermod$datetime, "%Y-%m-%d %H:%M:%S")

##Coercing the variable Global_active_power to a numeric object
Powermod$Global_active_power <- as.numeric(Powermod$Global_active_power)

##Creating PNG file plot2.png, plotting histogram, and closing graphics device
png(file = "./ExploratoryAnalysis/plot2.png", width = 480, height = 480 )
with(Powermod, plot(datetime, Global_active_power, type = "l", xlab ="", ylab = "Global Active Power (kilowatts)"))
dev.off()
