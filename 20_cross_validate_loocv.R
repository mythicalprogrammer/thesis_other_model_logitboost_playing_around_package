prostate_data <- read.table("start_data/GDS1390_after_anova.csv",
                            sep = ",",
                            header = TRUE)


xlearn <- prostate_data
xlearn$state <- NULL
ylearn <- prostate_data$state


rand_seed <- 1030
set.seed(rand_seed)

pred <- c()
j <- 1
for (i in 1:nrow(xlearn)) {
  leftout_row <- xlearn[i,]
  #leftout_col <- ylearn[i,]
  kth_fold_train <- xlearn[-i,]
  kth_fold_response <- ylearn[-i]

  kth_fit <-
    LogitBoost(kth_fold_train,
               kth_fold_response,
               nIter = ncol(kth_fold_train))

  pred[j] <- predict(kth_fit, leftout_row, type = "class")
  j <- j + 1
}


