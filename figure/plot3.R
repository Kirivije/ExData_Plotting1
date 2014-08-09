######getting data#############################


require(sqldf)

data_file <- 'household_power_consumption.txt'

DF4 <- read.csv.sql(data_file, sep=";",
                    sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"  ')

df5 <- data.frame(DF4)

df5$Date <- strptime(paste(df5$Date,df5$Time), "%d/%m/%Y %H:%M:%S")

#######################################################


png(filename = "plot3.png",
    width = 480, height = 480,
    unit = "px")


plot (c(0,2880),c(0,38),# sets the x and y axes scales 
      type="n", 
      xlab=" ",ylab="Energy sub metering",# adds titles to the axes 
      xaxt = "n") 

lines(df5$Sub_metering_1) # adds a line for Sub_metering_1 

lines(df5$Sub_metering_2,col="red") # adds a line for Sub_metering_2 

lines(df5$Sub_metering_3,col="blue") #adds a line for Sub_metering_3

legend("topright", # places a legend at the appropriate place 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       
       col=c("black", "red", "blue"),
       cex= 0.8) # lengend size
axis(side = 1, 
     at = c(1, 1440, 2880), 
     labels = c("Thu", "Fri", "Sat"))

dev.off()