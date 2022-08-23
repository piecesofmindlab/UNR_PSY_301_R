# Plot data using ggplot

library(ggplot2)
library(dplyr)
library(readxl)

# Your data file here!
data = read_excel(file.path('data', 'PSY301_StudentData_fin.xlsx'))


######################## Example 2: Bar plot. ########################
# Suitable for a CATEGORICAL variable for X and a CONTINUOUS variable for y. 

# To make this type of plot, we will need to summarize and compute error bars!
# This will involve GROUPING by a condition (probably an IV in your case)
# and summarizing across that condition by e.g. computing the mean. 

# Here, we will look at relationship status and GPA.
to_plot = data %>%
  group_by(relationship) %>%
  summarize(mean_gpa=mean(gpa), sem_gpa=sd(gpa) / sqrt(n()))

# Un-comment this line to look at the resulting data
# View(to_plot)

# Make a bar plot
ggplot(to_plot) +
  geom_bar( aes(x=relationship, y=mean_gpa), color='black', stat="identity", alpha=1.0) +
  # theme_classic() + 
  # theme_tufte(base_size=20, base_family='sans') + 
  #ylim(2, 4) +
  geom_errorbar( aes(x=relationship, ymin=mean_gpa-sem_gpa, ymax=mean_gpa+sem_gpa), width=0.3, colour="black", alpha=1.0, size=0.75) +
  labs(title='GPA by relationship status',
       y="GPA",
       x="Relationship status")

ggsave(
  'example_bar.png',
  path = 'figures/',
  scale = 1,
  width = 7,
  height = 4,
  units = "in",
  dpi = 300,
  limitsize = TRUE,
)