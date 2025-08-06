
from nltk.corpus import wordnet as wn

# To decide which synset should be used for the word "center"
for synset in wn.synsets('center'):
    print(synset.name() + ":", synset.definition())
center = wn.synset("center.n.01").lemma_names()
###################################################################
# used: "center.n.01" : def: an area that is approximately central within some larger region
###################################################################

# To decide which sysnet should be used for the word "up"
# for synset in wn.synsets('up'):
#     print(synset.name() + ":", synset.definition())

up = wn.synset("up.r.01").lemma_names()
###################################################################
# used: "up.r.01" : def:spatially or metaphorically from a lower to a higher position
###################################################################

# To decide which sysnet should be used for the word "right"
# for synset in wn.synsets('right'):
#     print(synset.name() + ":", synset.definition())

right = wn.synset("right_field.n.01").lemma_names()
wn.synset("right_field.n.01").definition()
###################################################################
# used: "right_field.n.01" : def: the piece of ground in the outfield on the catcher's right"
###################################################################
# for synset in wn.synsets('left'):
#     print(synset.name() + ":", synset.definition())

left = wn.synset("left_field.n.01").lemma_names()

###################################################################
# used: "left_field.n.01" : def: the piece of ground in the outfield on the catcher's left
###################################################################


INSTRUCTIONS = {
    "right": right,
    "left": left,
    "center": center,
}