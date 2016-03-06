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

par(mfcol = c(2,2), mar = c(4,4,2,1))

# Plot the 1st line chart
plot(plot_df$DateTime, plot_df$Global_active_power,
     type = "l",
     xlab = "", ylab = "Global Active Power (kilowats)")

# Plot the 2nd line chart
plot(plot_df$DateTime, plot_df$Sub_metering_1,
     type = "l",
     xlab = "", ylab = "Energy sub metering")

lines(plot_df$DateTime, plot_df$Sub_metering_2, col="blue")

lines(plot_df$DateTime, plot_df$Sub_metering_3, col="red")

legend("topright", col = c("black","blue","red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1)

# plot the 3rd line chart
plot(plot_df$DateTime, plot_df$Voltage,
     type = "l",
     xlab = "datetime", ylab = "Voltage")


# plot the 4th line chart
plot(plot_df$DateTime, plot_df$Global_reactive_power,
     type = "l",
     xlab = "datetime", ylab = "Global Reactive Power")

# Copy the plot to a png file device
dev.copy(png, file = "plot4.png")

# Close the png file device
dev.off()