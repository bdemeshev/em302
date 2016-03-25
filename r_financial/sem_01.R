# вектор
x <- c(5, 6, 8, -4.5)
x
sum(x)
5 * x
y <- c(1, 3, 4, 7)
x + y
x * y

mean(x)
sd(y)
prod(x)

u <- runif(100,
  min = 0, max = 10)
u
help(runif)

u[3]
u[3:10]
tail(u, 5)
head(u, 3)
u[3:10] <- 9
head(u, 15)
u > 0.7
u[u > 8]

length(u)
udav <- seq(from = 5,
            to = 10,
            by = 0.3)
udav
exp(udav)
krolik <- 7:20
krolik

# матрица
v <- c(7, 2, 1, 7)
v
A <- matrix(v, nrow = 2,
      byrow = TRUE)
A[1, 2]
A[1, 2] <- 0
A
A[1, ]
A[, 1]

# Привет, Марат!
# Привет, Антон!
det(A)
solve(A)
b <- c(7, -3)
solve(A, b)
eigen(A)
B <- 2 * A
A * A # поэлементное
A %*% A # из линейной алгебры

# список
spisok <- list(a = 7,
               b = c(3, 4, 9),
               Z = diag(7))
9 -> x
# p = 0.7 # not recommended by HM
spisok
spisok$a
spisok$b
spisok$Z

spisok$r <- "Привет, Даниил!"

spisok[[2]]
spisok[[4]]

# data.frame (!) табличка с данными
sessionInfo()
# dplyr, reshape2
# Tools - Install packages
# install.packages(
#   c("dplyr", "reshape2"))
# табличка с данными
setwd("~/Downloads")
flats <- read.table(
  "flats_moscow.txt",
  dec = ".", sep = "\t",
  header = TRUE)
library("dplyr")
glimpse(flats)

# отбор переменных
flats2 <- select(flats,
    price, totsp, livesp)
flats2b <- select(flats, -n)
glimpse(flats2)
# отбор наблюдений
flats3 <- filter(flats,
  totsp > 100, brick == 1)
glimpse(flats3)

# создавать переменные
flats4 <- mutate(flats,
    othersp = totsp - livesp - kitsp,
    log_price = log(price))

flats4b <- flats %>% mutate(
  brick_text = ifelse(brick == 1,
    "кирпичный дом", "панельный дом")
)

# сортировка
flats5 <- arrange(flats, totsp, livesp)

tan(sin(cos(sin(5))))
5 %>% sin %>% cos %>% sin %>% tan

flats6 <- flats %>% select(-n) %>%
  filter(totsp > 100) %>%
  arrange(-totsp) %>% head

flats6b <- head(arrange(
  filter(select(flats, -n),
         totsp > 100)))
rm(flats6b)

report <- flats %>% group_by(code) %>%
  summarise(av_price = mean(price),
            sd_price = sd(price))
flats7 <- flats %>% group_by(code) %>%
  mutate(delta = price - mean(price))

vec <- c(6, 7, NA, 9, 10)
vec
vec * 9
flats8 <- flats %>%
  select(price, code) %>%
  left_join(report, by = "code")


