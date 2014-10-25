library(ggplot2)

#Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Find vehicle Related pollution.
vehicle<-grep("vehicle",SCC$EI.Sector,ignore.case=TRUE)
vehicle_scc<-SCC[vehicle,"SCC"]

#Subset the data for vehicles in Baltimore city
vehicle_data<-subset(NEI, SCC %in% vehicle_scc & fips == "24510")

#Aggregate data
aggdata<- aggregate(Emissions ~ year, data=vehicle_data, sum)

#plot the data w/regression line
myplot<-qplot(year,Emissions,data=aggdata,geom = c("point", "smooth"), method = "lm",main="Total Vehicle Emissions in Balimore City by Year")
png(filename="Plot5.png")
print(myplot)
dev.off()

