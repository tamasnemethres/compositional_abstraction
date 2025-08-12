#Required package
library(brms)


################################################################################
#Data
################################################################################

data_25 <- read.csv("/Users/nemethtamas/Documents/GitHub/compositional_abstraction/data/results_25.csv")
data_100 <- read.csv("/Users/nemethtamas/Documents/GitHub/compositional_abstraction/data/results_100.csv")
data_1000 <- read.csv("/Users/nemethtamas/Documents/GitHub/compositional_abstraction/data/results_1000.csv")

################################################################################
################################################################################
#Instruction length by word
################################################################################
################################################################################


################################################################################
# Number of trials= 25
################################################################################
set.seed(123)
bayes_model_25_0_w <- brm(instruction_length_by_word ~ 1, data=data_25, family = gaussian(), #Gaussian, since student was not a great pass
                          chains = 4,
                          iter = 4000,
                          warmup = 2000,
                          control = list(max_treedepth = 15, adapt_delta = 0.95))
set.seed(123)
bayes_model_25_1_w <- brm(instruction_length_by_word ~ trial, data=data_25, family = gaussian(), 
                          chains = 4,
                          iter = 4000,
                          warmup = 2000,
                          control = list(max_treedepth = 15, adapt_delta = 0.95))

set.seed(123)
bayes_factor(bayes_model_25_0_w,bayes_model_25_1_w )
#Estimated Bayes factor in favor of bayes_model_25_0_w over bayes_model_25_1_w: 24.53371

################################################################################
# Number of trials= 100
################################################################################

set.seed(123)
bayes_model_100_0_w <- brm(instruction_length_by_word ~ 1, data=data_100, family = gaussian(), #Gaussian, since student was not a great pass
                          chains = 4,
                          iter = 4000,
                          warmup = 2000,
                          control = list(max_treedepth = 15, adapt_delta = 0.95))
set.seed(123)
bayes_model_100_1_w <- brm(instruction_length_by_word ~ trial, data=data_100, family = gaussian(), 
                          chains = 4,
                          iter = 4000,
                          warmup = 2000,
                          control = list(max_treedepth = 15, adapt_delta = 0.95))

set.seed(123)
bayes_factor(bayes_model_100_0_w,bayes_model_100_1_w )
#Estimated Bayes factor in favor of bayes_model_100_0_w over bayes_model_100_1_w: 253.89196
################################################################################
# Number of trials= 1000
################################################################################

set.seed(123)
bayes_model_1000_0_w <- brm(instruction_length_by_word ~ 1, data=data_1000, family = gaussian(), 
                           chains = 4,
                           iter = 4000,
                           warmup = 2000,
                           control = list(max_treedepth = 15, adapt_delta = 0.95))
set.seed(123)
bayes_model_1000_1_w <- brm(instruction_length_by_word ~ trial, data=data_1000, family = gaussian(), 
                           chains = 4,
                           iter = 4000,
                           warmup = 2000,
                           control = list(max_treedepth = 15, adapt_delta = 0.95))

set.seed(123)
bayes_factor(bayes_model_1000_0_w,bayes_model_1000_1_w )
#Estimated Bayes factor in favor of bayes_model_1000_0_w over bayes_model_1000_1_w: 764.33004

################################################################################
################################################################################
#instruction length by letter
################################################################################
################################################################################


################################################################################
# Number of trials= 25
################################################################################
set.seed(123)
bayes_model_25_0_l <- brm(instruction_length_by_letter ~ 1, data=data_25, family = gaussian(), #Gaussian, since student was not a great pass
                           chains = 4,
                           iter = 4000,
                           warmup = 2000,
                           control = list(max_treedepth = 15, adapt_delta = 0.95))
set.seed(123)
bayes_model_25_1_l <- brm(instruction_length_by_letter ~ trial, data=data_25, family = gaussian(), 
                           chains = 4,
                           iter = 4000,
                           warmup = 2000,
                           control = list(max_treedepth = 15, adapt_delta = 0.95))

set.seed(123)
bayes_factor(bayes_model_25_0_l,bayes_model_25_1_l)
#Estimated Bayes factor in favor of bayes_model_25_0_l over bayes_model_25_1_l: 3.04845
#because it was low: 
set.seed(123)
bayes_factor(bayes_model_25_1_l,bayes_model_25_0_l)
#Estimated Bayes factor in favor of bayes_model_25_1_l over bayes_model_25_0_l: 0.32626
################################################################################
# Number of trials= 100
################################################################################
set.seed(123)
bayes_model_100_0_l <- brm(instruction_length_by_letter ~ 1, data=data_100, family = gaussian(), #Gaussian, since student was not a great pass
                           chains = 4,
                           iter = 4000,
                           warmup = 2000,
                           control = list(max_treedepth = 15, adapt_delta = 0.95))
set.seed(123)
bayes_model_100_1_l <- brm(instruction_length_by_letter ~ trial, data=data_100, family = gaussian(), 
                           chains = 4,
                           iter = 4000,
                           warmup = 2000,
                           control = list(max_treedepth = 15, adapt_delta = 0.95))

set.seed(123)
bayes_factor(bayes_model_100_0_l,bayes_model_100_1_l)
#Estimated Bayes factor in favor of bayes_model_100_0_l over bayes_model_100_1_l: 31.44654
################################################################################
# Number of trials= 1000
################################################################################
set.seed(123)
bayes_model_1000_0_l <- brm(instruction_length_by_letter ~ 1, data=data_1000, family = gaussian(), #Gaussian, since student was not a great pass
                           chains = 4,
                           iter = 4000,
                           warmup = 2000,
                           control = list(max_treedepth = 15, adapt_delta = 0.95))
set.seed(123)
bayes_model_1000_1_l <- brm(instruction_length_by_letter ~ trial, data=data_1000, family = gaussian(), 
                           chains = 4,
                           iter = 4000,
                           warmup = 2000,
                           control = list(max_treedepth = 15, adapt_delta = 0.95))

set.seed(123)
bayes_factor(bayes_model_1000_0_l,bayes_model_1000_1_l)
#Estimated Bayes factor in favor of bayes_model_1000_0_l over bayes_model_1000_1_l: 112.53917

