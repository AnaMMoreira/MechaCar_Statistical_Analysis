### CHALLENGE 15: DELIVERABLE 1  
## Linear Regression to Predict MPG

# 3. Using the library() function to load the dplyr package
library(dplyr)

#4. Importing and reading in the MechaCar_mpg.csv file as a dataframe.
library(tidyverse)
mecha_mpg <- read.csv(file='./Resources/MechaCar_mpg.csv',check.names=F,stringsAsFactors = F) 

#5. Performing linear regression using the lm() function
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_mpg)

#6. determining the p-value and the r-squared value for the linear regression model.
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_mpg)) 


### CHALLENGE 15: DELIVERABLE 2

#2. Importing Suspension_Coil.csv file as a table
mecha_coil <- read.csv(file='./Resources/Suspension_Coil.csv',check.names=F,stringsAsFactors = F) 

#3. Creating a total_summary dataframe using the summarize() function to get:
#mean, median, variance, and standard deviation of the suspension coil’s PSI column.
total_summary <- mecha_coil %>% summarize(Mean_PSI=mean(PSI),
                                          Median_PSI=median(PSI),
                                          Var_PSI=var(PSI),
                                          SD_PSI=sd(PSI),
                                          Num_Coil=n(), .groups = 'keep') 

#4. Creating a lot_summary dataframe using the group_by() and the summarize() functions to group each manufacturing lot.                                                                
lot_summary <- mecha_coil  %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI),
                                                                         Median_PSI=median(PSI),
                                                                         Var_PSI=var(PSI),
                                                                         SD_PSI=sd(PSI),
                                                                         Num_Coil=n(), .groups = 'keep')                                      

### CHALLENGE 15: DELIVERABLE 3

#1. using t.test() to determine if the PSI across ALL lots
#is statistically different from the population mean of 1,500 PSI.
t.test(mecha_coil$PSI,mu=1500)


#2. Using t.test() function 3 more times with subset() 
#to determine if PSI for each manufacturing lot is statistically different from the population mean of 1,500 PSI
lot1 <- subset(mecha_coil, Manufacturing_Lot=="Lot1")
lot2 <- subset(mecha_coil, Manufacturing_Lot=="Lot2")
lot3 <- subset(mecha_coil, Manufacturing_Lot=="Lot3")

t.test(lot1$PSI,mu=1500)
t.test(lot2$PSI,mu=1500)
t.test(lot3$PSI,mu=1500)
