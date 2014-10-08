# Read data
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
#Convert date
household_power_consumption$Date<-as.Date(household_power_consumption$Date,format="%d/%m/%Y")
#subset data by date
feb_data<-subset(household_power_consumption, Date =="2007-02-01" | Date =="2007-02-02")
#Create new date/time column
feb_data$Date_Time<-paste(feb_data$Date,feb_data$Time)

#Reformat date/time
feb_data$Date_Time<-strptime(feb_data$Date_Time,"%Y-%m-%d %H:%M:%S")

# Build Plot
png(filename="Plot2.png",width = 480, height = 480)
plot(feb_data$Date_Time,feb_data$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()


