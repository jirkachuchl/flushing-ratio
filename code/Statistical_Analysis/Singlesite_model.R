data <- read.csv("Site1.csv")
# data <- read.csv("Site2.csv")   # Site2 (Lisice) can be calculated only from multisite model, because the year 2024 is missing 

model1 <- asreml(fixed     = RCC_24  ~ 1,
                 random    = ~ clone,
                 residual  = ~ar1(col):ar1(row),
                 data      = data,
                 na.action = na.method(y="include", x="include"))
model1 <- update.asreml(model1)
summary(model1)$varcomp

# H2 Singlesite
pin(model1,h2~V1/(V1+V2))
