### ===========================================================================
# Author: Freddie Heather
# Date: 
# Title: 
# Description: 
### ===========================================================================

# -----------------------------------------------------------------------------
# Housekeeping
# -----------------------------------------------------------------------------

# removing all objects
rm(list=ls())

# working directories:
dir_main <- "C:/Users/freddieh/Documents/PhD/R_projects/AFL-tippy"
dir_data <- "C:/Users/freddieh/Documents/PhD/R_projects/AFL-tippy/data/raw"
dir_figs <- "C:/Users/freddieh/Documents/PhD/R_projects/AFL-tippy/figures"
dir_Rdat <- "C:/Users/freddieh/Documents/PhD/R_projects/AFL-tippy/data"

# -----------------------------------------------------------------------------
# Package installation and loading
# -----------------------------------------------------------------------------

# install required packages (if not already installed)
list.of.packages <- c("rvest")
new.packages     <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages, dependencies = T)

# loading required packages
lapply(list.of.packages, require, character.only = T)

# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# Functions
# -----------------------------------------------------------------------------

teams <- c("Adelaide", "Brisbane Bears", "Brisbane Lions", "Carlton", "Collingwood", "Essendon", 
"Fitzroy", "Fremantle", "Geelong", "Gold Coast", "Greater Western Sydney", "Hawthorn", "Melbourne", 
"North Melbourne", "Port Adelaide", "Richmond", "St Kilda", "Sydney", "University", "West Coast", "Western Bulldogs")

# ---------------------------------------------------------------------------
# HTML Scraping
# ---------------------------------------------------------------------------

years <- 1987:2017

for(i in 1:length(years)){
  url <- paste("https://afltables.com/afl/seas/",years[i],".html", sep="")
  webpage <- read_html(url)
  data_html <- html_nodes(webpage,'td')
  data <- html_text(data_html)
  team1 <- data[seq(4,188/4, 4)]
  team2 <- data[seq(8,188/4, 8)]
}

data[1:118]
seq(4,188, 4)
data2 <- data.frame(code=data)
data2[1,1]
grep(paste(paste("^",teams,"$", sep=""),collapse="|"), 
     data, value=TRUE)

i=1

setwd(dir_data)
lmax_data <- downloadLmaxData(read_html("https://afltables.com/afl/seas/season_idx.html"))

setwd("C:/Users/freddieh/Documents/PhD/R_projects/html-scraping/data")
write.csv(lmax_data, "FB_lmax_TL.csv")
