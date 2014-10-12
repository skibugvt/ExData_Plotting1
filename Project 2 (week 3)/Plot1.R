#Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Aggregate data
aggdata<- aggregate(Emissions ~ year, data=NEI, sum)

#plot the data w/regression line
png(filename="Plot1.png",width = 480, height = 480)
with(alldata, plot(year, Emissions,main="Total Emissions from PM2.5 in US by Year"))
model <- lm(Emissions~year, alldata)
abline(model, lwd = 2)
dev.off()

