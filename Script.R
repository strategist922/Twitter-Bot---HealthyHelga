library(twitteR)
library(tm)
library(stringr)
library(rvest)
library(dplyr)

#Getting the twitter authorization setup for HealthyHelga

consumer_key = ''
consumer_secret = ''
access_token = '' 
access_secret = ''

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

#Scrapping the list of tips from a website found and getting it into one clean list

selfcare <- read_html("http://www.goodtherapy.org/blog/134-activities-to-add-to-your-self-care-plan")

selfcare.list1 <- selfcare %>% html_node(css = "body > div > div > div > div.page_left_content_container > div.page_content.psychpedia_sub_page_content.blog_single_page > ol:nth-child(6)")
selfcare.list1 <- html_children(selfcare.list1)
selfcare.list1 <- html_text(selfcare.list1)

selfcare.list2 <- selfcare %>% html_node(css = "body > div > div > div > div.page_left_content_container > div.page_content.psychpedia_sub_page_content.blog_single_page > ol:nth-child(10)") %>% html_children() %>% html_text()

selfcare.list3 <- selfcare %>% html_node(css = "body > div > div > div > div.page_left_content_container > div.page_content.psychpedia_sub_page_content.blog_single_page > ol:nth-child(14)") %>% html_children() %>% html_text()

selfcare.list4 <- selfcare %>% html_node(css = "body > div > div > div > div.page_left_content_container > div.page_content.psychpedia_sub_page_content.blog_single_page > ol:nth-child(18)") %>% html_children() %>% html_text()

selfcare.list5 <- selfcare %>% html_node(css = "body > div > div > div > div.page_left_content_container > div.page_content.psychpedia_sub_page_content.blog_single_page > ol:nth-child(22)") %>% html_children() %>% html_text()


selfcare.list <- c(selfcare.list1, selfcare.list2, selfcare.list3, selfcare.list4, selfcare.list5)

selfcare.list <- gsub("\n", "", selfcare.list)

selfcare.list[24] <- "Take a few minutes out of your day and a enjoy a funny animal video on YouTube."

# Will tweet with "#WTD ", so strings in the list need to be 135 characters or less, so I ran a loop to delete those that aren't 

for (i in 1:134){
  if (length(str_split(selfcare.list[i], "")[[1]]) > 135){
  selfcare.list <- selfcare.list[-i]
}
}

# Saving as an RData file to be loaded in the automater script

save(selfcare.list, file = "selfcare.RData")


