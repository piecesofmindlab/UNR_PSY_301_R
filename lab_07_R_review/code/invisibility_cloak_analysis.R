# Make a basic plot of invisibility cloak data

# Enable R to load excel files and do parsing of data by condition
library(readxl)
library(dplyr)

# Load data
data_within = read_excel('data/invisibility_cloak_within_subj.xlsx')

# Compute mean, number of participants, and standard error of the mean for each condition
cond_means_within = data_within %>% 
  group_by(condition) %>% 
  summarize(grp_means=mean(n_mischief), n_participants=n(), sem=sd(n_mischief)/sqrt(n()))

# View results (this opens the new data frame called "cond_means_within" in the varible viewer)
View(cond_means_within)

# Make a plot
ggplot(cond_means_within) +
  # Specify the type of plot:
  geom_bar( aes(x=condition, y=grp_means), stat='identity', fill='darkgray', color='black') +
  # Font information:
  theme_classic(base_size=20, base_family='sans') + 
  # Error bars:
  geom_errorbar( aes(x=condition, ymin=grp_means-sem, ymax=grp_means+sem), width=0.3, color="black", alpha=1.0, size=0.75) +
  # Labels:
  labs(title='Invisibility cloak results',
       y="Mean acts of mischief (count)",
       x="Condition")

# Save the plot
ggsave(
  # Name for the file:
  'invisibility_cloak_orig.png',
  # Directory (from base project directory) in which to save:
  path = 'figures/',
  # (ignore this)
  scale = 1,
  # Width of plot, in whatever units are specified below
  width = 4,
  # Height of the plot, in whatever units are specified below
  height = 5,
  # Units for width and height. Can be 'in', 'mm', or 'cm'
  units = "in",
  # resolution for saved figure; i.e. How many pixels per inch
  dpi = 300,
  limitsize = TRUE,
)