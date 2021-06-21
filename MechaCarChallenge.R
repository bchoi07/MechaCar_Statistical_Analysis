library(dplyr)

# Importing MechaCar data file
mpg_table <- read.csv(file='MechaCar_mpg.csv')

# Performing linear regression with all six variables
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mpg_table)

# Finding p-values and r-squared for linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mpg_table))

# Importing suspension coil data file
sus_table <- read.csv(file='Suspension_Coil.csv')

# Creating table of summary statistics
total_summary <- sus_table %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

# Creating table of summary statistics by lot number
lot_summary <- sus_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

# Performing t-tests on whether mean is different from pop mean of 1500 PSI
t.test(sus_table$PSI, mu=1500)
t.test(subset(sus_table$PSI, sus_table$Manufacturing_Lot == 'Lot1'), mu=1500)
t.test(subset(sus_table$PSI, sus_table$Manufacturing_Lot == 'Lot2'), mu=1500)
t.test(subset(sus_table$PSI, sus_table$Manufacturing_Lot == 'Lot3'), mu=1500)
