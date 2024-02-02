# Wariant CIFAR-100
install.packages("reticulate", repos = "http://cran.us.r-project.org")
install.packages("tensorflow", repos = "http://cran.us.r-project.org")
install.packages("keras", repos = "http://cran.us.r-project.org")
library(reticulate)
reticulate::install_miniconda()
tensorflow::install_tensorflow()
library("tensorflow")
keras::install_keras()
library("keras")
cifar <- dataset_cifar100()
x_train <- cifar$train$x
x_test <- cifar$test$x
y_train <- cifar$train$y
y_test <- cifar$test$y
x_train <- array_reshape(x_train, c(nrow(x_train), 3072))
x_train <- x_train / 255    
x_test <- array_reshape(x_test, c(nrow(x_test), 3072))
x_test <- x_test / 255
y_train <- to_categorical(y_train, num_classes = 100)
y_test <- to_categorical(y_test, num_classes = 100)
model <- keras_model_sequential() %>%layer_dense(units = 256, activation = "relu", input_shape = c(3072)) %>% layer_dropout(rate = 0.25) %>% layer_dense(units = 128, activation = "relu") %>% layer_dropout(rate = 0.25) %>% layer_dense(units = 64, activation = "relu") %>% layer_dropout(rate = 0.25) %>% layer_dense(units = 100, activation = "relu")
summary(model)
model %>% compile(loss = "categorical_crossentropy",optimizer = optimizer_adam(), metrics = c("accuracy"))
history <- model %>% fit(x_train, y_train, epochs = 50, batch_size = 128, validation_split = 0.15)
model %>% evaluate(x_test, y_test)
cifar <- dataset_cifar100()
x_train <- cifar$train$x
x_test <- cifar$test$x
y_train <- cifar$train$y
y_test <- cifar$test$y
x_train <- x_train / 255
x_test <- x_test / 255
y_train <- to_categorical(y_train, num_classes = 100)
y_test <- to_categorical(y_test, num_classes = 100)
model <- keras_model_sequential() %>%
  layer_flatten(input_shape = c(32, 32, 3)) %>%
  layer_dense(units = 128, activation = "relu") %>%
  layer_dense(units = 100, activation = "softmax")
model %>% compile(loss = "categorical_crossentropy", optimizer = optimizer_adam(), metrics = c("accuracy"))
history <- model %>% fit(x_train, y_train, epochs = 50, batch_size = 128, validation_split = 0.15)
model %>% evaluate(x_test, y_test)
model %>% predict(x_test) %>% k_argmin()
plot(history)