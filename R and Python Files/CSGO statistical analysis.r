#if necessarily install required packages by duncommenting these commands
#install.packages('MASS')
#install.packages('tidyverse')
#install.packages('dplyr')
#install.packages('pROC')

#importing the libraries
library(MASS) # for Discriminant analysis and Logistic regression
library(tidyverse) # collection of packages like dplyr, tidyr, stringr, lubridate all used for data wrangling
library(dplyr) # Essential shortcuts for subsetting, summarizing, rearranging, and joining together data sets.
library(pROC) # for the ROC and AUC functions


#importing the dataset
setwd("C:/Users/dansi/OneDrive/Документы/Files/Data science/CSGO_project/CSGO/Data")
#importing the dataset
df <- read.csv("CSGO_cleaned.csv")
str(df)
attach(df)
names(df)

#Scale predictor variables
df[1:91] <- scale(df[1:91])

# Divide our dataset into train (80%) and test samples (20%)
set.seed(1)
ind <- sample(2, nrow(df),
              replace = TRUE,
              prob = c(0.8, 0.2))
training <- df[ind==1,]
testing <- df[ind==2,]

# Linear discriminant analysis
linear <- lda(round_winner~., training)
linear

# Confusion matrix and accuracy - testing data for linear discriminant analysis
p2 <- predict(linear, testing)$class
tab1 <- table(Predicted = p2, Actual = testing$round_winner)
tab1
sum(diag(tab1))/sum(tab1)



# Logistic regression
GLM <- glm(round_winner ~.,family=binomial(link='logit'),data=training)
summary(GLM)

# Confusion matrix and accuracy - testing data for logistic regression
result_log <- predict(GLM,newdata=testing,type='response')
view(result_log)
range(result_log)
tab2 <- table(testing$round_winner, result_log>0.5)
tab2
sum(diag(tab2))/sum(tab2)


#Plotting the ROC-cruve and calculating the AUC
glm_link_scores <- predict(GLM, testing, type="link")
glm_response_scores <- predict(GLM, testing, type="response")
score_data <- data.frame(link=glm_link_scores, 
                         response=glm_response_scores,
                         bad_widget=testing$round_winner,
                         stringsAsFactors=FALSE)

plot(roc(testing$round_winner, glm_response_scores, direction="<"),
     col="blue", lwd=3, main="ROC-curve plot on CSGO data", legacy.axes = TRUE)

auc(testing$round_winner, glm_response_scores)

