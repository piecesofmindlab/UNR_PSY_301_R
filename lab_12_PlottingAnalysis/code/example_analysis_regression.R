#library(tidyr)
library(ggplot2)
library(dplyr)
library(readxl)

# Your data file here!
class = read_excel('data/PSY301_StudentData_fin.xlsx')

# Clip out some rows to minimize the complexity here
class_clipped = class %>% 
  filter(gender != 'Other') %>% 
  filter(relationship != 'Casually dating') %>% 
  filter(relationship != 'Married') %>% 
  filter(relationship != 'Single, Casually dating')

# ANOVA
regression_model = lm(gpa ~ relationship + gender + relationship:gender, data=class_clipped)
summary(regression_model)
