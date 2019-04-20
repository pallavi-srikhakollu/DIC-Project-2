library("twitteR")
library("ROAuth")
library(dplyr)

###### Setting up twitter api keys to fetch tweets ############################

# Stored my keys in environment varaible with names : TWITTER_CONSUMER_KEY,TWITTER_CONSUMER_SECRET_KEY,

'consumer_key = Sys.getenv("TWITTER_CONSUMER_KEY")
consumer_secret_key = Sys.getenv("TWITTER_CONSUMER_SECRET_KEY")
access_token = Sys.getenv("TWITTER_ACCESS_TOKEN")
access_secret_token = Sys.getenv("TWITTER_ACCESS_SECRET")

setup_twitter_oauth(consumer_key,consumer_secret_key,access_token,access_secret_token)'
setup_twitter_oauth("ObYMjI0Rm2wBrvWvg0nxI3hnh","qZfFBnx792kKeE2xpptl5Hqa2c50HKloZUR99KAjXhZIDqHxeA"
                    ,"2923806378-mDG9ie7mEPnxgSGhQDGiPbzwOqFrOKrfPlzt5Yf","4jMXTFNoLlbbpesdpJNVoTiPMD40IEyrtHzazmpfC8ErP")

#######################################################################################
#tweets <- searchTwitter("#sports",  lang = "en", n = 5000)
tweets <- searchTwitter("#tennis",  lang = "en", n = 5000)
tweets.df <-twListToDF(tweets)
#write.table(tweets.df, "Documents/DIC/tweets.csv", sep = ",", col.names = T, append = T)
'if (file.exists("/Users/Pallavi/Documents/DIC-Project-2/NFLTweets.csv")) {
  write.table(tweets.df, file = "/Users/Pallavi/Documents/DIC-Project-2/NFLTweets.csv", append = TRUE, col.names = FALSE, row.names = FALSE, sep = ",")
} else {
  write.table(tweets.df, file = "/Users/Pallavi/Documents/DIC-Project-2/NFLTweets.csv", col.names = TRUE, row.names = FALSE, sep = ",")
}'

'if (file.exists("/Users/manasikulkarni/Documents/DIC-Project-2/BasketballTweets.csv")) {
  write.table(tweets.df, file = "/Users/manasikulkarni/Documents/DIC-Project-2/BasketballTweets.csv", append = TRUE, col.names = FALSE, row.names = FALSE, sep = ",")
} else {
  write.table(tweets.df, file = "/Users/manasikulkarni/Documents/DIC-Project-2/BasketballTweets.csv", col.names = TRUE, row.names = FALSE, sep = ",")
}'

'if (file.exists("/Users/manasikulkarni/Documents/DIC-Project-2/GolfTweets.csv")) {
  write.table(tweets.df, file = "/Users/manasikulkarni/Documents/DIC-Project-2/GolfTweets.csv", append = TRUE, col.names = FALSE, row.names = FALSE, sep = ",")
} else {
  write.table(tweets.df, file = "/Users/manasikulkarni/Documents/DIC-Project-2/GolfTweets.csv", col.names = TRUE, row.names = FALSE, sep = ",")
}'

'if (file.exists("/Users/manasikulkarni/Documents/DIC-Project-2/BaseballTweets.csv")) {
  write.table(tweets.df, file = "/Users/manasikulkarni/Documents/DIC-Project-2/BaseballTweets.csv", append = TRUE, col.names = FALSE, row.names = FALSE, sep = ",")
} else {
  write.table(tweets.df, file = "/Users/manasikulkarni/Documents/DIC-Project-2/BaseballTweets.csv", col.names = TRUE, row.names = FALSE, sep = ",")
}'

'if (file.exists("/Users/manasikulkarni/Documents/DIC-Project-2/SwimmingTweets.csv")) {
  write.table(tweets.df, file = "/Users/manasikulkarni/Documents/DIC-Project-2/SwimmingTweets.csv", append = TRUE, col.names = FALSE, row.names = FALSE, sep = ",")
} else {
  write.table(tweets.df, file = "/Users/manasikulkarni/Documents/DIC-Project-2/SwimmingTweets.csv", col.names = TRUE, row.names = FALSE, sep = ",")
}'

if (file.exists("/Users/manasikulkarni/Documents/DIC-Project-2/TennisTweets.csv")) {
  write.table(tweets.df, file = "/Users/manasikulkarni/Documents/DIC-Project-2/TennisTweets.csv", append = TRUE, col.names = FALSE, row.names = FALSE, sep = ",")
} else {
  write.table(tweets.df, file = "/Users/manasikulkarni/Documents/DIC-Project-2/TennisTweets.csv", col.names = TRUE, row.names = FALSE, sep = ",")
}


############################
#tweets_r.df <- read.csv("/Users/Pallavi/Documents/DIC-Project-2/NFLTweets.csv",row.names = NULL)
tweets_r.df <- read.csv("/Users/manasikulkarni/Documents/DIC-Project-2/TennisTweets.csv",row.names = NULL)
tweets_1 <- tweets_r.df %>% distinct(id,.keep_all = TRUE)

tweets_location_unique <- tweets_1 %>%  filter((isRetweet == FALSE),1,all())

#write.csv(tweets_location_unique,file = "/Users/Pallavi/Documents/DIC-Project-2/NFLFilteredTweets.csv", row.names = FALSE)
write.csv(tweets_location_unique,file = "/Users/manasikulkarni/Documents/DIC-Project-2/TennisFilteredTweets.csv", row.names = FALSE)
