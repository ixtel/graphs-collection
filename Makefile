export

pangraph=$(HOME)/workspace/pangraph/src/pangraph

platonic := src/Platonic/Dodecahedral\
            src/Platonic/Icosahedral\
            src/Platonic/Octahedral\
            src/Platonic/Tetrahedral

.PHONY: all $(platonic)

all: $(platonic)

$(platonic):
	$(MAKE) --directory=$@ $(TARGET)
