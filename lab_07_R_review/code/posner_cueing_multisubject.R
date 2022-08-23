library(dplyr)
library(ggplot2)
library(ggthemes)

# Load data
data = readxl::read_excel(file.path('data','psytoolkit_demo','data_anon.xlsx'))

# Count the number of subjects (i.e. the number of rows, 'nrow', in the dataset)
n_subjects = nrow(data)
column_names = c('cue_location', 'target_location', 'cue_validity', 'cue_presence', 'cue_binary', 'rt', 'correct')

# Analyze a whole bunch of subjects
for (i in 1:n_subjects)
{
  # Get the file specific to this subject
  subject_file = data$`posner_cueing:1`[i]
  print("Analyzing subject: ")
  print(subject_file)
  sdata = read.table(file.path('data', 'psytoolkit_demo', subject_file), col.names = column_names)
  # Summarize data
  tmp <- sdata %>%
    filter(correct==1) %>%
    group_by(cue_validity) %>%
    summarize(mean_rt = mean(rt), n=n(), sem=sd(rt)/sqrt(n()))
  # Create new column in subject summary to indicate subject
  new_col = rep(i, nrow(tmp))  
  # Append new column
  tmp[ , ncol(tmp) + 1] = new_col 
  # Rename column name
  colnames(tmp)[ncol(data)] = "subject"  
  
  if (i==1){
    summary_frame = tmp
  } else {
    summary_frame = rbind(summary_frame, tmp)
  }
}
  
# Summarize data across subjects
final_plot <- summary_frame %>%
  group_by(cue_validity) %>%
  summarize(smean_rt = mean(mean_rt), n=n(), sem=sd(mean_rt)/sqrt(n()))

# Make a bar plot
ggplot(final_plot) +
  geom_bar( aes(x=cue_validity, y=smean_rt, fill=cue_validity), color='black', stat="identity", alpha=1.0) +
  theme_classic() + 
  #theme_tufte(base_size=20, base_family='sans') + 
  geom_errorbar( aes(x=cue_validity, ymin=smean_rt-sem, ymax=smean_rt+sem), width=0.3, colour="black", alpha=1.0, size=0.75) +
  labs(title='Posner cueing reaction time',
       y="Reaction time (ms)",
       x="Condition")


ggsave(
  'posner_cueing_orig.png',
  path = 'figures/',
  scale = 1,
  width = 4,
  height = 5,
  units = "in",
  dpi = 300,
  limitsize = TRUE,
)