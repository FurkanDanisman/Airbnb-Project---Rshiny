# Packages

install.packages("shinydashboard")
install.packages("caret")
install.packages("DT")
install.packages("leaflet.extras")
install.packages("tidyr")
install.packages("worldcloud")
install.packages("showtext")
install.packages("googleCharts")
install.packages("gtsummary")

# Libraries

library(caret)
library(dplyr)
library(DT)
library(ggplot2)
library(leaflet)
library(leaflet.extras)
library(shinythemes)
library(tidyr)
library(wordcloud)
library(shiny)
library(shinythemes)
library(dplyr)
library(ggplot2)
library(shinydashboard)
library(showtext)
library(bslib)
library(markdown)
library(gtsummary)
library(readxl)


# Load File

listings<-read.csv("Unit_1_Project_Dataset.csv",header=T) 
listings <- na.omit(listings)

# Define UI for the Airbnb application

ui <- fluidPage(
  
  # Set Shiny Theme
  
  theme = bs_theme(version = 4, bootswatch = "united"),
  
  # Application title
  
  titlePanel("Airbnb PriceR: Airbnb Analytics by 'WE R'", windowTitle = "Airbnb Data for Hosts and Guests"), 
  
  # Sidebar with a slider input for number of bins 
  
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "neighbourhood", 
                  label = "Neighbourhood",
                  choices = c("Centrum-West", "Bijlmer-Centrum", "Bos en Lommer",
                              "Buitenveldert - Zuidas", "Centrum-Oost", "De Aker - Nieuw Sloten", 
                              "De Baarsjes - Oud-West",
                              "Bijlmer-Centrum", "De Pijp - Rivierenbuurt", "Noord-Oost", "Oud-Noord",
                              "Westerpark", "Gaasperdam - Driemond", "Noord-West",
                              "Oud-Oost", "Zuid", "Geuzenveld - Slotermeer", "De Aker - Nieuw Sloten",
                              "Oostelijk Havengebied - Indische Buurt", "Slotervaart", "IJburg - Zeeburgereiland",
                              "Osdorp", "Watergraafsmeer"
                  )),
      sliderInput("rooms",
                  "Number of Rooms",
                  min = 1,
                  max = 10,
                  value = 1),
      sliderInput("accommodates",
                  "Number of Guests",
                  min = 1,
                  max = 16,
                  value = 2),
      selectInput(inputId = "room_types_input", 
                  label = "Room Type",
                  choices = c("All types",
                              "Entire home/apt",
                              "Private room",
                              "Shared room")), width = 4,
      submitButton(text = "Apply Changes", icon("refresh"))
      
    ),
    
    
    ### Output of Shiny ###
    
    mainPanel(
      
      tabsetPanel(type = "tabs",
                  tabPanel("Info",
                           mainPanel(htmlOutput("picture")),
                           br(),
                           p("This website is a tool that can be used by Airbnb guests and hosts. We hope to provide a data-driven way for guests and hosts to analyze and understand the landscape of short-term accommodations in Amsterdam. Hosts can also benefit from this website by looking at different cleaning fees, reviews, rating scores, and prices. They can use the tools and visualization on this web app to get a sense of how prices are set on Airbnb and get a pulse-check for how they are positioned to competitors. For anyone wishing to become a host and list their property for the first time, this tool would be very useful for gathering information on how they should price their listing. New Airbnb hosts can use the website for a first-cut understanding of the competitive landscape for market entry and pricing strategy."),
                           br(),
                           p("The data from this web-app was retrieved from https://data.world/aewart/airbnb-raw-data/workspace/file?filename=Unit_1_Project_Dataset+%281%29.csv."),
                           br(),
                           p("Cleaned version of this data comprises 6056 row and 33 columns and  
                                 5144 host listings in Amsterdam, Netherlands from 2008 to 2015."),
                           br()),
                  tabPanel("Data Exploration",
                           sidebarLayout(
                             sidebarPanel(
                               selectInput("variable",
                                           "Variable",
                                           colnames(listings))
                             ),
                             mainPanel(
                               tableOutput("table1")
                             )
                           )
                  ),
                  tabPanel("Listings",
                           h3("Explore Airbnb listings in Amsterdam"),
                           p("The interactive web-app aims to help you (both Airbnb hosts and guests) to engage with data from Airbnb! Use the 
                                   different toggles and sliders on the left to interact with the data"),
                           h4("Number of Listings"),
                           p(textOutput("count")),
                           h4("PriceR Estimate"),
                           p(textOutput("estimate")),
                           br(),
                           leafletOutput(outputId = "map"),
                           br()),
                  tabPanel("Explore Listings",
                           h4("Listings Table"),
                           p("Explore listings based on your filter in the table below"),
                           br(),
                           DT::dataTableOutput("prices")),
                  tabPanel("Visualization",
                           h2("Relationships"),
                           sidebarLayout(
                             sidebarPanel(
                               selectInput(
                                 inputId = "xaxis", 
                                 label = " Choose a Variable for the X-axis", 
                                 choices = colnames(listings)),
                               selectInput(
                                 inputId = "yaxis", 
                                 label = "Choose a Variable for the Y-axis", 
                                 choices = colnames(listings))),
                             mainPanel(
                               plotOutput(outputId = "scatterplot")))),
                  tabPanel("Analytics",
                           h4("Analytics"),
                           p("Find out more about the supply and prices of listings in your neighbourhood"),
                           br(),
                           plotOutput("insights"),
                           br(),
                           plotOutput("acco"),
                           br(),
                           plotOutput("histogram"),
                           br(),
                           plotOutput("listingsBreakdown"),
                           br(),
                           plotOutput('priceBreakdown'),
                           br()),
                  
                  tabPanel("Conclusion",
                           br(),
                           p("This dynamic website is designed to find the best Airbnb home according to your wishes. 
From the data exploration tab, you can make inferences about the descriptive statistics of the Airbnb data.
You can enter the listings section on our page to see the house's location or what is nearby the house you like.
On the Explore listings page, you can easily view the Price, Property Type, and Rating of the house you have selected by using the filters Neighbourhood, Number of Rooms, Number of Guests, and Room Type. This page will support you in the house determination process.
The Visualization Tab is made to provide you the information about the relationships between different variables.
On the Analytics page, there are graphs as a result of the analysis of Airbnb categories. These visualizations give you an idea of critical values such as Neighbourhood, Price, Rating, and Response Time that inform you before choosing your home.")),
                  
                  
                  
                  
                  tabPanel("About the Team",
                           
                           
                           h3(("We R Team" )),
                           h4(("Furkan Berk Danışman - 2428969")),
                           h4(("Sıla İlyürek Kılıç - 2429157")),
                           h3(("REFERENCES")),
                           h4(("https://towardsdatascience.com/how-to-build-a-data-analysis-app-in-r-shiny-143bee9338f7")),
                           h4(("https://mastering-shiny.org/index.html")),
                           h4(("https://www.kaggle.com/datasets/ahmedshahriarsakib/usa-real-estate-dataset")),
                           h4(("https://rpubs.com/pjozefek/573335")),
                           h4(("https://shiny.rstudio.com/articles/layout-guide.html")),
                           h4(("https://www.w3schools.com/bootstrap/bootstrap_ref_comp_glyphs.asp")))
                  
                  
                  
                  
      ))))

server <- function(input, output, session) {
  output$picture <-renderText({
    c(
      '<img src="',
      "https://www.wallart.com/media/catalog/product/cache/5b18b93ddbe5d6592c6b175f41d24454/b/e/behang-van-amsterdam_9.jpg",
      '">'
    )
  })
  
  ### Data Table Output ###
  
  output$prices <- DT::renderDataTable({
    if (input$room_types_input == "All types"){
      listings_table <- listings %>% 
        dplyr::filter(price <= 9000) %>%
        dplyr::filter(neighbourhood_cleansed == input$neighbourhood,
                      bedrooms == input$rooms,
                      accommodates == input$accommodates) %>%
        select("Price (€)" = price,
               "Property Type" = property_type,
               "Review" = review_scores_rating)
      DT::datatable(listings_table,
                    rownames = FALSE,
                    options = list(initComplete = JS(
                      "function(settings, json) {",
                      "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                      "}"),pageLength = 8,
                      columnDefs = list(list(className = 'dt-center', targets = '_all'))),
                    escape = FALSE)
    } else {
      listings_table <- listings %>% 
        dplyr::filter(price <= 9000) %>%
        dplyr::filter(neighbourhood_cleansed == input$neighbourhood,
                      bedrooms == input$rooms,
                      accommodates == input$accommodates,
                      room_type == input$room_types_input) %>%
        select("Price (€)" = price,
               "Property Type" = property_type,
               "Review" = review_scores_rating)
      DT::datatable(listings_table,
                    rownames = FALSE,
                    options = list(initComplete = JS(
                      "function(settings, json) {",
                      "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                      "}"),pageLength = 8,
                      columnDefs = list(list(className = 'dt-center', targets = '_all'))),
                    escape = FALSE)
    }
    
  })
  
  ### Text Output - Count ###
  
  output$count <- renderText({
    if (input$room_types_input == "All types"){
      paste("There are", listings %>% 
              dplyr::filter(price <= 800) %>%
              dplyr:: filter(neighbourhood_cleansed == input$neighbourhood,
                             bedrooms == input$rooms,
                             accommodates == input$accommodates) %>%
              nrow(), "listings that match your filter in this neighbourhood")}
    else {paste("There are", listings %>% 
                  dplyr::filter(price <= 800) %>%
                  dplyr:: filter(neighbourhood_cleansed == input$neighbourhood,
                                 bedrooms == input$rooms,
                                 accommodates == input$accommodates,
                                 room_type == input$room_types_input) %>%
                  nrow(), "listings that match your filter in this neighbourhood")
      
    }
  })
  
  ### Text Output - Estimated Price ###
  
  output$estimate <- renderText({
    if (input$room_types_input == "All types"){
      listings_estimate <- listings %>% 
        dplyr::filter(price <= 800) %>% 
        dplyr::filter(neighbourhood_cleansed == input$neighbourhood) %>%
        na.omit()
      
      ctrl <- trainControl("cv", number = 10)
      naive_linear <- train(price ~ accommodates + bedrooms, 
                            data = listings_estimate, 
                            method = "lm", 
                            trControl = ctrl,
                            preProcess = c("center", "scale"))
      
      accommodates <- input$accommodates
      bedrooms <- input$rooms
      test <- data.frame(accommodates, bedrooms)
      
      y_hat <- predict(naive_linear, newdata = test) %>% round(2)
      
      paste("Based on the input filters, a listing in this neighbourhood should cost ", y_hat, " Euro(€) a night")}
    else {listings$room_type <- as.factor(listings$room_type)
    listings_estimate <- listings %>% 
      dplyr::filter(price <= 800) %>% 
      dplyr::filter(neighbourhood_cleansed == input$neighbourhood) %>%
      na.omit()
    
    ctrl <- trainControl("cv", number = 10)
    naive_linear <- train(price ~ accommodates + bedrooms + room_type, 
                          data = listings_estimate, 
                          method = "lm", 
                          trControl = ctrl,
                          preProcess = c("center", "scale"))
    
    accommodates <- input$accommodates
    bedrooms <- input$rooms
    room_type <- input$room_types_input
    test <- data.frame(accommodates, bedrooms, room_type)
    
    y_hat <- predict(naive_linear, newdata = test) %>% round(2)
    
    paste("Based on the input filters, a listing in this neighbourhood should cost" , y_hat, " Euro(?) a night")
    
    }
  })
  output$map <- renderLeaflet({if (input$room_types_input == "All types"){
    data_sub3 <- listings %>% dplyr::filter(neighbourhood_cleansed == input$neighbourhood,
                                            bedrooms == input$rooms,
                                            accommodates == input$accommodates,
                                            price <= 9000)
    
    leaflet(data_sub3) %>% 
      setView(lng = 4.895168, lat = 52.370216, zoom = 11)  %>% # setting the view over ~ center of Amsterdam
      addTiles() %>% 
      addProviderTiles(providers$CartoDB.Positron) %>%
      addCircles(data = data_sub3, 
                 lat = ~latitude, 
                 lng = ~longitude, 
                 weight = 2, 
                 popup = ~as.character(paste0("Price: ", price, "<br>",
                                              "Rating: ", review_scores_rating)), 
                 label = ~as.character(paste0("Price: ", price)), 
                 fillOpacity = 0.3,
                 color = "#F7965C",
                 group = "Listings") %>%
      addMarkers(data = listings, 
                 lat = ~latitude, 
                 lng = ~longitude,
                 group = "Rail Transport",
                 options = markerOptions(opacity = 0.3)) %>%
      addLayersControl(
        overlayGroups = c("Listings"),
        options = layersControlOptions(collapsed = FALSE)) %>% 
      hideGroup("Rail Transport")
  } else {
    
    data_sub3 <- listings %>% dplyr::filter(neighbourhood_cleansed == input$neighbourhood,
                                            bedrooms == input$rooms,
                                            accommodates == input$accommodates,
                                            room_type == input$room_types_input,
                                            price <= 9000)
    
    leaflet(data_sub3) %>% 
      setView(lng = 4.895168, lat = 52.370216, zoom = 11)  %>% # setting the view over ~ center of Amsterdam
      addTiles() %>% 
      addProviderTiles(providers$CartoDB.Positron) %>%
      addCircles(data = data_sub3, 
                 lat = ~ latitude, 
                 lng = ~ longitude, 
                 weight = 2, 
                 popup = ~as.character(paste0("Price: ", price, "<br>",
                                              "Rating: ", review_scores_rating)), 
                 label = ~as.character(paste0("Price: ", sep = " ", price)), 
                 fillOpacity = 0.3,
                 color = "#F7965C",
                 group = "Listings") %>%
      addMarkers(data = listings, 
                 lat = ~ latitude, 
                 lng = ~ longitude,
                 group = "Tube",
                 options = markerOptions(opacity = 0.3)) %>%
      addLayersControl(
        overlayGroups = c("Listings"),
        options = layersControlOptions(collapsed = FALSE)) %>% hideGroup("Tube")
  }
    
  })
  
  ### Analytics ###
  
  output$insights <- renderPlot ({
    plot1=aggregate(listings$price, list(listings$neighbourhood_cleansed), FUN=mean)
    colnames(plot1)=c("Neighbourhood","Price")
    ggplot(plot1, aes(x=Neighbourhood, y=Price, fill=Neighbourhood)) +
      geom_bar(stat="identity",width=0.85)+
      geom_density(alpha = .2, fill="chartreuse")+
      labs(x="Neighbourhood",y="Price",title="Price for Neighbourhoods",subtitle="Between 2008 to 2015 for 22 Neighbourhoods in Amsterdam",fill="Neighbourhood")+
      geom_text(aes(label=round(Price,2), vjust=2),col="white",size=4)+
      theme(axis.text.x =element_text(color ="white"))
    
    
  })
  
  output$acco <- renderPlot({
    plot6=aggregate(listings$price, list(listings$accommodates), FUN= mean)
    colnames(plot6)=c("Accommodates","Price")
    ggplot(plot6,aes(x=Accommodates,y=Price,color=as.factor(Accommodates)))+
      geom_point(size=4)+
      geom_smooth(method = "lm",col="yellow",fill="pink")+
      labs(x="Accommodate",y="Price",title="Relationship between Accommodates and Price",subtitle="Between 2008 to 2015 for 16 accommodate ratings in Amsterdam")+
      scale_colour_discrete("Accomodates")
  })
  
  output$histogram <-renderPlot ({
    plot2=aggregate(listings$review_scores_rating, list(listings$neighbourhood_cleansed), FUN=mean)
    colnames(plot2)=c("Neighbourhood","Rating")
    ggplot(plot2, aes(x=Neighbourhood, y=Rating, fill=Neighbourhood)) +
      geom_bar(stat="identity",width=0.85)+
      labs(x="Neighbourhood",y="Rating",title="Rating for Neighbourhoods",subtitle="Between 2008 to 2015 for 22 Neighbourhoods in Amsterdam",fill="Neighbourhood")+
      geom_text(aes(label=round(Rating,2), vjust=2),col="white",size=4)+
      theme(axis.text.x =element_text(color ="white"))
    
  })
  
  output$listingsBreakdown <- renderPlot({
    plot3=as.data.frame(table(listings$host_response_time))
    ggplot(plot3,aes(x="",y=Freq,fill=Var1))+
      geom_bar(stat = "identity",width=1, color="white")+
      coord_polar("y", start=0)+
      theme_void()+
      labs(title="Response Time",subtitle="Between 2008 to 2015 for 22 Neighbourhoods in Amsterdam",fill="Response Time")+
      scale_fill_manual(values=c("brown1","deepskyblue","mediumpurple1",
                                 "lightpink","orange"))
  })
  
  output$priceBreakdown <-  renderPlot({
    plot4=aggregate(listings$number_of_reviews, list(listings$neighbourhood_cleansed), FUN=mean)
    colnames(plot4)=c("Neighbourhood","Reviews")
    ggplot(plot4, aes(x=Neighbourhood,y=Reviews,col=Neighbourhood,group=1))+
      geom_line(col="burlywood",size=1)+
      geom_point(size=4)+
      theme_classic()+
      theme(axis.text.x =element_text(color ="white"))+
      labs(x="Neighbourhood",y="Reviews",title="Reviews for Neighbourhoods",subtitle="Between 2008 to 2015 for 22 Neighbourhoods in Amsterdam")
  })
  
  ### Summary ###
  
  output$table <- DT::renderDataTable(DT::datatable({
    data <- listings
    if(input$state !="All"){
      data<-data[data$state ==input$state,]
    }
    if(input$property != "All"){
      data<-data[data$property == input$property,]
    }
    if(input$room_type != "All"){
      data <-data[data$room_type == input$room_type,]
    }
    data
  }))
  
  ### Scatter-Plot ###
  
  output$scatterplot <- renderPlot({
    ggplot(listings)+
      aes_string(x=input$xaxis, y=input$yaxis)+
      geom_point()+ geom_smooth()
  }) 
  
  
  # Explore listing
  
  
  sum1 <- reactive({
    data <- listings %>%
      select(input$variable) %>%
      summary() %>%
      as.data.frame() %>%
      tidyr::separate(Freq, c("Stat", "Value"), sep=":") %>%
      tidyr::pivot_wider(names_from =Stat, values_from = Value)
    
  })
  
  output$table1 <- renderTable(sum1())
  
  
}

shinyApp(ui=ui,server=server) # Starting the Rshiny (website)




