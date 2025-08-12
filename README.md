# Compositinal Abstraction

This work is based on and inspired by [McCarthy et al. (2023) 's](https://github.com/cogtoolslab/compositional-abstractions-tutorial?tab=readme-ov-file) code. This code simplyfies their experiment. I was curious, whether the Agent prefers shorter instructions over time (see more in the [model's README file](model/README.md)).

The current repository"s strctire is the follwoing:

[model](model/) contains the model, and it's related files (Python). Contains a README file with further explanations.

[analysis](/analysis) contains the frequentists and bayesian analysises (R) and the [requirements](analysis/requirements.R) for the R script. Contains a README file with further explanations.

[plot](plot/) contains a plot's picture about the results. The code for it is located in the [analysis](analysis) folder, due to the renv package.

[python_requirements](python_requirements/) contains the requirements for the python script.