install.packages("dplyr")


#load packages 
library(dplyr)

#read csv file 
imdb <- read.csv("imdb.csv", stringsAsFactors = FALSE)
View(imdb)

#data structure 
glimpse(imdb)

#print head and tail
head(imdb, 10)
tail(imdb, 10)

#select col
select(imdb, MOVIE_NAME, RATING)
select(imdb, 1,5)

select(imdb, movie_name = MOVIE_NAME, release_year = YEAR)

#pipe operator 
head(imdb)
imdb %>% 
  select(movie_name = MOVIE_NAME, release_year = YEAR) %>%
  head(10)

#filter 
filter(imdb, SCORE >= 9.0)

imdb %>% 
  filter(SCORE >= 9.0)

names(imdb) <- tolower(names(imdb))

imdb %>% 
  select(movie_name, year, score) %>%
  filter(score >= 9.0 & year > 2000)

imdb %>%
  select(movie_name, length, score) %>%
  filter( score == 8.8 | score == 8.3 | score == 9.0)

imdb %>%
  select(movie_name, length, score) %>%
  filter(score %in% c(8.3, 8.8, 9.0))

#filter string 
imdb %>%
  select(movie_name, genre, rating) %>%
  filter(grepl("Drama", imdb$genre))

imdb %>%
  select(movie_name) %>%
  filter(grepl("The", imdb$movie_name))


##create new column
imdb %>%
  select(movie_name, score, length) %>%
  mutate(score_group = if_else(score >=9, "High Rating", "Low Rating"),
         length_group = if_else(length >= 120, "Long Film", "Short Film"))

##arrange data
head(imdb)

imdb %>%
  arrange(desc(length)) %>%
  head(10)

imdb %>%
  arrange(rating, desc(length)) %>%
  head(10)

##summerise & group by --> always tgt 
imdb %>%
  filter(rating != "") %>%
  group_by(rating) %>%
  summarise(mean_length = mean(length),
            sd_length = sd(length),
            sum_length = sum(length),
            min_length = min(length),
            max_length = max(length),
            n = n())

##join data 
favourite_films <- data.frame(id = c(5,10,15,30,98))

favourite_films %>%
  inner_join(imdb, by = c("id" = "no"))


##write CSV file 
imdb_prep <- imdb %>%
  select(movie_name, release_year = year, rating, length, score) %>%
  filter(rating == "R" & release_year > 2000)

#export data
write.csv(imdb_prep, "imdb_prep.csv", row.names = FALSE)

##end session part 1
