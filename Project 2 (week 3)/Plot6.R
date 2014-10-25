library(ggplot2)

#Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Find vehicle Related pollution.
vehicle<-grep("vehicle",SCC$EI.Sector,ignore.case=TRUE)
vehicle_scc<-SCC[vehicle,"SCC"]

#Subset the data for vehicles in Baltimore city & LA County
vehicle_data<-subset(NEI, SCC %in% vehicle_scc & fips %in% c("24510","06037"))

#Aggregate data
vehicle_agg<-aggregate(vehicle_data$Emissions, list(year = vehicle_data$year, fips = vehicle_data$fips),sum)
colnames(vehicle_agg)<-c("year","fips","emissions")

#plot the data w/regression line
myplot<-ggplot(vehicle_agg, aes(x=factor(year),y=emissions,group=fips)) + geom_point(aes(colour=fips)) + geom_smooth(method="lm") +
        ggtitle("Total Emissions from Vehicle Sources") + labs(x = "Years", y="Emissions") +
        scale_colour_manual (values=c("red","blue"), labels=c("Los Angeles County","Baltimore City"))

png(filename="Plot6.png")
print(myplot)
dev.off()

