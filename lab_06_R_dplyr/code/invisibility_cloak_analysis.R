# Basic script without fancy markdown

# Get useful libraries
library(dplyr)
library(readxl)

# Load data
data_within = readxl::read_excel('data/invisibility_cloak_within_subj.xlsx')

# Compute means
cond_means_within = data_within %>% 
  group_by(condition) %>% 
  summarize(grp_means=mean(n_mischief), n_participants=n())

# View results
View(cond_means_within)

# Make plots
barplot(cond_means_within$grp_means, names.arg = cond_means_within$condition, ylab = 'Mean acts of mischief', main= 'Within Subject Design')
