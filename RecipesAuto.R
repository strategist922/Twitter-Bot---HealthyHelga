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

# Scrape recipe links from website
# healthy_recipes <- read_html("https://fitfoodhealthprogram.wordpress.com/recipes/omnivore-entrees/")
# recipe_links <- healthy_recipes %>% html_node(css = "#post-108 > div > ul") %>% html_children() %>% html_children()
# recipe_links <- html_attr(recipe_links, name = "href")

# recipe_links <- recipe_links[-3]

# Load the recipe links into an RDA file
# save(recipe_links, file = "recipes.RData")

load("/media/sf_Shared_Folder/Twitter Bot - HealthyHelga/recipes.RData")


# Post top recipe (in the RDA file) with introductory statement
day_recipe <- paste("#recipeoftheday", recipe_links[1])
tweet(day_recipe)

# Delete the posted (top item in the recipe list) from the vector
recipe_links <- recipe_links[-1]

# Save workspace and RDA file without latest tweet info
save(recipe_links, file = "/media/sf_Shared_Folder/Twitter Bot - HealthyHelga/recipes.RData")
