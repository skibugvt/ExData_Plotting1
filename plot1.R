# Read data
household_power_consumption <- read.csv("~/Documents/jeff/R/Getting_cleaning_data/coursera_exploratory_data_analysis/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
#Convert date
household_power_consumption$Date<-as.Date(household_power_consumption$Date,format="%d/%m/%Y")
#subset data by date
feb_data<-subset(household_power_consumption, Date =="2007-02-01" | Date =="2007-02-02")
#Convert time column
feb_data$Time<-strptime(feb_data$Time,"%H:%M:%S")

# Build Histogram
png(filename="Plot1.png",width = 480, height = 480)
hist(feb_data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()


