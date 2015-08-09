library(sqldf)
library(tcltk)
library(data.table)
power <- file("household_power_consumption.txt")
input <- sqldf("select * from power where Date = '1/2/2007' or Date = '2/2/2007'",file.format = list(sep = ";",row.names = FALSE))
input <- data.table(input)

png("plot2.png",width=480,height=480)
input <- input[,DT := paste(Date,Time, sep = " ")]
input <- input[,DT := as.POSIXct(strptime(DT,format = "%d/%m/%Y %H:%M:%S"))]
plot2 <- plot(input[,Global_active_power]~input[,DT],type = "l",ylab = "Global Active Power (kilowatts)",xlab = " ")
dev.off()