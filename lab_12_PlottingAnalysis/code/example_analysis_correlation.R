# Plot data using ggplot

library(ggplot2)
library(dplyr)
library(readxl)

# Your data file here!
class = read_excel('data/PSY301_StudentData_fin.xlsx')

# Correlation test
cor_model = cor.test(class$age, class$gpa, method='pearson')
cor_model