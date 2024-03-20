# Load the required library
library(recommenderlab)

# Create random data
set.seed(123)
n_users <- 100
n_items <- 50
ratings <- matrix(sample(1:5, n_users * n_items, replace = TRUE), nrow = n_users)

# Convert the ratings matrix into a realRatingMatrix object
ratings <- as(ratings, "realRatingMatrix")

# Split the data into training and testing sets
data_split <- sample(1:3, nrow(ratings), replace = TRUE, prob = c(0.6, 0.2, 0.2))
train_data <- ratings[data_split == 1, ]
test_data <- ratings[data_split == 2, ]

# Build a recommender model using collaborative filtering
recommender_model <- Recommender(train_data, method = "UBCF")

# Generate recommendations for a user
user_id <- 1
n_recommendations <- 5
user_recommendations <- predict(recommender_model, newdata = train_data[user_id, ], n = n_recommendations)

# Print the recommended items
print(user_recommendations)
