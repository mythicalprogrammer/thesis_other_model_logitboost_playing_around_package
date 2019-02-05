pred_logitboost <- c()
for (i in 1:length(pred)) {
  if (pred[i] == 1) {
    pred_logitboost[i] <- "D"
  } else {
    pred_logitboost[i] <- "I"
  }
}
levels(pred_logitboost) <- c("D", "I")
pred_logitboost <- as.factor(pred_logitboost)
levels(pred_logitboost) == levels(ylearn)
cm <- confusionMatrix(pred_logitboost, ylearn)
cm$overall["Accuracy"]

"
Accuracy
    0.75
"
