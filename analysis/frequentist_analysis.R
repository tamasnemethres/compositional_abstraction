

data_25 <- read.csv("/Users/nemethtamas/Documents/GitHub/compositional_abstraction/results_25.csv")
data_100 <- read.csv("/Users/nemethtamas/Documents/GitHub/compositional_abstraction/results_100.csv")
data_1000 <- read.csv("/Users/nemethtamas/Documents/GitHub/compositional_abstraction/results_1000.csv")

model_25_0 <- lm(instruction_lenght_by_word ~ 0, data=data_25)
model_25_1 <- lm(instruction_lenght_by_word ~ round, data= data_25)
anova(model_25_0, model_25_1)

Analysis of Variance Table

# Model 1: instruction_lenght_by_word ~ 0
# Model 2: instruction_lenght_by_word ~ round
# Res.Df    RSS Df Sum of Sq      F    Pr(>F)    
# 1     25 365.00                                  
# 2     23   3.89  2    361.11 1067.8 < 2.2e-16 ***
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1


summary(model_25_1)


# Residuals:
#   Min       1Q   Median       3Q      Max 
# -0.82769  0.09846  0.15385  0.24615  0.31077 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)  3.920000   0.169548  23.120   <2e-16 ***
#   round       -0.009231   0.011405  -0.809    0.427    
# ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 0.4112 on 23 degrees of freedom
# Multiple R-squared:  0.02769,	Adjusted R-squared:  -0.01458 
# F-statistic: 0.6551 on 1 and 23 DF,  p-value: 0.4266


################################################################################