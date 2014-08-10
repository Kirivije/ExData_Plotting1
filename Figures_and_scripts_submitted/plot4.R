######getting data#############################

require(sqldf)


data_file <- 'household_power_consumption.txt'

DF4 <- read.csv.sql(data_file, sep=";",
                    sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"  ')

df5 <- data.frame(DF4)

df5$Date <- strptime(paste(df5$Date,df5$Time), "%d/%m/%Y %H:%M:%S")

##########################################
png(filename = "plot4.png",
    width = 480, height = 480,
    unit = "px")

par(mfrow =c(2,2))


###############frist plot###################################
plot(df5$Global_active_power, 
     type = "o", 
     pch = ".:", 
     xaxt = 'n', 
     ylab = "Global Active Power", 
     xlab = "",
     cex.lab=0.75)

axis(side = 1, 
     at = c(1, 1440, 2880), 
     labels = c("Thu", "Fri", "Sat"))

###################second plot#####################################

plot (c(0,2880),c(233,247),# sets the x and y axes scales 
      type="n", 
      xlab="datetime",ylab="Voltage",# adds titles to the axes 
      xaxt = "n") 

lines(df5$Voltage) #  


axis(side = 1, 
     at = c(1, 1440, 2880), 
     labels = c("Thu", "Fri", "Sat"))

#################third plot##########################################

plot (c(0,2880),c(0,38),# sets the x and y axes scales 
      type="n", 
      xlab=" ",ylab="Energy sub metering",# adds titles to the axes 
      xaxt = "n") 

lines(df5$Sub_metering_1) # adds a line  

lines(df5$Sub_metering_2,col="red") # adds a line 

lines(df5$Sub_metering_3,col="blue")

legend("topright", # places a legend at the appropriate place
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       
       col=c("black", "red", "blue"),
       cex= 0.8) # lengend size
axis(side = 1, 
     at = c(1, 1440, 2880), 
     labels = c("Thu", "Fri", "Sat"))

#################forth plot##########################################

plot (c(0,2880),c(0,0.5),# sets the x and y axes scales 
      type="n", 
      xlab="datetime",ylab="Global_reactive_power",# adds titles to the axes 
      xaxt = "n") 


lines(df5$Global_reactive_power) # adds a line for Global_reactive_power
axis(side = 1, 
     at = c(1, 1440, 2880), 
     labels = c("Thu", "Fri", "Sat"))

dev.off()