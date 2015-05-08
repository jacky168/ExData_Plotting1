Sys.setlocale("LC_TIME", "en_US.UTF-8")
df <- read.csv('./data/household_power_consumption.txt', header = TRUE, sep = ';', colClasses =c('character','character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings=c('?'))

df$DateTime <- strptime(paste(df$Date, df$Time), '%d/%m/%Y %H:%M:%s')
df$Date <- as.Date(df$Date, '%d/%m/%Y')
sub_df <- df[df$Date >= '2007-02-01' & df$Date <= '2007-02-02',]
sub_df$weekday <- weekdays(sub_df$DateTime)
sub_df$weekday <- as.factor(sub_df$weekday)

png('./figure/plot2.png', width=480, height=480)
plot(sub_df$DateTime, sub_df$Global_active_power, type='n', xlab='', ylab='Global Active Power (kilowatts)')
lines(sub_df$DateTime, sub_df$Global_active_power)
dev.off()