
setwd("C:/Users/Desktop/Coursera/Data Science Specialization/4. Exploratory Data Analysis/Project 1") #change this to your working directory
unzip("exdata%2Fdata%2Fhousehold_power_consumption.zip", exdir = getwd())

#### Import Data ####

# Measurements of electric power consumption in one household with a one-minute sampling rate 
# over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.

hpc <- read.table("./household_power_consumption.txt", sep = ';', header = T, na.strings = "?", colClasses = c("character", "character", "numeric", 
                                                                                                               "numeric", "numeric", "numeric",
                                                                                                               "numeric", "numeric", "numeric"))
names(hpc) <- tolower(names(hpc)) #change variable names to lower case

library(tidyverse)
hpc_data <- hpc %>% filter(date %in% c('1/2/2007', '2/2/2007'))

# Q3.
hpc_data$date_time <- strptime(paste(hpc_data$date, hpc_data$time, sep = " "), "%d/%m/%Y %H:%M:%S")

library(lattice)
png("plot4.png", width=480, height = 480)
par(mfrow=c(2,2), mar=c(4,4,2,1))
with(hpc_data, {
  plot(hpc_data$date_time,
       hpc_data$global_active_power,
       type = "l",
       xlab = "",
       ylab = "Global Active Power")
  plot(hpc_data$date_time,
       hpc_data$voltage,
       type = "l",
       xlab = "datetime",
       ylab = "Voltage")
  plot(hpc_data$date_time,
       hpc_data$sub_metering_1,
       type = "l",
       ylab = "Energy sub metering")
  lines(hpc_data$date_time,
        hpc_data$sub_metering_2,
        col = "red")
  lines(hpc_data$date_time,
        hpc_data$sub_metering_3,
        col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 2, col = c("black", "red", "blue"))
  plot(hpc_data$date_time,
       hpc_data$global_reactive_power,
       type = "l",
       xlab = "datetime",
       ylab = "Global_reactive_power")
})
dev.off()