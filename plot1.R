
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

# Q1.
png("plot1.png", width=480, height = 480)
hist(hpc_data$global_active_power,
     # breaks = 17,
     col="red",
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency"
)
dev.off()
