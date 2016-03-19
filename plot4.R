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

##coercing sub_metering variables to numeric objects
Powermod$Sub_metering_1 <- as.numeric(Powermod$Sub_metering_1)
Powermod$Sub_metering_2 <- as.numeric(Powermod$Sub_metering_2)
Powermod$Sub_metering_3 <- as.numeric(Powermod$Sub_metering_3)

##Coercing voltage and Global_reactive_power variables to numeric objects
Powermod$Global_reactive_power <- as.numeric(Powermod$Global_reactive_power)
Powermod$Voltage <- as.numeric(Powermod$Voltage)

##Creating PNG file plot4.png, plotting histogram, and closing graphics device
png(file = "./ExploratoryAnalysis/plot4.png", width = 480, height = 480 )

par(mfrow=c(2,2), mar = c(4,4,2,2))

##Plotting Global Active Power vs datetime
with(Powermod, plot(datetime, Global_active_power, type = "l", xlab="", ylab = "Global Active Power"))

##Plotting Voltage vs datetime
with(Powermod, plot(datetime, Voltage, type = "l", ylab = "Voltage"))

#Plotting Energy Submetering vs datetime
with(Powermod, plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering", cex.lab=.9, cex.axis=.8))
with(Powermod, lines(datetime, Sub_metering_1, col="black", cex.lab=.5))
with(Powermod, lines(datetime, Sub_metering_2, col = "red", cex.lab=.5))
with(Powermod, lines(datetime, Sub_metering_3, col = "blue", cex.lab=.5))
##Creating a Legend
legend("topright", legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"), col=c("black", "red", "blue"), lty = c(1,1,1), cex=.5)

##Plotting Global Reactive Power vs datetime
with(Powermod, plot(datetime, Global_reactive_power, type = "l"))

dev.off()
