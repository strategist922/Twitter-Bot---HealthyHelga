# Twitter-Bot---HealthyHelga

HealthyHelga is a Twitter Bot that tweets 3 times per day to give one healthy recipe, one short workout, and one tip for stress management.

We gathered the info for these by scraping them from various websites, and using primarily the rvest and twitteR packages in R, we 
wrote scripts that would tweet at roughly 10:15, 11:15, and 14:00 CAT. The automation was done through crontab. 

The names of the scripts that are to be automated all end in Auto, and the .RData files are what they call to be loaded and edited each day through
the scripts. 

Please visit twitter.com/HealthyHelga to check it out!
