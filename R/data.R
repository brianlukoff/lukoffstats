retail <- read.csv("http://welkin.brianlukoff.com/data/retail.csv")
phone.cases <- read.csv("http://welkin.brianlukoff.com/data/phone.cases.csv")
network <- read.csv("http://welkin.brianlukoff.com/data/network.csv")
mortgages <- read.csv("http://welkin.brianlukoff.com/data/mortgages.csv")
health <- read.csv("http://welkin.brianlukoff.com/data/health.csv")
civil.rights <- read.csv("http://welkin.brianlukoff.com/data/civil-rights.csv")
airbnb <- read.csv("http://welkin.brianlukoff.com/data/airbnb.csv")


usethis::use_data(retail, phone.cases, network, mortgages, health, civil.rights, airbnb, overwrite=T)
