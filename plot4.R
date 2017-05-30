source('load_household_power_consumption_data_frame.R')

MakePlot4 <- function() {
  file.name <- 'plot4.png'
  
  if (file.exists(file.name)) {
    file.remove(file.name)
  }
  
  png(file.name, width = 480, height = 480)
  
  par(mfrow = c(2, 2))
  
  GlobalActivePowerTimePlot <- function() {
    with(household.power.consumption.data.frame,
         plot(Global_active_power ~ Time, 
              type = 'l',
              xlab = '',
              ylab = 'Global Active Power (kilowatts)'))
  }
  
  VoltageTimePlot <- function() {
    with(household.power.consumption.data.frame,
         plot(Voltage ~ Time, 
              type = 'l',
              xlab = 'datetime',
              ylab = 'Voltage'))
  }
  
  SubMeteringsTimePlot <- function() {
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
  }
  
  GlobalReactivePowerTimePlot <- function() {
    with(household.power.consumption.data.frame,
         plot(Global_reactive_power ~ Time, 
              type = 'o',
              xlab = 'datetime'))
  }
  
  GlobalActivePowerTimePlot()
  VoltageTimePlot()
  SubMeteringsTimePlot()
  GlobalReactivePowerTimePlot()
  
  dev.off()
}

MakePlot4()
