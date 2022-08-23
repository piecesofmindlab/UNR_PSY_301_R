# Plot data using ggplot

library(ggplot2)
library(dplyr)
library(readxl)

# Your data file here!
data = read_excel(file.path('data', 'PSY301_StudentData_fin.xlsx'))

######################## Example 3: Grouped bar plot. ########################
# Suitable if you have more than one IV, and are planning to do an ANOVA.

data <- read.table(file.path('data','group_bar_example.xlsx'))

ggplot(data, aes(x=fruit, y=people, fill=group)) + 
  geom_bar(stat="identity", position=position_dodge())

ggsave(
  'example_grouped_bar_simple.png',
  path = 'figures/',
  scale = 1,
  width = 7,
  height = 4,
  units = "in",
  dpi = 300,
  limitsize = TRUE,
)