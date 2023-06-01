# Airbnb-Project-Rshiny

This project aims to create a website through R-shiny to help guests/landlords to better understand the competitive market behavior of Airbnb in Amsterdam.

## Table of Contents

- [Introduction of the Website](#introduction-of-the-website)
- [Data Description](#data-description)
- [Code](#code)
- [References](#references)

## Introduction of the Website

This website is a tool that can be used by Airbnb guests and hosts. We hope to provide a data-driven way for guests and hosts to analyze and understand the landscape of short-term accommodations in Amsterdam. Hosts can also benefit from this website by looking at different cleaning fees, reviews, rating scores, and prices. They can use the tools and visualization on this web app to get a sense of how prices are set on Airbnb and get a pulse-check for how they are positioned to competitors. For anyone wishing to become a host and list their property for the first time, this tool would be very useful for gathering information on how they should price their listing. New Airbnb hosts can use the website for a first-cut understanding of the competitive landscape for market entry and pricing strategy.


## Data Description

The data from this web-app was retrieved from:  [Airbnb data](https://data.world/aewart/airbnb-raw-data/workspace/file?filename=Unit_1_Project_Dataset+%281%29.csv.)

Cleaned version of this data comprises 6056 row and 33 columns and 5144 host listings in Amsterdam, Netherlands from 2008 to 2015.

+ *host_id*: The range of host IDs varies from 1,662 to 30,260,408.
+ *host_name*: The dataset contains character values representing the names of the hosts.
+ *host_since_year*: The range of host joining years spans from 2008 to 2015.
+ *host_since_anniversary*: The dataset includes the anniversary dates (month and day) of the hosts joining Airbnb.
+ *id*: The unique identifier of the listing ranges from 2,818 to 5,829,776.
+ *neighbourhood_cleansed*: The dataset contains character values representing the names of the neighborhoods.
+ *City*: The dataset includes character values representing the names of cities.
+ *state*: The dataset contains character values representing the names of states or regions.
+ *zipcode*: The dataset includes character values representing postal codes or zip codes.
+ *Country*: The dataset contains character values representing the names of countries.
+ *latitude*: The latitude coordinates range from 52.29 to 52.43.
+ *longitude*: The longitude coordinates range from 4.763 to 5.014.
+ *property_type*: The dataset contains character values representing the types of properties (e.g., apartment, house, etc.).
+ *room_type*: The dataset includes character values representing the types of rooms available (e.g., entire home/apartment, private room, shared room, etc.).
+ *accommodates*: The number of guests the listing can accommodate ranges from 1 to 16.
+ *bathrooms*: The number of bathrooms available ranges from 0 to 8.
+ *bedrooms*: The number of bedrooms available ranges from 0 to 10.
+ *beds*: The number of beds available ranges from 1 to 16.
+ *bed_type*: The dataset contains character values representing the types of beds available (e.g., a real bed, sofa bed, etc.).
+ *price*: The nightly price for renting the listing varies from 15.0 to 1400.0.
+ *guests_included*: The number of guests included in the base price ranges from 0 to 16.
+ *extra_people*: The additional cost for each extra guest ranges from 0.0 to 235.0.
+ *minimum_nights*: The minimum number of nights required for booking ranges from 1 to 27.
+ *host_response_time*: The dataset includes character values representing the average time taken by the host to respond to inquiries.
+ *host_response_rate*: The dataset contains character values representing the percentage of inquiries the host responds to.
+ *number_of_reviews*: The total number of reviews received for the listing ranges from 1 to 297.
+ *review_scores_rating*: The overall rating score given by guests ranges from 20.00 to 100.00.
+ *review_scores_accuracy*: The rating score for accuracy given by guests ranges from 2.00 to 10.00.
+ *review_scores_cleanliness*: The rating score for cleanliness given by guests ranges from 2.00 to 10.00.
+ *review_scores_checkin*: The rating score for check-in given by guests ranges from 2.00 to 10.00.
+ *review_scores_communication*: The rating score for communication given by guests ranges

## Code

The website is created through R-shiny with the help of libraries such as **leaflet**, **worldcloud**, and **showtext** to create a world map design and make an analysis based on the results. During the coding process, many of the other libraries are used as well where it can be found [here](https://github.com/FurkanDanisman/Airbnb-Project---Rshiny/blob/main/Code/Libraries%20and%20Packages). In the code there are 4 parts, as follows:

- Unpacking libraries 
- Defining the ui
- Defining the server
- Using Rshiny function to start the website

All of the parts are explained explicitly through the code to understand the process more clearly. The code of this project can be found by clicking [Airbnb-R-code](https://github.com/FurkanDanisman/Airbnb-Project---Rshiny/blob/main/Code/Airbnb-Project-Rshiny-code.R).

## References

* https://towardsdatascience.com/how-to-build-a-data-analysis-app-in-r-shiny-143bee9338f7


* https://mastering-shiny.org/index.html


* https://www.kaggle.com/datasets/ahmedshahriarsakib/usa-real-estate-dataset


* https://rpubs.com/pjozefek/573335


* https://shiny.rstudio.com/articles/layout-guide.html


* https://www.w3schools.com/bootstrap/bootstrap_ref_comp_glyphs.asp
