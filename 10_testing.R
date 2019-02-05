prostate_data <- read.table("start_data/GDS1390_after_anova.csv",
                            sep = ",",
                            header = TRUE)

rand_seed <- 1030
set.seed(rand_seed)

xlearn <- prostate_data
xlearn$state <- NULL
ylearn <- prostate_data$state

fit1 <- LogitBoost(xlearn, ylearn, nIter = ncol(xlearn))

predict(fit1, xlearn[1,], type = "class")


