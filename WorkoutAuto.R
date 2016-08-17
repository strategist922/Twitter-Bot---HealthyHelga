library(twitteR)
library(tm)
library(stringr)
library(httr)
library(rvest)

consumer_key = ''
consumer_secret = ''
access_token = '' 
access_secret = ''

author <- "HealthyHelga"
author_id <- "751358493723099137"
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

# Extract workout links
# workouts <- read_html("http://greatist.com/bodyweight-workouts")
# workout_link <- workouts %>% html_nodes(css = "div.description > a")
# workout_link <- html_attr(workout_link, name = "href")


# Extract descriptions
# workout_des <- workouts %>% html_nodes(css = "div.description > a > h2")

# Clean descriptions
# workout_des <- gsub("<h2>", "", workout_des)
# workout_des <- gsub("</h2>", "", workout_des)


# Load the workout links into an RDA file
# save(workout_link, file = "workouts.RData")
load("/media/sf_Shared_Folder/Twitter Bot - HealthyHelga/workouts.RData")

daily_workout <- paste("workoutoftheday:", workout_link[1])

tweet(daily_workout)

# Delete top item in list from the vector
workout_link <- workout_link[-1]

# Save workspace and RDA file without latest tweet info
save(workout_link, file = "/media/sf_Shared_Folder/Twitter Bot - HealthyHelga/workouts.RData")
