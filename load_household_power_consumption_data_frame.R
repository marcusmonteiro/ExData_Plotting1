source('install_and_load_required_packages.R')

DownloadHouseholdPowerConsumptionDataSet <- function() {
  # Download the project's data set if the data set directory does not exists.
  
  data.set.file <- 'household_power_consumption.txt' 
    
  if (!file.exists(data.set.file)) {
    data.set.url <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
    temp <- tempfile()
    download.file(data.set.url, temp)
    unzip(temp)
  }
}

MakeHouseholdPowerConsumptionDataFrame <- function() {
  DownloadHouseholdPowerConsumptionDataSet()
  
  data.set <- 
    fread('household_power_consumption.txt', na.strings = '?', sep = ';') %>%
    filter(Date == '1/2/2007' | Date == '2/2/2007') %>%
    mutate(Time = dmy_hms(paste(Date, Time)), Date = dmy(Date))
  
  data.set
}

if (!exists('household.power.consumption.data.frame')) {
  household.power.consumption.data.frame <- MakeHouseholdPowerConsumptionDataFrame()
}