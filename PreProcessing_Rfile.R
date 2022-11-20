#installing packages
install.packages("readxl")
install.packages("tidyverse")

library("readxl")
#setting working directory
setwd("C:/Users/Garvit Batra/Desktop/Garvit/VideoGame Sales Dashboard")

#reading different excel files
vgsales1 <- read_excel("vgsales_1.xlsx")
vgsales2 <- read_excel("vgsales_2.xlsx")
vgsales3 <- read_excel("vgsales_3.xlsx")
head(vgsales1)
head(vgsales2)
head(vgsales3)

#merging into one VGSALES file
VGSALES <- cbind(vgsales1,vgsales2,vgsales3)
summary(VGSALES)

#Removing NA values
library("tidyr")
sum(is.na(VGSALES))
VGSALES <- VGSALES%>%drop_na()
sum(is.na(VGSALES))

#Removing the existing Serial number column
VGSALES = subset(VGSALES,select = -c(Rank))

#Adding Serial No. column in the final dataset
numberOfRows <- nrow(VGSALES)
numberOfRows
S_No <- seq(1,numberOfRows)
S_No <- matrix(S_No)
VGSALEs <- cbind(S_No,VGSALES) 
write.csv(VGSALES,"C:/Users/Garvit Batra/Desktop/Garvit/VideoGame Sales Dashboard")
