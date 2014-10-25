library(ggplot2)

#Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Find Coal Related Combustion.
coal<-grep("Fuel Comb.*Coal",SCC$EI.Sector,ignore.case=TRUE)
coal_scc<-SCC[coal,"SCC"]

#Subset the data for coal
coal_data<-subset(NEI, SCC %in% coal_scc)

#Aggregate data
aggdata<- aggregate(Emissions ~ year, data=coal_data, sum)

#plot the data w/regression line
myplot<-qplot(year,Emissions,data=aggdata,geom = c("point", "smooth"), method = "lm",main="Total Emissions from PM2.5 from Coal Combustion in US by Year")
png(filename="Plot4.png")
print(myplot)
dev.off()

