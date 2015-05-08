Sys.setlocale("LC_TIME", "en_US.UTF-8")
df <- read.csv('./data/household_power_consumption.txt', header = TRUE, sep = ';', colClasses =c('character','character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings=c('?'))

df$DateTime <- strptime(paste(df$Date, df$Time), '%d/%m/%Y %H:%M:%s')
df$Date <- as.Date(df$Date, '%d/%m/%Y')
sub_df <- df[df$Date >= '2007-02-01' & df$Date <= '2007-02-02',]
sub_df$weekday <- weekdays(sub_df$DateTime)
sub_df$weekday <- as.factor(sub_df$weekday)

png('./figure/plot3.png', width=480, height=480)
#png('plot3.png', width=480, height=480)
plot(sub_df$DateTime, sub_df$Sub_metering_1, type='n', xlab='', ylab='Energy sub metering')
lines(sub_df$DateTime, sub_df$Sub_metering_1, col='black')
lines(sub_df$DateTime, sub_df$Sub_metering_2, col='red')
lines(sub_df$DateTime, sub_df$Sub_metering_3, col='blue')
legend("topright",legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'), lty=c(1,1), col=c('black','red','blue'))
dev.off()