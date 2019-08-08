library(dplyr)

dd <- na_if(feed_nias, 0)
df <- janitor::clean_names(dd)

str(df)
