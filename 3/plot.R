library(plotly)

Sys.setenv("plotly_username" = "PrabuddhaKumar")
Sys.setenv("plotly_api_key" = "ZzmacP6gmiEz4kfEpG44")

trace_0 <- rnorm(5, mean = 5)
trace_1 <- rnorm(5, mean = 0)
trace_2 <- rnorm(5, mean = -5)
xVect = c(1995, 2000, 2005, 2010, 2016)
yVect = c(6444.498, 6314.715, 6533.775, 6211.332, 5113.879)


data <- data.frame(x, trace_0, trace_1, trace_2)

p <- plot_ly(data, x = xVect, y = yVect, name = 'trace 0', type = 'scatter', mode = 'lines') %>%
  add_trace(y = ~trace_1, name = 'trace 1', mode = 'lines+markers') %>%
  add_trace(y = ~trace_2, name = 'trace 2', mode = 'markers')

# Create a shareable link to your chart
# Set up API credentials: https://plot.ly/r/getting-started
chart_link = plotly_POST(p, filename="modes")
chart_link