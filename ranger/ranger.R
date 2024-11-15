# Olah Data Semarang
# WhatsApp : +6285227746673
# IG : @olahdatasemarang_
# A fast implementation of Random Forest (Breiman 2001) or recursive partitioning Use ranger With (In) R Software
install.packages("ranger")
library("ranger")
ranger = read.csv("https://raw.githubusercontent.com/timbulwidodostp/ranger/main/ranger/ranger.csv",sep = ";")
# Estimation A fast implementation of Random Forest (Breiman 2001) or recursive partitioning Use ranger With (In) R Software
## Classification forest with default settings
ranger(Species ~ ., data = ranger)
## Prediction
train.idx <- sample(nrow(ranger), 2/3 * nrow(ranger))
ranger.train <- ranger[train.idx, ]
ranger.test <- ranger[-train.idx, ]
rg.ranger <- ranger(Species ~ ., data = ranger.train, write.forest = TRUE)
pred.ranger <- predict(rg.ranger, dat = ranger.test)
table(ranger.test$Species, pred.ranger$predictions)
## Variable importance
rg.ranger <- ranger(Species ~ ., data = ranger, importance = "impurity")
rg.ranger$variable.importance
## Survival forest
require(survival)
rg.ranger <- ranger(Surv(time, status) ~ ., data = ranger)
plot(rg.ranger$unique.death.times, rg.ranger$survival[1,])
## Alternative interface
ranger(dependent.variable.name = "Species", data = ranger)
# A fast implementation of Random Forest (Breiman 2001) or recursive partitioning Use ranger With (In) R Software
# Olah Data Semarang
# WhatsApp : +6285227746673
# IG : @olahdatasemarang_
# Finished