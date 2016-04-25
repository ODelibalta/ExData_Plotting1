# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
# Name each of the plot files as plot1.png, plot2.png, etc.
# Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, 
# Add the PNG file and R code file to the top-level folder of your git repository (no need for separate sub-folders)

#set working dir
setwd('/home/odelibalta/Documents/Study/Coursera/DataScientist/4_Exploratory_Data_Analysis/Week1/Assignment')

# I do not wish to download the source file everytime I source this script
if ( !file.exists("p_data.zip") ){
      
      # get the source data
      download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
                    , destfile='p_data.zip')
      
      unzip('p_data.zip',overwrite=TRUE)
}  
## in every plot file 
data_csv <- read.csv('household_power_consumption.txt',header=T, sep=';') 
data_csv$Date <- as.Date(data_csv$Date,'%d/%m/%Y') 
data_csv <- subset(data_csv, Date == '2007-02-01' | Date == '2007-02-02')

# adjustment of the data type for hte histogram
data_csv$Global_active_power <- as.numeric( as.character( data_csv$Global_active_power ) ) 

# draw plot
png('plot1.png',width=480,height=480)
hist( data_csv$Global_active_power
      , col  = 'red' 
      , xlab = 'Global Active Power (kilowatts)'
      , ylab = 'Frequency' 
      , main = 'Global Active Power')
dev.off() # !! turn off device - very important












