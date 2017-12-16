#Sys.setlocale("LC_MESSAGES", 'en_GB.UTF-8')
#Sys.setenv(LANG = "en_US.UTF-8")
Sys.setlocale("LC_TIME", "English")

# Load data
# There are alot "?"s, need to pass "?" to parameter na.string 
dat <- read.csv("./data/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")
dat$Date <- as.Date(dat$Date, format="%d/%m/%Y")

# Subsetting the data
#subDat <- subset(dat, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
startDate <- as.Date(c("2007-02-01"), format="%Y-%m-%d")
endDate <- as.Date("2007-02-02", format="%Y-%m-%d")
subDat <- subset(dat, subset=(Date >= startDate & Date <= endDate))
rm(dat)


#DateTime
subDat$Datetime <- as.POSIXct(paste(subDat$Date, subDat$Time))

# Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(subDat, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

# Saving to file
dev.copy(png, file="./plot4.png", height=480, width=480)
dev.off()