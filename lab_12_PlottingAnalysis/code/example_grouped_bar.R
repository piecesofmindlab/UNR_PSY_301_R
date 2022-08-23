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
  summarize(mean_gpa=mean(gpa), sem_gpa=sd(gpa) / sqrt(n()), nppl=n())

# The initial line here specifies the data to be used (to_plot data frame, 
# created above), and what should go on the X and Y axes, as well as what 
# variable should be used to fill in the colors of the bars (fill=...)
ggplot(to_plot, aes(x=gender, y=mean_gpa, fill=relationship)) + 
  # This line can (optionally) change the appearance of the plot - 
  # check out other themes at: https://ggplot2.tidyverse.org/reference/ggtheme.html
  #theme_classic() + 
  geom_bar(stat="identity", position=position_dodge()) +
  # This adds error bars - here, mean_gpa and sem_gpa are the columns for mean
  # and standard error of the mean (SEM) above in the `summarize` line. You want
  # the error bars to go from the mean minus the SEM to the mean plus the SEM
  geom_errorbar(aes(ymin=mean_gpa-sem_gpa, ymax=mean_gpa+sem_gpa), position=position_dodge()) + 
  labs(title='GPA by relationship status & gender',
       y="GPA",
       x="Gender",
       fill='Relationship status')

ggsave(
  # This is where you change what you want to call the file you save!
  'example_grouped_bar.png',
  # This specifies that you want it written to the figures directory
  path = 'figures/',
  scale = 1,
  # Specifies size of plot in the `units` specified below
  width = 7,
  height = 4,
  units = "in",
  # Pixel resolution (300 is fairly high, should look nice)
  dpi = 300,
  limitsize = TRUE,
)