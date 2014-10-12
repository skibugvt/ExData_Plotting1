#Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset the data for baltimore
baltimore_data<-subset(NEI, fips == "24510")

#Aggregate data
aggdata<- aggregate(Emissions ~ year, data=baltimore_data, sum)

#plot the data w/regression line
png(filename="Plot2.png",width = 480, height = 480)
with(alldata, plot(year, Emissions,main="Total Emissions from PM2.5 in Baltimore by Year"))
model <- lm(Emissions~year, alldata)
abline(model, lwd = 2)
dev.off()

