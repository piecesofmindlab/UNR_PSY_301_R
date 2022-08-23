# Plot data using ggplot

library(ggplot2)
library(dplyr)
library(readxl)

# Your data file here!
data = read_excel('data/group2g_39111_7156250_1-Data + GPA +3-2.xlsx')

data = data %>% 
  rename(work_hours = 'Work Hours') %>% 
  rename(gpa = GPA)

######################## Example 1: Scatter plot  ########################
# Suitable for two CONTINUOUS variables, plotting one against another. 
# For your experiments, this will likely be an IV column against a DV column 
# (so "age" and "gpa" will need to be changed to whatever your IV and DV are)
ggplot(data, aes(x=work_hours, y=gpa)) +
  theme_light(base_size = 20) + 
  geom_point(size=2, shape=23) +
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