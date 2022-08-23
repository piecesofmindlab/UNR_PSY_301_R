# Make sure R can load excel files
library(readxl)

# Load data for one subject from psytoolkit
data_posner_unlabeled = read.table('data/posner_cueing.2021-03-05-0520.data.dd4dafa5-895d-4a19-9a14-25d74ba44fa4.txt')