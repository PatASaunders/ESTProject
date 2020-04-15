library(AER)
library(ggplot2)
library(dynlm)
library(fGarch)
library(rugarch)
library(rmgarch)
library(quantmod)
library(scales)
library(vars)
library(xts)

DJI_data  <- read.csv("DJI.csv", header=TRUE)
Oil_data  <- read.csv("oil_price.csv")
Gold_data <- read.csv("")

data[[1]] <- as.Date(data[[1]], "%d/%m/%Y")

head(data)

ggplot(data, aes(x=Date, y=Close, group=1)) + geom_line() + ggtitle("Closing Price of DJ") + xlab("Date") + ylab("Price") + theme(plot.title = element_text(hjust = 0.5)) + scale_x_date(date_labels="%b %y", date_breaks = "5 years")

time <- as.POSIXct(paste(data$Date, data$Close), format = "%Y-%m-%d")
DJI <- xts(x=data$Close, order.by = time)

chartSeries(DJI)

rDJI <- dailyReturn(DJI)