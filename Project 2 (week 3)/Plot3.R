library(ggplot2)

#Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset the data for baltimore
baltimore_data<-subset(NEI, fips == "24510")

#Aggregate data
aggdata<- aggregate(Emissions ~ year+type, data=baltimore_data, sum)

#plot the data w/regression line
myplot<-qplot(year,Emissions,data=aggdata,facets=type~.,geom = c("point", "smooth"), method = "lm",main="Total Emissions from PM2.5 in US by Year")
png(filename="Plot3.png")
print(myplot)
dev.off()

