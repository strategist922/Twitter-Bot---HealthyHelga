library(twitteR)
library(tm)
library(stringr)
library(rvest)
library(dplyr)

consumer_key = ''
consumer_secret = ''
access_token = '' 
access_secret = ''

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)


load("/media/sf_Shared_Folder/Twitter Bot - HealthyHelga/selfcare.RData")


selfcare_daily <- paste("#WTD", selfcare.list[1])

tweet(selfcare_daily)

selfcare.list <- selfcare.list[-1]


save(selfcare.list, file = "/media/sf_Shared_Folder/Twitter Bot - HealthyHelga/selfcare.RData")



