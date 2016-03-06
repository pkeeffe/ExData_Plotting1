library(dplyr)

# Set the current device to the screen
dev.set(2)

# Set up my working directory
setwd("d:/dev/coursera/EXData_Plotting1")

# Read in the data file stored in a called data in the parent directory
energy_df <- read.table(file="../data/household_power_consumption.txt",
                        sep=";",
                        header=TRUE, 
                        na.strings = "?", 
                        colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

energy_df <- mutate(energy_df, Date = as.Date(Date,format = "%d/%m/%Y", tx = ""))

# Subset the dataset for only dates required for plotting exercise
data <- subset(energy_df, Date >= "2007-02-01" & Date <= "2007-02-02")

# Plot the histogram.
hist(data$Global_active_power, 
     xlab = "Global Active Power (kilowats)",
     ylab = "Frequency",
     col = "red",
     main = "Global Active Power")

# Copy the plot to a png file device
dev.copy(png, file = "plot1.png")

# Close the png file device
dev.off()