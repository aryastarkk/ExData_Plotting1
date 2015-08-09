library(sqldf)
library(tcltk)
library(data.table)
power <- file("household_power_consumption.txt")
input <- sqldf("select * from power where Date = '1/2/2007' or Date = '2/2/2007'",file.format = list(sep = ";",row.names = FALSE))
input <- data.table(input)
input <- input[,DT := paste(Date,Time, sep = " ")]
input <- input[,DT := as.POSIXct(strptime(DT,format = "%d/%m/%Y %H:%M:%S"))]

png("plot4.png",width = 480,height = 480)
par(mfrow = c(2,2))
plot2 <- plot(input[,Global_active_power]~input[,DT],type = "l",ylab = "Global Active Power",xlab = " ")
plot4 <- plot(input[,Voltage]~input[,DT],type="l",ylab = "Voltage",xlab="datetime")
plot3 <- plot(input[,Sub_metering_1]~input[,DT],type="l",ylab = "Energy sub metering",xlab=" ")
lines(input[,Sub_metering_2]~input[,DT],col="red")
lines(input[,Sub_metering_3]~input[,DT],col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"),bty="n")
plot5 <- plot(input[,Global_reactive_power]~input[,DT],type="l",xlab = "datetime",ylab="Global_reactive_power")
dev.off()
