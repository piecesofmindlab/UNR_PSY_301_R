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

custom_colors = c(rgb(1.0, 0.2, 0.2), rgb(1.0, 0.5, 0.0), rgb(1.0, 0.9, 0.4), rgb(0.0, 0.9, 0.4), rgb(0.0, 0.4, 0.9))
#custom_colors = 'DarkRed'
ggplot(to_plot) +
  # This specifies what columns in your to_plot data frame are to be plotted 
  # as x and y here.
  geom_bar( aes(x=relationship, y=mean_gpa), color='black', fill=custom_colors, stat="identity", alpha=1.0, size=1.25) +
  # This next line, if un-commented, can (optionally) change the appearance of the plot - 
  # check out other themes at: https://ggplot2.tidyverse.org/reference/ggtheme.html
  # Base size here affects all fonts in figure (it scales them proportionally)
  theme_classic(base_size=24) + 
  # Rotate labels on x axis, set axis line widths (and color)
  theme(axis.text.x = element_text(angle=60, hjust=1, vjust=1),
        axis.line=element_line(size=1.25)) +  # color='black', 
  # This adds error bars - here, mean_gpa and sem_gpa are the columns for mean
  # and standard error of the mean (SEM) above in the `summarize` line. You want
  # the error bars to go from the mean minus the SEM to the mean plus the SEM
  # "size" here controls width of lines, alpha controls their transparency, and
  # 'width' governs how wide across the top of the bar they are.
  geom_errorbar( aes(x=relationship, ymin=mean_gpa-sem_gpa, ymax=mean_gpa+sem_gpa), width=0.3, colour="black", alpha=1.0, size=1.25) +
  labs(title='GPA by relationship status',
       y="GPA",
       x="Relationship status")

ggsave(
  # This is where you change what you want to call the file you save!
  'example_bar.png',
  # This specifies that you want it written to the figures directory
  path = 'figures/',
  scale = 1,
  # Specifies size of plot in the `units` specified below
  width = 7,
  height = 7,
  units = "in",
  # Pixel resolution (300 is fairly high, should look nice)
  dpi = 300,
  limitsize = TRUE,
)