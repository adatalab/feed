library(dplyr)

dd <- na_if(feed_nias, 0)
df <- janitor::clean_names(dd)

feed_nias <- df

summary(df)
