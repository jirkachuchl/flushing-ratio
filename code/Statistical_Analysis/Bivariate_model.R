library(asreml)
library(asremlPlus)
source("pin.R")

list.files()

data <- read.csv("DataFull.csv")
data <- data[order(data$row),]
data <- data[order(data$col),]
data <- data[order(data$site),]

for (i in 1:6) {
  data[,i] <- as.factor(data[,i])
}

# data <- read.csv("Site1.csv")
# data <- read.csv("Site2.csv")

modelC <- asreml(fixed=cbind(FR_24,FR_25)~1,
                 random    = ~corgh(trait):clone.new,
                 residual  = ~id(units):corgh(trait),
                 data      = data,
                 na.action = na.method(y="include", x="include"))
modelC <- update.asreml(modelC)
summary(modelC)$varcomp

# Type A Genetic correlations
summary(modelC)$varcomp[1,]

# Zero model
model0 <- asreml(fixed     = cbind(FR_24,FR_25)~1,
                 random    = ~diag(trait):clone.new,
                 residual  = ~id(units):corgh(trait),
                 data      = data,
                 na.action = na.method(y="include", x="include"))
model0 <- update.asreml(model0)

# Likelihood-Ratio Test for statistical significance
lrt(modelC, model0, boundary = FALSE)
