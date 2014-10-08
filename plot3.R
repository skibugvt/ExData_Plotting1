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
png(filename="Plot3.png",width = 480, height = 480)

plot(feb_data$Date_Time,feb_data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(feb_data$Date_Time,feb_data$Sub_metering_2,type="l",col="red")
lines(feb_data$Date_Time,feb_data$Sub_metering_3,type="l",col="blue")

legend("topright",
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1)

dev.off()


