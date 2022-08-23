# Template for experiment analysis: plotting

# Enable R to load excel files and do parsing of data by condition
library(readxl)
library(dplyr)

# Load data - NOTE: you will need to have copied your data to the folder for this 
data_within = read_excel('data/invisibility_cloak_within_subj.xlsx')

# Compute mean, number of participants, and standard error of the mean for each condition
cond_means_within = data_within %>% 
  group_by(condition) %>% 
  summarize(grp_means=mean(n_mischief), n_participants=n(), sem=sd(n_mischief)/sqrt(n()))

# View results (this opens the new data frame called "cond_means_within" in the varible viewer)
View(cond_means_within)