library("mfx")
library("titanic")
library("MCMCpack")

help("titanic_train")
str(titanic_train)

# classic OLS
ols_model <- lm(data = titanic_train,
                Fare ~ 1 + Age)
summary(ols_model)

# classic logit
logit_model <- logitmfx(data = titanic_train,
           Survived ~ Age + Fare)
logit_model # marginal effects
summary(logit_model$fit) # coef estimates


# bayesian OLS
b_ols <- MCMCregress(data = titanic_train,
                     Fare ~ Age)
head(b_ols)
str(b_ols)
sum(b_ols[ ,2] > 0.3)/10000
summary(b_ols)
help("MCMCregress")
HPDinterval(b_ols)

myb0 = c(0, 2)
myB0 = matrix(c(0, 0, 0, 4), nrow = 2)

b0
B0
b_ols_2 <- MCMCregress(data = titanic_train,
              Fare ~ Age, b0 = myb0, B0 = myB0)
summary(b_ols_2)

# bayesian logit



