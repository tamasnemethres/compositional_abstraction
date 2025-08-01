import pandas as pd
from nltk.corpus import wordnet as wn

# To decide which synset should be used for the word "center"
for synset in wn.synsets('center'):
    print(synset.name() + ":", synset.definition())
center = wn.synset("center.n.01").lemma_names()
###################################################################
# used: "center.n.01" : def: an area that is approximately central within some larger region
###################################################################

# To decide which sysnet should be used for the word "up"
for synset in wn.synsets('up'):
    print(synset.name() + ":", synset.definition())

up = wn.synset("up.r.01").lemma_names()
###################################################################
# used: "up.r.01" : def:spatially or metaphorically from a lower to a higher position
###################################################################




# Here I create synonyims for the Architect's instructions
instructions = {
    center = wn.synsets('center').
}