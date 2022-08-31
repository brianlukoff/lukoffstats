retail <- read.csv("http://welkin.brianlukoff.com/data/retail.csv")
phone.cases <- read.csv("http://welkin.brianlukoff.com/data/phone.cases.csv")
network <- read.csv("http://welkin.brianlukoff.com/data/network.csv")
mortgages <- read.csv("http://welkin.brianlukoff.com/data/mortgages.csv")
civil.rights <- read.csv("http://welkin.brianlukoff.com/data/civil-rights.csv")
airbnb <- read.csv("http://welkin.brianlukoff.com/data/airbnb.csv")
health <- read.csv("http://welkin.brianlukoff.com/data/health.csv")
inspections.routine <- read.csv("http://welkin.brianlukoff.com/data/inspections.routine.csv")
inspections.followup <- read.csv("http://welkin.brianlukoff.com/data/inspections.followup.csv")
inspections.2020 <- read.csv("http://welkin.brianlukoff.com/data/inspections.2020.csv")
inspections.2021 <- read.csv("http://welkin.brianlukoff.com/data/inspections.2021.csv")
inspections.starbucks <- inspections.routine[grep("Starbucks", inspections.routine$name, ignore.case=TRUE),]
inspections.mcdonalds <- inspections.routine[grep("McDonald", inspections.routine$name, ignore.case=TRUE),]
colleges <- read.csv("http://welkin.brianlukoff.com/data/colleges.csv")

usethis::use_data(retail, phone.cases, network, mortgages, health, civil.rights, airbnb,
                  inspections.routine, inspections.followup, inspections.starbucks, inspections.mcdonalds,
                  inspections.2020, inspections.2021, colleges,
                  overwrite=T)
