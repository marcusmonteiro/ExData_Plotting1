source('load_household_power_consumption_data_frame.R')

MakePlot1 <- function() {
  file.name <- 'plot1.png'
  
  if (file.exists(file.name)) {
    file.remove(file.name)
  }
  
  png(file.name, width = 480, height = 480)
  
  hist(household.power.consumption.data.frame$Global_active_power, 
       col = 'red',
       main = 'Global Active Power',
       xlab = 'Global Active Power (kilowatts)')
  
  dev.off()
}

MakePlot1()
