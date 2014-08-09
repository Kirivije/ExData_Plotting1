######getting data#############################

require(sqldf)

data_file <- 'household_power_consumption.txt'

DF4 <- read.csv.sql(data_file, sep=";",
                    sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"  ')

df5 <- data.frame(DF4)

df5$Date <- strptime(paste(df5$Date,df5$Time), "%d/%m/%Y %H:%M:%S")

########################################################


png(filename = "plot1.png",
    width = 480, height = 480,
    unit = "px")

hist(as.numeric(df5$Global_active_power), 
     breaks=seq(0,8, by =0.5), 
     ylim =c(0,1200), 
     col = "red", 
     xaxt ="n", 
     yaxt = "n",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

axis(side =1, at = c(0, 2, 4, 6), cex.axis = 0.75)

axis(side =2, at = seq(0, 1200, by =200), cex.axis = 0.75)
 
dev.off()