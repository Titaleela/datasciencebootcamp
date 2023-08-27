#install.packages("tidyverse")
#dplyr tidyr ggplot2
library(tidyverse)

#data frame give all the lines you need vs. tibble only gives 10 lines
df_tibble <- tibble(id = 1:3, name = c("tita","yuko","tul"))
df <- data.frame(id = 1:3, name = c("tita","yuko","tul"))

df_tibble
df

#convert the dataframe to tibble 
mtcars
mtcars_tibble <- tibble(mtcars)

#sample 
set.seed(42)
sample_n(mtcars, size = 5)

sample_frac(mtcars, size = 0.5, replace = T)

#slice 
mtcars %>% 
  slice(1:5)

mtcars %>% 
  slice(c(1,3,5,7))

mtcars %>% 
  slice( sample(nrow(mtcars), 10))

        