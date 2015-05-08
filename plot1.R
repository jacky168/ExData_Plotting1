df <- read.csv('./data/household_power_consumption.txt', header = TRUE, sep = ';', colClasses =c('character','character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'), na.strings=c('?'))
df$Date <- as.Date(df$Date, '%d/%m/%Y')
sub_df <- df[df$Date >= '2007-02-01' & df$Date <= '2007-02-02',]

png('./figure/plot1.png', width=480, height=480)
hist(sub_df$Global_active_power, main='Global Active Power', xlab = 'Global Active Power (kilowatts)', col='red')
dev.off()
