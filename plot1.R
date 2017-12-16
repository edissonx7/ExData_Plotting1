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


# Plot 1
hist(subDat$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Saving to file
dev.copy(png, file="./plot1.png", height=480, width=480)
dev.off()
