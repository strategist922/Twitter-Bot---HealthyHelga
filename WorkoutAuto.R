library(twitteR)
library(tm)
library(stringr)
library(httr)
library(rvest)
consumer_key <- "mbMi4KCyZxTbfvrQ4GTK2OWkV"
consumer_secret <- "pfx4VWrWyeEkVDvS4Hub1CEfoxl6VidSb4fjw4H7iiwrf2x3cJ"
author <- "HealthyHelga"
author_id <- "751358493723099137"
access_token <- "751358493723099137-4Y9WOo8pVvqTiKCVj86PxYO31XPkBph"
access_secret <- "ijZCBRPYLe56EJLzbBQ7Sqt6aeBCiIZgj5M7XA5iKWsji"
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

# Extract workout links
workouts <- read_html("http://greatist.com/bodyweight-workouts")
workout_link <- workouts %>% html_nodes(css = "div.description > a")
workout_link <- html_attr(workout_link, name = "href")
workout_link

# Extract descriptions
workout_des <- workouts %>% html_nodes(css = "div.description > a > h2")
workout_des
# Clean descriptions
workout_des <- gsub("<h2>", "", workout_des)
workout_des <- gsub("</h2>", "", workout_des)
workout_des

# Load the workout links into an RDA file
save(daily_workout, file = "workouts.RData")
load("/media/sf_Shared_Folder/Twitter Bot - HealthyHelga/workouts.RData")

daily_workout <- paste("#DailyWorkout:", workout_link[1])
daily_workout
tweet(daily_workout)

# Delete top item in list from the vector
daily_workout <- daily_workout[-1]

# Save workspace and RDA file without latest tweet info
save(daily_workout, file = "workouts.RData")