data_25 <- read.csv("/Users/nemethtamas/Documents/GitHub/compositional_abstraction/results_25.csv")
data_100 <- read.csv("/Users/nemethtamas/Documents/GitHub/compositional_abstraction/results_100.csv")
data_1000 <- read.csv("/Users/nemethtamas/Documents/GitHub/compositional_abstraction/results_1000.csv")

model_25_0 <- lm(instruction_lenght_by_word ~ 1, data=data_25)
model_25_1 <- lm(instruction_lenght_by_word ~ round, data= data_25)
anova(model_25_0, model_25_1)



################################################################################
model_25_0_2 <- lm(instruction_lenght_by_letter ~ 1, data= data_25)
model_25_2 <- lm(instruction_lenght_by_letter ~ round, data= data_25)
anova(model_25_0_2, model_25_2)
summary(model_25_2)
AIC(model_25_2)

################################################################################
################################################################################
# the model is  NS
################################################################################
################################################################################

model_100_0_1 <- lm(instruction_lenght_by_word ~ 1, data=data_100)
model_100_1 <- lm(instruction_lenght_by_word ~ round, data= data_100)
anova(model_100_0_1, model_100_1)

model_100_0_2 <- lm(instruction_lenght_by_letter ~ 1, data=data_100)
model_100_2 <- lm(instruction_lenght_by_letter ~ round, data= data_100)
anova(model_100_0_2, model_100_2)



model_1000_0_1 <- lm(instruction_lenght_by_word ~ 1, data=data_1000)
model_1000_1 <- lm(instruction_lenght_by_word ~ round, data= data_1000)
anova(model_1000_0_1, model_1000_1)
AIC(model_1000_1)

model_1000_0_2 <- lm(instruction_lenght_by_letter ~ 1, data=data_1000)
model_1000_2 <- lm(instruction_lenght_by_letter ~ round, data= data_1000)
anova(model_1000_0_2, model_1000_2)
AIC(model_1000_2)


#scaled version- just write them in doc. the best to use letter --> has info 
#about the total lenght (containing spaces) 
#However it has higher AIC if sig. 
