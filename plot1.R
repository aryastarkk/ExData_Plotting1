library(sqldf)
library(tcltk)
library(data.table)
power <- file("household_power_consumption.txt")
input <- sqldf("select * from power where Date = '1/2/2007' or Date = '2/2/2007'",file.format = list(sep = ";",row.names = FALSE))
input <- data.table(input)

#plot1
png("plot1.png",width = 480,height = 480)
plot1 <- hist(input[,Global_active_power],freq = TRUE,col = 'red',main = "Global Active Power",xlab = "Global Active Power (kilowatts)",ylab = "Frequency")
dev.off()