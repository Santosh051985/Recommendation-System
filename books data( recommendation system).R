#Installing and loading the libraries
install.packages("recommenderlab", dependencies=TRUE)
install.packages("Matrix")
library(recommenderlab)
library(caTools)

#movie rating data
books_data <- read.csv(file.choose())

#metadata about the variable
str(books_data)

#rating distribution
hist(books_data$rating)

#the datatype should be realRatingMatrix inorder to build recommendation engine
books_data_matrix<- as(books_data, 'realRatingMatrix')

#Popularity based 

books_data_model1 <- Recommender(books_data_matrix, method="POPULAR")

#Predictions for two users 
recommended_items1 <- predict(books_data_model1, books_data_matrix[1], n=5)
as(recommended_items1, "list")

# here based on the  given  authores "2" "3" "4" "5" "6"

?Recommender
## Popularity model recommends the same movies for all users , we need to improve our model using # # Collaborative Filtering

#User Based Collaborative Filtering

books_data_model2 <- Recommender(books_data_matrix, method="UBCF")

#Predictions for two users 
recommended_items2 <- predict(books_data_model2, books_data_matrix[1], n=5)
as(recommended_items2, "list")

# recomending based on the rating which is following "26" "27" "28" "29" "30"

books_data_model2 <- Recommender(books_data_matrix, method="IBCF")

#Predictions for two users 
recommended_items3 <- predict(books_data_model2, books_data_matrix[1], n=5)
as(recommended_items3, "list")
