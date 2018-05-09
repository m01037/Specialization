# readxl package is used for reading the excel file
library(readxl)
# Shiny is used for creating the application
library(shiny)
#randomForest is used for creating the decision tree
library(randomForest)
# Used for creating graphs
library(ggplot2)
# Used for data manipulation
library(dplyr)

data <- read_excel("E:/Specialization/data/p.xlsx")

data$Gender <- as.factor(data$Gender)

summary(as.factor(data$Specialization))

rf_model <- randomForest(factor(Specialization) ~ Gender + SAT + Math + Percentage,
                         data = data)