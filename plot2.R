source('load_household_power_consumption_data_frame.R')

MakePlot2 <- function() {
  file.name <- 'plot2.png'
  
  if (file.exists(file.name)) {
    file.remove(file.name)
  }
  
  png(file.name, width = 480, height = 480)
  
  with(household.power.consumption.data.frame,
       plot(Global_active_power ~ Time, 
            type = 'l',
            xlab = '',
            ylab = 'Global Active Power (kilowatts)'))
  
  dev.off()
}

MakePlot2()
