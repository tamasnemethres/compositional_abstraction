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

model_25_0_w <- lm(instruction_length_by_word ~ 1, data=data_25)
model_25_w <- lm(instruction_length_by_word ~ trial, data= data_25)
anova(model_25_0_w, model_25_w)

# Model 1: instruction_length_by_word ~ 1
# Model 2: instruction_length_by_word ~ trial
# Res.Df    RSS Df Sum of Sq      F Pr(>F)
# 1     24 4.0000                           
# 2     23 3.8892  1   0.11077 0.6551 0.4266

################################################################################
# Number of trials= 100
################################################################################
model_100_0_w <- lm(instruction_length_by_word ~ 1, data=data_100)
model_100_w <- lm(instruction_length_by_word ~ trial, data= data_100)
anova(model_100_0_w, model_100_w)

# Model 1: instruction_length_by_word ~ 1
# Model 2: instruction_length_by_word ~ trial
# Res.Df   RSS Df Sum of Sq      F Pr(>F)
# 1     99 15.39                           
# 2     98 15.35  1  0.039679 0.2533 0.6159

################################################################################
# Number of trials= 1000
################################################################################
model_1000_0_w <- lm(instruction_length_by_word ~ 1, data=data_1000)
model_1000_w <- lm(instruction_length_by_word ~ trial, data= data_1000)
anova(model_1000_0_w, model_1000_w)

# Model 1: instruction_length_by_word ~ 1
# Model 2: instruction_length_by_word ~ trial
# Res.Df    RSS Df Sum of Sq      F  Pr(>F)  
# 1    999 223.76                              
# 2    998 222.72  1    1.0341 4.6337 0.03159 *
summary(model_1000_w)
# Residuals:
#   Min      1Q  Median      3Q     Max 
# -0.7166 -0.6343  0.3058  0.3509  0.3936 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept)  3.718e+00  2.990e-02 124.339   <2e-16 ***
#   trial       -1.114e-04  5.175e-05  -2.153   0.0316 *  
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 0.4724 on 998 degrees of freedom
# Multiple R-squared:  0.004622,	Adjusted R-squared:  0.003624 
# F-statistic: 4.634 on 1 and 998 DF,  p-value: 0.03159
################################################################################
################################################################################
#Instruction length by letter
################################################################################
################################################################################

################################################################################
# Number of trials= 25
################################################################################
model_25_0_l <- lm(instruction_length_by_letter ~ 1, data= data_25)
model_25_l <- lm(instruction_length_by_letter ~ trial, data= data_25)
anova(model_25_0_l, model_25_l)

# Model 1: instruction_length_by_letter ~ 1
# Model 2: instruction_length_by_letter ~ trial
# Res.Df    RSS Df Sum of Sq      F Pr(>F)
# 1     24 223.84                           
# 2     23 216.15  1    7.6923 0.8185  0.375

################################################################################
# Number of trials= 100
################################################################################

model_100_0_l <- lm(instruction_length_by_letter ~ 1, data=data_100)
model_100_l <- lm(instruction_length_by_letter ~ trial, data= data_100)
anova(model_100_0_l, model_100_l)

# Model 1: instruction_length_by_letter ~ 1
# Model 2: instruction_length_by_letter ~ trial
# Res.Df    RSS Df Sum of Sq      F Pr(>F)
# 1     99 884.51                           
# 2     98 880.98  1     3.532 0.3929 0.5322

################################################################################
# Number of trials= 1000
################################################################################


model_1000_0_l <- lm(instruction_length_by_letter ~ 1, data=data_1000)
model_1000_l <- lm(instruction_length_by_letter ~ trial, data= data_1000)
anova(model_1000_0_l, model_1000_l)
# Model 1: instruction_length_by_letter ~ 1
# Model 2: instruction_length_by_letter ~ trial
# Res.Df   RSS Df Sum of Sq      F  Pr(>F)  
# 1    999 12818                              
# 2    998 12761  1    56.353 4.4072 0.03604 *
summary(model_1000_l)
# Residuals:
#   Min     1Q Median     3Q    Max 
# -5.381 -4.773  2.034  2.812  3.432 
# 
# Coefficients:
#   Estimate Std. Error t value Pr(>|t|)    
# (Intercept) 20.3895796  0.2263266  90.089   <2e-16 ***
#   trial       -0.0008223  0.0003917  -2.099    0.036 *  
#   ---
#   Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# 
# Residual standard error: 3.576 on 998 degrees of freedom
# Multiple R-squared:  0.004397,	Adjusted R-squared:  0.003399 
# F-statistic: 4.407 on 1 and 998 DF,  p-value: 0.03604



