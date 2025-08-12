library(tidyverse)

data_25 <- read.csv("/Users/nemethtamas/Documents/GitHub/compositional_abstraction/data/results_25.csv")
data_100 <- read.csv("/Users/nemethtamas/Documents/GitHub/compositional_abstraction/data/results_100.csv")
data_1000 <- read.csv("/Users/nemethtamas/Documents/GitHub/compositional_abstraction/data/results_1000.csv")

data_25$n_trial <- 25
data_100$n_trial <- 100
data_1000$n_trial <- 1000






ggplot() +
  geom_line(data = data_1000,
            aes(x = round, y = instruction_lenght_by_letter, colour = "1000")) +
  geom_line(data = data_100,
            aes(x = round, y = instruction_lenght_by_letter, colour = "100")) +
  geom_line(data = data_25,
            aes(x = round, y = instruction_lenght_by_letter, colour = "25")) +
  scale_colour_viridis_d(name = "Max number of trials")+
  theme_classic()+
  labs(x= "Number of trials",
       y= "Instruction lneght by letter")+
  theme(
          panel.grid.minor = element_blank(),
          panel.grid.major = element_blank(),
          panel.border = element_blank(),
          axis.line = element_line(),
          plot.background = element_rect(fill = "white"),
          axis.text.x = element_text(color="black", size =30),
          axis.text.y = element_text(color="black", size = 30),
          axis.text = element_text(color="black", size = 30),
          axis.title = element_text(color = "black", size = 30),
          legend.text = element_text(size=30),
          legend.title = element_text(size=30))
