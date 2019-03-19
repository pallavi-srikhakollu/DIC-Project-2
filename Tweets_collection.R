library("twitteR")
library("ROAuth")
library(dplyr)

###### Setting up twitter api keys to fetch tweets ############################

# Stored my keys in environment varaible with names : TWITTER_CONSUMER_KEY,TWITTER_CONSUMER_SECRET_KEY,

consumer_key = Sys.getenv("TWITTER_CONSUMER_KEY")
consumer_secret_key = Sys.getenv("TWITTER_CONSUMER_SECRET_KEY")
access_token = Sys.getenv("TWITTER_ACCESS_TOKEN")
access_secret_token = Sys.getenv("TWITTER_ACCESS_SECRET")

setup_twitter_oauth(consumer_key,consumer_secret_key,access_token,access_secret_token)

#######################################################################################
tweets <- searchTwitter("#NFL",  lang = "en", n = 15000)
tweets.df <-twListToDF(tweets)
#write.table(tweets.df, "Documents/DIC/tweets.csv", sep = ",", col.names = T, append = T)
if (file.exists("/Users/Pallavi/Documents/DIC-Project-2/NFLTweets.csv")) {
  write.table(tweets.df, file = "/Users/Pallavi/Documents/DIC-Project-2/NFLTweets.csv", append = TRUE, col.names = FALSE, row.names = FALSE, sep = ",")
} else {
  write.table(tweets.df, file = "/Users/Pallavi/Documents/DIC-Project-2/NFLTweets.csv", col.names = TRUE, row.names = FALSE, sep = ",")
}



############################
tweets_r.df <- read.csv("/Users/Pallavi/Documents/DIC-Project-2/NFLTweets.csv",row.names = NULL)
tweets_1 <- tweets_r.df %>% distinct(id,.keep_all = TRUE)

tweets_location_unique <- tweets_1 %>%  filter((isRetweet == FALSE),1,all())

write.csv(tweets_location_unique,file = "/Users/Pallavi/Documents/DIC-Project-2/NFLFilteredTweets.csv", row.names = FALSE)
