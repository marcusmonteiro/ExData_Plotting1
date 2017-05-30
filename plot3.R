source('load_household_power_consumption_data_frame.R')

MakePlot3 <- function() {
  file.name <- 'plot3.png'
  
  if (file.exists(file.name)) {
    file.remove(file.name)
  }
  
  png(file.name, width = 480, height = 480)
  
  with(household.power.consumption.data.frame,
       plot(Sub_metering_1 ~ Time, 
            type = 'l',
            xlab = '',
            ylab = 'Energy sub metering'))
  
  with(household.power.consumption.data.frame,
       lines(Sub_metering_2 ~ Time, 
            type = 'l',
            col = 'red'))
  
  with(household.power.consumption.data.frame,
       lines(Sub_metering_3 ~ Time, 
             type = 'l',
             col = 'blue'))
  
  legend('topright', col = c(par('col'), 'red', 'blue'), lty = c(1,1), legend = c('Sub_metering_1',
                                                                                  'sub_metering_2',
                                                                                  'sub_metering_3'))
  
  dev.off()
}

MakePlot3()
