getwd()

if (!file.exists("data")){
      dir.create("data")
}

#temp <- tempfile()
#fileUrl<-"http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(fileUrl,temp)
#unzip(temp,exdir="./data" )
data<-read.table("./data/household_power_consumption.txt", colClasses = "character", sep=";", header=TRUE)
data$Date<-as.Date(data$Date,"%d/%m/%Y") 
date1<-as.Date("2007-02-01")
date2<-as.Date("2007-02-02")
out<-data[(data$Date>=date1 & data$Date<=date2),]
Sys.setlocale('LC_TIME', 'C')

#1

hist(as.numeric(out$Global_active_power), col="red", xlab = "Global Active Power (kilowatts)", main=" Global Active Power" ) 

#2
colnames1<-colnames(out)
dates<-out$Date
times<-out$Time
x <- paste(dates, times)
out<-cbind(out, strptime(x, "%Y-%m-%d %H:%M:%S") )
colnames(out)<-c(colnames1,"DT")
plot(out$DT, out$Global_active_power, type="l",ylab ="Global Active Power (kilowatts)", xlab = "")

#3
with(out, plot(DT,Sub_metering_1, type ="l", ylab= "Energy sub metering", xlab=""))
with(out, points(DT,Sub_metering_2, type ="l", col="red"))
with(out, points(DT,Sub_metering_3, type ="l", col="blue"))
legend("topright",col=c("black","red","blue" ),pch="-", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


#4

par(mfrow=c(2,2))

plot(out$DT, out$Global_active_power, type="l",ylab ="Global Active Power", xlab = "")

plot(out$DT, out$Voltage, type="l",ylab ="Voltage", xlab = "datetime")



with(out, plot(DT,Sub_metering_1, type ="l", ylab= "Energy sub metering", xlab=""))
with(out, points(DT,Sub_metering_2, type ="l", col="red"))
with(out, points(DT,Sub_metering_3, type ="l", col="blue"))
legend("topright",col=c("black","red","blue" ),pch="-", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(out$DT, out$Global_reactive_power, type="l",ylab ="Global Reactive Power", xlab = "datetime")


