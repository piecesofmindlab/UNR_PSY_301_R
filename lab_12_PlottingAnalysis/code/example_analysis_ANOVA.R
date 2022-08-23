# Plot data using ggplot

#library(tidyr)
library(ggplot2)
library(dplyr)
library(readxl)

# Your data file here!
class = read_excel('data/PSY301_StudentData_fin.xlsx')

# Clip out some rows to minimize the complexity here
class_clipped = class %>% 
  # These filter commands cut rows (observations) out of the data. 
  # Here, they are used to get rid of a few relationship categories with only 
  # a few responses so the statistics are more similar to what you will see.
  # You can use filter commands in this way to e.g. cut outliers from your data
  # If you do clip outliers: (1) (but be sure to have a good reason to do so, 
  # and (2) be sure you talk about any how you decided to define outliers 
  # in your write-up for lab (and ultimately, in your methods of your poster & 
  # final paper)
  filter(gender != 'Other') %>% 
  filter(relationship != 'Casually dating') %>% 
  filter(relationship != 'Married') %>% 
  filter(relationship != 'Single, Casually dating')

# ANOVA
# All the variables here in the formula (gpa ~ relationship + gender + relationship:gender)
# should be the exact names of columns in your data! By far best here is to make 
# sure that you don't have spaces in your column names, by editing them in Excel 
# or Google sheets. Note that the last thing is the data you are feeding the 
# analysis, which here is the FILTERED version of the data created above.
aov_model = aov(gpa ~ relationship + gender + relationship:gender, data=class_clipped)
summary(aov_model)

TukeyHSD(aov_model)