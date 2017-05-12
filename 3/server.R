library(leaflet)
library(RColorBrewer)
library(scales)
library(lattice)
library(dplyr)

# Leaflet bindings are a bit slow; for now we'll just sample to compensate
set.seed(100)

# By ordering by centile, we ensure that the (comparatively rare) SuperZIPs
# will be drawn last and thus be easier to see

zipdata <- data2016[sample.int(nrow(data2016), 3000), ]
#zipdata <- data2016
zipdata <- zipdata[order(zipdata$Observation.Count),]

# data1995 = data1995 %>% filter('Parameter.Code' == 44201)
# data2000 = data2000 %>% filter('Parameter.Code' == 44201)
# data2005 = data2005 %>% filter('Parameter.Code' == 44201)
# #data2010 = data2010 %>% filter('Parameter.Code' == 44201)
# #data2016 = data2016 %>% filter('Parameter.Code' == 44201)

# filterData <- data2016[, c('Parameter.Code', 'Observation.Count') ]
# filterData1 <- data2010[, c('Parameter Code', 'Observation Count') ]
# filterData2 <- data2005[, c('Parameter Code', 'Observation Count') ]
# filterData3 <- data2000[, c('Parameter Code', 'Observation Count') ]
# filterData4 <- data1995[, c('Parameter Code', 'Observation Count') ]



B = matrix( 
     c(1995, 2000, 2005, 2010, 2016,6444.498, 6314.715, 6533.775, 6211.332, 5113.879 ), 
     nrow=2, 
     ncol=5)


#expr[expr[2] == 'hesc']
#grep("B", colnames(df))
#data2010 <- data2010[data2010[Parameter.Code] == "42101"]


function(input, output, session) {
  
  
  # Create the map
  output$map <- renderLeaflet({
    leaflet() %>%
      addTiles(
        urlTemplate = "//{s}.tiles.mapbox.com/v3/jcheng.map-5ebohr46/{z}/{x}/{y}.png"
        #attribution = 'Maps by <a href="http://www.mapbox.com/">Mapbox</a>'
      ) %>%
      setView(lng = -93.85, lat = 37.45, zoom = 4)
  })
  

 #  centileBreaks <- hist(plot = FALSE, allzips$centile, breaks = 20)$breaks

  # output$histCentile <- renderPlot({
  #   # If no zipcodes are in view, don't plot
  #   
  # 
  #   hist(B,
  #        breaks = 7,
  #        main = "Ozone concentration in the US(ppm)",
  #        xlab = "Percentile",
  #        xlim = range(xVect),
  #        col = '#00DD00',
  #        border = 'white',
  #       ylab = "Ozone Conc.",
  #       ylim = range(yVect),
  #       
  #      
  #        
  #       
  #       )
  #   
  # })

  
  # This observer is responsible for maintaining the circles and legend,
  # according to the variables the user has chosen to map to color and size.
  observe({
    colorBy <- input$color
    sizeBy <- input$color
    #inputVal <-input$vars
    
      #colorData <- zipdata[[colorBy]]
    colorData <- zipdata$Observation.Count
      #colorData <- "Reds"
      pal <- colorBin(mapColor, colorData, 5, pretty = FALSE)
    
#    input$threshold
    
    if (sizeBy == "superzip") {
      # Radius is treated specially in the "superzip" case.
      radius <- ifelse(zipdata$Observation.Count >= (100 - input$threshold), 30000, 3000)
    } else {
      #radius <- zipdata[[sizeBy]] / max(zipdata[[sizeBy]]) * 30000
      radius <- zipdata$Observation.Count / max(zipdata$Observation.Count) * 50000
      #radius <- zipdata[[sizeBy]] /   30000
    }
    
    
    
      
      zipdata <-data2000[sample.int(nrow(data2000), 2500),]

       if(colorBy=='1995')
         zipdata <- data1995[sample.int(nrow(data1995), 2500),]
       else if(colorBy=='2000')
         zipdata <- data2000[sample.int(nrow(data2000), 2500),]
       else if(colorBy=='2005')
         zipdata <- data2005[sample.int(nrow(data2005), 2500),]
       else if(colorBy=='2010')
         zipdata <- data2010[sample.int(nrow(data2010), 2500),]
       else if(colorBy == '2016')
         zipdata <- data2016[sample.int(nrow(data2016), 2500),]
        else
          zipdata <- data2005[sample.int(nrow(data2005), 2500),]
      # x    <- faithful[, 2] 
      # bins <- seq(min(x), max(x), length.out = 1)
      # cat(file=stderr(), "drawing histogram with", input$colorBy, "bins", "\n")
      # 
      
    
    leafletProxy("map", data = zipdata) %>%
      clearShapes() %>%
      addCircles(zipdata$Longitude, zipdata$Latitude, radius=radius,
                 stroke=FALSE, fillOpacity=0.4, fillColor=pal(colorData)) %>%
      addLegend("bottomleft", pal=pal, values=colorData, title=colorBy,
                layerId="colorLegend")
  })
  
  
}