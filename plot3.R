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
plot_df <- subset(energy_df, Date >= "2007-02-01" & Date <= "2007-02-02")

plot_df$DateTime <- strptime(paste(plot_df$Date, plot_df$Time), format = "%Y-%m-%d %H:%M:%S", tz = "")

# Plot the line chart
plot(plot_df$DateTime, plot_df$Sub_metering_1,
     type = "l",
     xlab = "", ylab = "Energy sub metering")

lines(plot_df$DateTime, plot_df$Sub_metering_2, col="blue")

lines(plot_df$DateTime, plot_df$Sub_metering_3, col="red")

legend("top", col = c("black","blue","red"), legend = c("Sub metering 1","Sub metering 2","Sub metering 3"), lty=1,bty="n")

# Copy the plot to a png file device
dev.copy(png, file = "plot3.png")

# Close the png file device
dev.off()