#plot3
library(sqldf)
library(tcltk)
library(data.table)
power <- file("household_power_consumption.txt")
input <- sqldf("select * from power where Date = '1/2/2007' or Date = '2/2/2007'",file.format = list(sep = ";",row.names = FALSE))
input <- data.table(input)

input <- input[,DT := paste(Date,Time, sep = " ")]
input <- input[,DT := as.POSIXct(strptime(DT,format = "%d/%m/%Y %H:%M:%S"))]

png("plot3.png",width = 480,height=480)
plot3 <- plot(input[,Sub_metering_1]~input[,DT],type="l",ylab = "Energy sub metering",xlab=" ")
lines(input[,Sub_metering_2]~input[,DT],col="red")
lines(input[,Sub_metering_3]~input[,DT],col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
