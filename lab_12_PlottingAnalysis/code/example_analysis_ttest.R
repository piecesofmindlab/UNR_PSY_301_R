# Plot data using ggplot

#library(tidyr)
library(ggplot2)
library(dplyr)
library(readxl)

# Your data file here!
cloak = read_excel('data/invisibility_cloak_within_subj.xlsx')
class = read_excel('data/PSY301_StudentData_fin.xlsx')

# T Test
t_model = t.test(n_mischief ~ condition, paired=TRUE, data=cloak)
t_model