# Analysis

In the analysis I was curious whether the Architect's instructions got shorter over time, based on [McCarthy et al. (2023)](https://github.com/cogtoolslab/compositional-abstractions-tutorial?tab=readme-ov-file), where instructions got more abstract.

## Frequentists analysis

I used linear regression for determine my hypothesis. The Likelihood Ratio Test got only significant at the 1000 trial analyses, this might be only 1000 trial has enough data. The results of the analyses I commented out after the code for readability in the [frequentist.R](analysis/frequentist.R) script. Notably, if we measure instruction length by letters, we obtain more informative results than when measuring by words, because:

1.  Words vary in length — for example, *eye* (3 letters) and *center* (6 letters) both count as 1 word but differ in letter count.

2.  When using `instruction_count_as_letters`, spaces are also counted as letters, which provides additional information about the length of the instruction.

AIC was not calculated since the y (dependent variable) is different.

## Bayesian analysis

I used linear regression, with gaussian family, as recommended in the [brms package's documentation](https://cran.r-project.org/web/packages/brms/refman/brms.html#topic+brm). Noteworthy, all the times the nullmodel was prefered over the alternative model. It can be due to the bayesian's approach is more conservative than the frequentists analyses.

Here BIC was not calculated, neither WAIC, which would be very useful based on [Lei Zhang's lecture](https://www.youtube.com/watch?v=Nw_xIJet5m4&t=4346s).