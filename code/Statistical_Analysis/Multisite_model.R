library(asreml)
library(asremlPlus)
source("pin.R")

list.files()

read.csv("DataFull.csv")
data <- DataFull
data <- data[order(data$row),]
data <- data[order(data$col),]
data <- data[order(data$site),]

load("hermanky.Rdata")
data<-hermanky

load("lisice.Rdata")
data<-lisice
