# указываем рабочую папку
setwd("~/Downloads/")
# session - set working directory - choose 


# прочитать данные 
# при чтении текстового файла с данными 
# обращаем внимание на
# 1. наличие заголовков в первой строке
# 2. разделитель целые/дробные
# 3. разделитель отдельных наблюдений

flats <- read.table("flats_moscow.txt", 
  header = TRUE, dec = ".", sep = "\t")
# tools - import data set - from file 
flats <- read.delim("~/Downloads/flats_moscow.txt")

# установить пакет можно через tools-install packages
# или install.packages("dplyr")

# после установки пакета можно его подключить
library("dplyr") # манипуляции с данными
library("ggplot2") # графиков
library("glmnet") # LASSO/ridge
library("quantreg") # квантильная регрессия

packs <- c("dplyr", "ggplot2", "glmnet")

# встроенная помощь
help("cos")
help(package = "dplyr")

help("glimpse")
glimpse(flats)

# указать конкретный пакет
# dplyr::select

# линейная регрессия
model_ols <- lm(data = flats, 
                price ~ totsp + livesp)
summary(model_ols)

# медианная регрессия
model_median <- rq(data = flats, tau = 0.5,
                 price ~ totsp + livesp)
summary(model_median)

# квантильная регрессия 
# для самых дорогих квартир (10%) 
# самых дешёвых (10%)

model_q <- rq(data = flats, tau = c(0.1, 0.9),
                   price ~ totsp + livesp)
summary(model_q)



