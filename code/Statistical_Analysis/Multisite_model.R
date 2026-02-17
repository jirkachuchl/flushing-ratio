library(asreml)
library(asremlPlus)
source("pin.R")

list.files()

data <- read.csv("DataFull.csv")
data <- data[order(data$row),]
data <- data[order(data$col),]
data <- data[order(data$site),]

# data <- read.csv("Site1.csv")
# data <- read.csv("Site2.csv")

model1 <- asreml(fixed     = VS25 ~ 1 + site,
                 random    = ~ corh(site):clone.new,
                 residual  = ~dsum(~ar1(col):ar1(row) | site),
                 data      = data,
                 na.action = na.method(y="include", x="include"))
model1 <- update.asreml(model1)
summary(model1)$varcomp

# Type B genetic correlation
summary(model1)$varcomp[1,]

# Site differences 
wald(model1)

# H2 multisite
pin(model1,h2_T~(V2+V3)/ (V2+V3+V4+V7))

# H2 Site 1 Hermanky
pin(model1,h2_T~(V2)/ (V2+V4))

# H2 Site 2 Lisice
pin(model1,h2_T~(V3)/ (V3+V7))
