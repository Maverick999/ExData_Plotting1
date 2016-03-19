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

#coercing sub_metering variables to numeric objects
Powermod$Sub_metering_1 <- as.numeric(Powermod$Sub_metering_1)
Powermod$Sub_metering_2 <- as.numeric(Powermod$Sub_metering_2)
Powermod$Sub_metering_3 <- as.numeric(Powermod$Sub_metering_3)

##Creating PNG file plot2.png, plotting histogram, and closing graphics device
png(file = "./ExploratoryAnalysis/plot3.png", width = 480, height = 480 )

#Plotting Energy Submetering vs datetime
with(Powermod, plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(Powermod, lines(datetime, Sub_metering_1, col="black"))
with(Powermod, lines(datetime, Sub_metering_2, col = "red"))
with(Powermod, lines(datetime, Sub_metering_3, col = "blue"))

##Creating a Legend
legend("topright", legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"), col=c("black", "red", "blue"), lty = c(1,1,1))

dev.off()
