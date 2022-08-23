# Plot data using ggplot

library(ggplot2)
library(dplyr)
library(readxl)

# Your data file here!
data = read_excel(file.path('data', 'PSY301_StudentData_fin.xlsx'))

######################## Example 3: Grouped bar plot. ########################
# Suitable if you have more than one IV, and are planning to do an ANOVA.

to_plot = data %>% 
  filter(relationship != 'Married') %>% 
  filter(relationship != 'Casually dating') %>% 
  filter(gender != 'Other') %>% 
  group_by(gender, relationship) %>% 
  summarize(mean_gpa=mean(gpa), sem_gpa=sd(gpa) / sqrt(n()))

ggplot(to_plot, aes(x=gender, y=mean_gpa, fill=relationship)) + 
  #theme_classic() + 
  geom_bar(stat="identity", position=position_dodge())

ggsave(
  'example_grouped_bar.png',
  path = 'figures/',
  scale = 1,
  width = 7,
  height = 4,
  units = "in",
  dpi = 300,
  limitsize = TRUE,
)