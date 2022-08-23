# Plot data using ggplot

library(ggplot2)
library(dplyr)
library(readxl)

# Your data file here!
data = read_excel(file.path('data', 'group2f_70590_7159711_Emotion Survey_combined.xlsx'))

######################## Example 1: Scatter plot  ########################
# Suitable for two CONTINUOUS variables, plotting one against another. 
# For your experiments, this will likely be an IV column against a DV column 
# (so "age" and "gpa" will need to be changed to whatever your IV and DV are)
ggplot(data, aes(x=work_hours, y=gpa)) +
  # Base size here affects all fonts in figure (it scales them proportionally)
  theme_classic(base_size=21) + 
  # Set the axis width (1.25 points) and optionally color (color='black' or whatever will need to go inside parentheses)
  theme(axis.line=element_line(size=1.25)) +  # , color='black')) + 
  # For a list of possible shapes: http://www.sthda.com/english/wiki/ggplot2-point-shapes
  # alpha here is the transparency of the points
  geom_point(size=6, shape=19, fill='black', alpha=0.5) +
  labs(title='Work hours vs GPA',
       y="GPA",
       x="Work hours")

ggsave(
  'example_scatter.png',
  path = 'figures/',
  scale = 1,
  width = 7,
  height = 4,
  units = "in",
  dpi = 300,
  limitsize = TRUE,
)