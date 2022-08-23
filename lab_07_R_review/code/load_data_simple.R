# Make sure R can load excel files
library(readxl)

# Load within-subjects data for invisibility cloak example experiment
data_within = read_excel('data/invisibility_cloak_within_subj.xlsx')

# Load data for one subject from psytoolkit
data_posner_unlabeled = read.table('data/psytoolkit_demo/posner_cueing.2021-03-05-0520.data.dd4dafa5-895d-4a19-9a14-25d74ba44fa4.txt')

# Load data for one subject from psytoolkit, but also add column names!
# this is how you create a list of values - e.g. column names - in R:
column_names = c('cue_location', 'target_location', 'cue_validity', 'cue_presence', 'cue_binary', 'rt', 'correct')
# Specify which file to load
file_to_load = 'data/psytoolkit_demo/posner_cueing.2021-03-05-0520.data.dd4dafa5-895d-4a19-9a14-25d74ba44fa4.txt'
# pass both file and column names to loading function
data_posner_labeled = read.table(file_to_load, , col.names = column_names)
