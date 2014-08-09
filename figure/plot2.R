######getting data#############################


require(sqldf)

data_file <- 'household_power_consumption.txt'

DF4 <- read.csv.sql(data_file, sep=";",
                    sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"  ')

df5 <- data.frame(DF4)

df5$Date <- strptime(paste(df5$Date,df5$Time), "%d/%m/%Y %H:%M:%S")

###########################################

png(filename = "plot2.png",
    width = 480, height = 480,
    unit = "px")

plot(df5$Global_active_power, 
     type = "o", 
     pch = ".:", 
     xaxt = 'n', 
     ylab = "Global Active Power (kilowatts)", 
     xlab = "")

axis(side = 1, 
     at = c(1, 1440, 2880), 
     labels = c("Thu", "Fri", "Sat"))

dev.off()
