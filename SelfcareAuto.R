library(twitteR)
library(tm)
library(stringr)
library(rvest)
library(dplyr)

consumer_key = 'mbMi4KCyZxTbfvrQ4GTK2OWkV'
consumer_secret = 'pfx4VWrWyeEkVDvS4Hub1CEfoxl6VidSb4fjw4H7iiwrf2x3cJ'
access_token = '751358493723099137-4Y9WOo8pVvqTiKCVj86PxYO31XPkBph' 
access_secret = 'ijZCBRPYLe56EJLzbBQ7Sqt6aeBCiIZgj5M7XA5iKWsji'

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)


load("/media/sf_Shared_Folder/Twitter Bot - HealthyHelga/selfcare.RData")


selfcare_daily <- paste("#WTD", selfcare.list[1])

tweet(selfcare_daily)

selfcare.list <- selfcare.list[-1]


save(selfcare.list, file = "/media/sf_Shared_Folder/Twitter Bot - HealthyHelga/selfcare.RData")



