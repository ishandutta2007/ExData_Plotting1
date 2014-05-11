df <- read.table('household_power_consumption.txt', header = T, sep = ';', stringsAsFactors = F, na.strings = '?', skip = 66636, nrow = 2880)
colnames(df) <- c('Date', 'Time', 'Global_active_power', 'Global_reactive_power', 'Voltage', 'Global_intensity', 'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
datetime <- strptime(paste(df$Date, df$Time, sep = ' '), format = '%d/%m/%Y %H:%M:%S')
df <- data.frame(datetime, df[, 7:9])
png('plot3.png')
with(df,{
  plot(Sub_metering_1 ~ datetime, col = c('black', 'red', 'blue'), type='l', xlab='', ylab='Energy sub metering')
  lines(Sub_metering_2 ~ datetime, col = 'red')
  lines(Sub_metering_3 ~ datetime, col = 'blue')
  legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty = 1, lwd = 1)
}
)
dev.off()
