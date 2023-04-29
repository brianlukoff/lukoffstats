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
starbucks <- inspections.routine[grep("Starbucks", inspections.routine$name, ignore.case=TRUE),]
mcdonalds <- inspections.routine[grep("McDonald", inspections.routine$name, ignore.case=TRUE),]
colleges <- read.csv("http://welkin.brianlukoff.com/data/colleges.csv")

usethis::use_data(retail, phone.cases, network, mortgages, health, civil.rights, airbnb,
                  inspections.routine, inspections.followup, starbucks, mcdonalds,
                  inspections.2020, inspections.2021, colleges,
                  overwrite=T)

#' San Francisco Airbnb listing data
#'
#' 3,181 Airbnb listings from San Francisco, CA in December 2020.
#'
#' @format ## `airbnb`
#' A data frame with 3,181 rows and 28 columns:
#' \describe{
#'   \item{id}{the internal Airbnb identifier for the listing}
#'   \item{listing}{the URL of the listing in Airbnb}
#'   \item{name}{the description of the listing, as provided by the owner (the "host")}
#'   \item{host.location}{where the host themselves is located}
#'   \item{host.response.time}{how quickly the host indicates they will respond to inbound requests}
#'   \item{neighborhood}{the neighborhood of the city the listing is located in}
#'   \item{accommodates}{the number of people that can be accommodated in the house or apartment}
#'   \item{min.stay}{the minimum number of nights a renter must stay in the unit}
#'   \item{max.stay}{the maximum number of nights a renter must stay in the unit}
#'   \item{instant.book}{whether the unit can be booked "instantly" (i.e., without waiting for the host to approve the renter)}
#'   \item{num.amenities}{the number of "amenities" that the listing provides, from among Airbnb's preselected list (e.g. kitchen, Wi-Fi, etc.)}
#'   \item{kitchen}{whether the unit has a kitchen}
#'   \item{dishwasher}{whether the unit has a dishwasher}
#'   \item{outdoor.space}{whether the unit has a garden or backyard}
#'   \item{wifi}{whether the unit offers Wi-Fi}
#'   \item{bedrooms}{the number of bedrooms}
#'   \item{price}{the nightly rental price}
#'   \item{reviews}{the number of reviews given for the listing}
#'   \item{room.type}{the type of physical space offered for rent (e.g., entire home/apartment, shared room, etc.)}
#' }
"airbnb"


