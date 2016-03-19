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

##Coercing the variable Global_active_power to a numeric object
Powermod$Global_active_power <- as.numeric(Powermod$Global_active_power)

##Creating PNG file plot1.png, plotting histogram, and closing graphics device
png(file = "./ExploratoryAnalysis/plot1.png", width = 480, height = 480 )
hist(Powermod$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
